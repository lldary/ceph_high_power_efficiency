// -*- mode:C++; tab-width:8; c-basic-offset:2; indent-tabs-mode:t -*-
// vim: ts=8 sw=2 smarttab ft=cpp

#include <string.h>
#include <iostream>
#include <map>
#include <algorithm>
#include <tuple>
#include <functional>

#include <boost/algorithm/string/split.hpp>
#include <boost/algorithm/string.hpp>
#include <boost/algorithm/string/predicate.hpp>
#include <boost/variant.hpp>

#include "include/scope_guard.h"
#include "common/Formatter.h"
#include "common/containers.h"
#include "common/split.h"
#include <common/errno.h>
#include "include/random.h"
#include "cls/lock/cls_lock_client.h"
#include "rgw_perf_counters.h"
#include "rgw_common.h"
#include "rgw_bucket.h"
#include "rgw_lc.h"
#include "rgw_zone.h"
#include "rgw_string.h"
#include "rgw_multi.h"
#include "rgw_sal_rados.h"
#include "rgw_rados.h"
#include "rgw_lc_tier.h"
#include "rgw_notify.h"

// this seems safe to use, at least for now--arguably, we should
// prefer header-only fmt, in general
#undef FMT_HEADER_ONLY
#define FMT_HEADER_ONLY 1
#include "fmt/format.h"

#include "services/svc_sys_obj.h"
#include "services/svc_zone.h"
#include "services/svc_tier_rados.h"

#define dout_context g_ceph_context
#define dout_subsys ceph_subsys_rgw

constexpr int32_t hours_in_a_day = 24;
constexpr int32_t secs_in_a_day = hours_in_a_day * 60 * 60;

using namespace std;

const char* LC_STATUS[] = {
      "UNINITIAL",
      "PROCESSING",
      "FAILED",
      "COMPLETE"
};

using namespace librados;

bool LCRule::valid() const
{
  if (id.length() > MAX_ID_LEN) {
    return false;
  }
  else if(expiration.empty() && noncur_expiration.empty() &&
	  mp_expiration.empty() && !dm_expiration &&
          transitions.empty() && noncur_transitions.empty()) {
    return false;
  }
  else if (!expiration.valid() || !noncur_expiration.valid() ||
	   !mp_expiration.valid()) {
    return false;
  }
  if (!transitions.empty()) {
    bool using_days = expiration.has_days();
    bool using_date = expiration.has_date();
    for (const auto& elem : transitions) {
      if (!elem.second.valid()) {
        return false;
      }
      using_days = using_days || elem.second.has_days();
      using_date = using_date || elem.second.has_date();
      if (using_days && using_date) {
        return false;
      }
    }
  }
  for (const auto& elem : noncur_transitions) {
    if (!elem.second.valid()) {
      return false;
    }
  }

  return true;
}

void LCRule::init_simple_days_rule(std::string_view _id,
				   std::string_view _prefix, int num_days)
{
  id = _id;
  prefix = _prefix;
  char buf[32];
  snprintf(buf, sizeof(buf), "%d", num_days);
  expiration.set_days(buf);
  set_enabled(true);
}

void RGWLifecycleConfiguration::add_rule(const LCRule& rule)
{
  auto& id = rule.get_id(); // note that this will return false for groups, but that's ok, we won't search groups
  rule_map.insert(pair<string, LCRule>(id, rule));
}

bool RGWLifecycleConfiguration::_add_rule(const LCRule& rule)
{
  lc_op op(rule.get_id());
  op.status = rule.is_enabled();
  if (rule.get_expiration().has_days()) {
    op.expiration = rule.get_expiration().get_days();
  }
  if (rule.get_expiration().has_date()) {
    op.expiration_date = ceph::from_iso_8601(rule.get_expiration().get_date());
  }
  if (rule.get_noncur_expiration().has_days()) {
    op.noncur_expiration = rule.get_noncur_expiration().get_days();
  }
  if (rule.get_mp_expiration().has_days()) {
    op.mp_expiration = rule.get_mp_expiration().get_days();
  }
  op.dm_expiration = rule.get_dm_expiration();
  for (const auto &elem : rule.get_transitions()) {
    transition_action action;
    if (elem.second.has_days()) {
      action.days = elem.second.get_days();
    } else {
      action.date = ceph::from_iso_8601(elem.second.get_date());
    }
    action.storage_class
      = rgw_placement_rule::get_canonical_storage_class(elem.first);
    op.transitions.emplace(elem.first, std::move(action));
  }
  for (const auto &elem : rule.get_noncur_transitions()) {
    transition_action action;
    action.days = elem.second.get_days();
    action.date = ceph::from_iso_8601(elem.second.get_date());
    action.storage_class
      = rgw_placement_rule::get_canonical_storage_class(elem.first);
    op.noncur_transitions.emplace(elem.first, std::move(action));
  }
  std::string prefix;
  if (rule.get_filter().has_prefix()){
    prefix = rule.get_filter().get_prefix();
  } else {
    prefix = rule.get_prefix();
  }
  if (rule.get_filter().has_tags()){
    op.obj_tags = rule.get_filter().get_tags();
  }
  op.rule_flags = rule.get_filter().get_flags();
  prefix_map.emplace(std::move(prefix), std::move(op));
  return true;
}

int RGWLifecycleConfiguration::check_and_add_rule(const LCRule& rule)
{
  if (!rule.valid()) {
    return -EINVAL;
  }
  auto& id = rule.get_id();
  if (rule_map.find(id) != rule_map.end()) {  //id shouldn't be the same 
    return -EINVAL;
  }
  if (rule.get_filter().has_tags() && (rule.get_dm_expiration() ||
				       !rule.get_mp_expiration().empty())) {
    return -ERR_INVALID_REQUEST;
  }
  rule_map.insert(pair<string, LCRule>(id, rule));

  if (!_add_rule(rule)) {
    return -ERR_INVALID_REQUEST;
  }
  return 0;
}

bool RGWLifecycleConfiguration::has_same_action(const lc_op& first,
						const lc_op& second) {
  if ((first.expiration > 0 || first.expiration_date != boost::none) && 
    (second.expiration > 0 || second.expiration_date != boost::none)) {
    return true;
  } else if (first.noncur_expiration > 0 && second.noncur_expiration > 0) {
    return true;
  } else if (first.mp_expiration > 0 && second.mp_expiration > 0) {
    return true;
  } else if (!first.transitions.empty() && !second.transitions.empty()) {
    for (auto &elem : first.transitions) {
      if (second.transitions.find(elem.first) != second.transitions.end()) {
        return true;
      }
    }
  } else if (!first.noncur_transitions.empty() &&
	     !second.noncur_transitions.empty()) {
    for (auto &elem : first.noncur_transitions) {
      if (second.noncur_transitions.find(elem.first) !=
	  second.noncur_transitions.end()) {
        return true;
      }
    }
  }
  return false;
}

/* Formerly, this method checked for duplicate rules using an invalid
 * method (prefix uniqueness). */
bool RGWLifecycleConfiguration::valid() 
{
  return true;
}

void *RGWLC::LCWorker::entry() {
  do {
    std::unique_ptr<rgw::sal::Bucket> all_buckets; // empty restriction
    utime_t start = ceph_clock_now();
    if (should_work(start)) {
      ldpp_dout(dpp, 2) << "life cycle: start" << dendl;
      int r = lc->process(this, all_buckets, false /* once */);
      if (r < 0) {
        ldpp_dout(dpp, 0) << "ERROR: do life cycle process() returned error r="
			  << r << dendl;
      }
      ldpp_dout(dpp, 2) << "life cycle: stop" << dendl;
      cloud_targets.clear(); // clear cloud targets
    }
    if (lc->going_down())
      break;

    utime_t end = ceph_clock_now();
    int secs = schedule_next_start_time(start, end);
    utime_t next;
    next.set_from_double(end + secs);

    ldpp_dout(dpp, 5) << "schedule life cycle next start time: "
		      << rgw_to_asctime(next) << dendl;

    std::unique_lock l{lock};
    cond.wait_for(l, std::chrono::seconds(secs));
  } while (!lc->going_down());

  return NULL;
}

void RGWLC::initialize(CephContext *_cct, rgw::sal::Store* _store) {
  cct = _cct;
  store = _store;
  sal_lc = store->get_lifecycle();
  max_objs = cct->_conf->rgw_lc_max_objs;
  if (max_objs > HASH_PRIME)
    max_objs = HASH_PRIME;

  obj_names = new string[max_objs];

  for (int i = 0; i < max_objs; i++) {
    obj_names[i] = lc_oid_prefix;
    char buf[32];
    snprintf(buf, 32, ".%d", i);
    obj_names[i].append(buf);
  }

#define COOKIE_LEN 16
  char cookie_buf[COOKIE_LEN + 1];
  gen_rand_alphanumeric(cct, cookie_buf, sizeof(cookie_buf) - 1);
  cookie = cookie_buf;
}

void RGWLC::finalize()
{
  delete[] obj_names;
}

bool RGWLC::if_already_run_today(time_t start_date)
{
  struct tm bdt;
  time_t begin_of_day;
  utime_t now = ceph_clock_now();
  localtime_r(&start_date, &bdt);

  if (cct->_conf->rgw_lc_debug_interval > 0) {
    if (now - start_date < cct->_conf->rgw_lc_debug_interval)
      return true;
    else
      return false;
  }

  bdt.tm_hour = 0;
  bdt.tm_min = 0;
  bdt.tm_sec = 0;
  begin_of_day = mktime(&bdt);
  if (now - begin_of_day < 24*60*60)
    return true;
  else
    return false;
}

static inline std::ostream& operator<<(std::ostream &os, rgw::sal::Lifecycle::LCEntry& ent) {
  os << "<ent: bucket=";
  os << ent.bucket;
  os << "; start_time=";
  os << rgw_to_asctime(utime_t(time_t(ent.start_time), 0));
  os << "; status=";
    os << ent.status;
    os << ">";
    return os;
}

int RGWLC::bucket_lc_prepare(int index, LCWorker* worker)
{
  vector<rgw::sal::Lifecycle::LCEntry> entries;
  string marker;

  ldpp_dout(this, 5) << "RGWLC::bucket_lc_prepare(): PREPARE "
	  << "index: " << index << " worker ix: " << worker->ix
	  << dendl;

#define MAX_LC_LIST_ENTRIES 100
  do {
    int ret = sal_lc->list_entries(obj_names[index], marker, MAX_LC_LIST_ENTRIES, entries);
    if (ret < 0)
      return ret;

    for (auto& entry : entries) {
      entry.start_time = ceph_clock_now();
      entry.status = lc_uninitial; // lc_uninitial? really?
      ret = sal_lc->set_entry(obj_names[index], entry);
      if (ret < 0) {
        ldpp_dout(this, 0)
	  << "RGWLC::bucket_lc_prepare() failed to set entry on "
	  << obj_names[index] << dendl;
        return ret;
      }
    }

    if (! entries.empty()) {
      marker = std::move(entries.back().bucket);
    }
  } while (!entries.empty());

  return 0;
}

static bool obj_has_expired(const DoutPrefixProvider *dpp, CephContext *cct, ceph::real_time mtime, int days,
			    ceph::real_time *expire_time = nullptr)
{
  double timediff, cmp;
  utime_t base_time;
  if (cct->_conf->rgw_lc_debug_interval <= 0) {
    /* Normal case, run properly */
    cmp = double(days) * secs_in_a_day;
    base_time = ceph_clock_now().round_to_day();
  } else {
    /* We're in debug mode; Treat each rgw_lc_debug_interval seconds as a day */
    cmp = double(days)*cct->_conf->rgw_lc_debug_interval;
    base_time = ceph_clock_now();
  }
  auto tt_mtime = ceph::real_clock::to_time_t(mtime);
  timediff = base_time - tt_mtime;

  if (expire_time) {
    *expire_time = mtime + make_timespan(cmp);
  }

  ldpp_dout(dpp, 20) << __func__
		 << "(): mtime=" << mtime << " days=" << days
		 << " base_time=" << base_time << " timediff=" << timediff
		 << " cmp=" << cmp
		 << " is_expired=" << (timediff >= cmp) 
		 << dendl;

  return (timediff >= cmp);
}

static bool pass_object_lock_check(rgw::sal::Store* store, rgw::sal::Object* obj, RGWObjectCtx& ctx, const DoutPrefixProvider *dpp)
{
  if (!obj->get_bucket()->get_info().obj_lock_enabled()) {
    return true;
  }
  std::unique_ptr<rgw::sal::Object::ReadOp> read_op = obj->get_read_op(&ctx);
  int ret = read_op->prepare(null_yield, dpp);
  if (ret < 0) {
    if (ret == -ENOENT) {
      return true;
    } else {
      return false;
    }
  } else {
    auto iter = obj->get_attrs().find(RGW_ATTR_OBJECT_RETENTION);
    if (iter != obj->get_attrs().end()) {
      RGWObjectRetention retention;
      try {
        decode(retention, iter->second);
      } catch (buffer::error& err) {
        ldpp_dout(dpp, 0) << "ERROR: failed to decode RGWObjectRetention"
			       << dendl;
        return false;
      }
      if (ceph::real_clock::to_time_t(retention.get_retain_until_date()) >
	  ceph_clock_now()) {
        return false;
      }
    }
    iter = obj->get_attrs().find(RGW_ATTR_OBJECT_LEGAL_HOLD);
    if (iter != obj->get_attrs().end()) {
      RGWObjectLegalHold obj_legal_hold;
      try {
        decode(obj_legal_hold, iter->second);
      } catch (buffer::error& err) {
        ldpp_dout(dpp, 0) << "ERROR: failed to decode RGWObjectLegalHold"
			       << dendl;
        return false;
      }
      if (obj_legal_hold.is_enabled()) {
        return false;
      }
    }
    return true;
  }
}

class LCObjsLister {
  rgw::sal::Store* store;
  rgw::sal::Bucket* bucket;
  rgw::sal::Bucket::ListParams list_params;
  rgw::sal::Bucket::ListResults list_results;
  string prefix;
  vector<rgw_bucket_dir_entry>::iterator obj_iter;
  rgw_bucket_dir_entry pre_obj;
  int64_t delay_ms;

public:
  LCObjsLister(rgw::sal::Store* _store, rgw::sal::Bucket* _bucket) :
      store(_store), bucket(_bucket) {
    list_params.list_versions = bucket->versioned();
    list_params.allow_unordered = true;
    delay_ms = store->ctx()->_conf.get_val<int64_t>("rgw_lc_thread_delay");
  }

  void set_prefix(const string& p) {
    prefix = p;
    list_params.prefix = prefix;
  }

  int init(const DoutPrefixProvider *dpp) {
    return fetch(dpp);
  }

  int fetch(const DoutPrefixProvider *dpp) {
    int ret = bucket->list(dpp, list_params, 1000, list_results, null_yield);
    if (ret < 0) {
      return ret;
    }

    obj_iter = list_results.objs.begin();

    return 0;
  }

  void delay() {
    std::this_thread::sleep_for(std::chrono::milliseconds(delay_ms));
  }

  bool get_obj(const DoutPrefixProvider *dpp, rgw_bucket_dir_entry **obj,
	       std::function<void(void)> fetch_barrier
	       = []() { /* nada */}) {
    if (obj_iter == list_results.objs.end()) {
      if (!list_results.is_truncated) {
        delay();
        return false;
      } else {
	fetch_barrier();
        list_params.marker = pre_obj.key;
        int ret = fetch(dpp);
        if (ret < 0) {
          ldpp_dout(dpp, 0) << "ERROR: list_op returned ret=" << ret
				 << dendl;
          return false;
        }
      }
      delay();
    }
    /* returning address of entry in objs */
    *obj = &(*obj_iter);
    return obj_iter != list_results.objs.end();
  }

  rgw_bucket_dir_entry get_prev_obj() {
    return pre_obj;
  }

  void next() {
    pre_obj = *obj_iter;
    ++obj_iter;
  }

  boost::optional<std::string> next_key_name() {
    if (obj_iter == list_results.objs.end() ||
	(obj_iter + 1) == list_results.objs.end()) {
      /* this should have been called after get_obj() was called, so this should
       * only happen if is_truncated is false */
      return boost::none;
    }

    return ((obj_iter + 1)->key.name);
  }

}; /* LCObjsLister */

struct op_env {

  using LCWorker = RGWLC::LCWorker;

  lc_op op;
  rgw::sal::Store* store;
  LCWorker* worker;
  rgw::sal::Bucket* bucket;
  LCObjsLister& ol;

  op_env(lc_op& _op, rgw::sal::Store* _store, LCWorker* _worker,
	 rgw::sal::Bucket* _bucket, LCObjsLister& _ol)
    : op(_op), store(_store), worker(_worker), bucket(_bucket),
      ol(_ol) {}
}; /* op_env */

class LCRuleOp;
class WorkQ;

struct lc_op_ctx {
  CephContext *cct;
  op_env env;
  rgw_bucket_dir_entry o;
  boost::optional<std::string> next_key_name;
  ceph::real_time effective_mtime;

  rgw::sal::Store* store;
  rgw::sal::Bucket* bucket;
  lc_op& op; // ok--refers to expanded env.op
  LCObjsLister& ol;

  std::unique_ptr<rgw::sal::Object> obj;
  RGWObjectCtx rctx;
  const DoutPrefixProvider *dpp;
  WorkQ* wq;

  RGWZoneGroupPlacementTier tier = {};

  lc_op_ctx(op_env& env, rgw_bucket_dir_entry& o,
	    boost::optional<std::string> next_key_name,
	    ceph::real_time effective_mtime,
	    const DoutPrefixProvider *dpp, WorkQ* wq)
    : cct(env.store->ctx()), env(env), o(o), next_key_name(next_key_name),
      effective_mtime(effective_mtime),
      store(env.store), bucket(env.bucket), op(env.op), ol(env.ol),
      rctx(env.store), dpp(dpp), wq(wq)
    {
      obj = bucket->get_object(o.key);
    }

  bool next_has_same_name(const std::string& key_name) {
    return (next_key_name && key_name.compare(
	      boost::get<std::string>(next_key_name)) == 0);
  }

}; /* lc_op_ctx */


static std::string lc_id = "rgw lifecycle";
static std::string lc_req_id = "0";

static int remove_expired_obj(
  const DoutPrefixProvider *dpp, lc_op_ctx& oc, bool remove_indeed,
  rgw::notify::EventType event_type)
{
  auto& store = oc.store;
  auto& bucket_info = oc.bucket->get_info();
  auto& o = oc.o;
  auto obj_key = o.key;
  auto& meta = o.meta;
  int ret;
  std::string version_id;

  if (!remove_indeed) {
    obj_key.instance.clear();
  } else if (obj_key.instance.empty()) {
    obj_key.instance = "null";
  }

  std::unique_ptr<rgw::sal::Bucket> bucket;
  std::unique_ptr<rgw::sal::Object> obj;

  ret = store->get_bucket(nullptr, bucket_info, &bucket);
  if (ret < 0) {
    return ret;
  }

  // XXXX currently, rgw::sal::Bucket.owner is always null here
  std::unique_ptr<rgw::sal::User> user;
  if (! bucket->get_owner()) {
    auto& bucket_info = bucket->get_info();
    user = store->get_user(bucket_info.owner);
    // forgive me, lord
    if (user) {
      bucket->set_owner(user.get());
    }
  }

  obj = bucket->get_object(obj_key);
  std::unique_ptr<rgw::sal::Object::DeleteOp> del_op
    = obj->get_delete_op(&oc.rctx);
  del_op->params.versioning_status
    = obj->get_bucket()->get_info().versioning_status();
  del_op->params.obj_owner.set_id(rgw_user {meta.owner});
  del_op->params.obj_owner.set_name(meta.owner_display_name);
  del_op->params.bucket_owner.set_id(bucket_info.owner);
  del_op->params.unmod_since = meta.mtime;
  del_op->params.marker_version_id = version_id;

  std::unique_ptr<rgw::sal::Notification> notify
    = store->get_notification(dpp, obj.get(), nullptr, &oc.rctx, event_type,
			      bucket.get(), lc_id,
			      const_cast<std::string&>(oc.bucket->get_tenant()),
			      lc_req_id, null_yield);

  /* can eliminate cast when reservation is lifted into Notification */
  auto notify_res = static_cast<rgw::sal::RadosNotification*>(notify.get())->get_reservation();

  ret = rgw::notify::publish_reserve(dpp, event_type, notify_res, nullptr);
  if (ret < 0) {
    ldpp_dout(dpp, 1)
      << "ERROR: notify reservation failed, deferring delete of object k="
      << o.key
      << dendl;
    return ret;
  }

  ret =  del_op->delete_obj(dpp, null_yield);
  if (ret < 0) {
    ldpp_dout(dpp, 1) <<
      "ERROR: publishing notification failed, with error: " << ret << dendl;
  } else {
      // send request to notification manager
    (void) rgw::notify::publish_commit(
      obj.get(), obj->get_obj_size(), ceph::real_clock::now(),
      obj->get_attrs()[RGW_ATTR_ETAG].to_str(), version_id, event_type,
      notify_res, dpp);
  }

  return ret;

} /* remove_expired_obj */

class LCOpAction {
public:
  virtual ~LCOpAction() {}

  virtual bool check(lc_op_ctx& oc, ceph::real_time *exp_time, const DoutPrefixProvider *dpp) {
    return false;
  }

  /* called after check(). Check should tell us whether this action
   * is applicable. If there are multiple actions, we'll end up executing
   * the latest applicable action
   * For example:
   *   one action after 10 days, another after 20, third after 40.
   *   After 10 days, the latest applicable action would be the first one,
   *   after 20 days it will be the second one. After 21 days it will still be the
   *   second one. So check() should return true for the second action at that point,
   *   but should_process() if the action has already been applied. In object removal
   *   it doesn't matter, but in object transition it does.
   */
  virtual bool should_process() {
    return true;
  }

  virtual int process(lc_op_ctx& oc) {
    return 0;
  }

  friend class LCOpRule;
}; /* LCOpAction */

class LCOpFilter {
public:
virtual ~LCOpFilter() {}
  virtual bool check(const DoutPrefixProvider *dpp, lc_op_ctx& oc) {
    return false;
  }
}; /* LCOpFilter */

class LCOpRule {
  friend class LCOpAction;

  op_env env;
  boost::optional<std::string> next_key_name;
  ceph::real_time effective_mtime;

  std::vector<shared_ptr<LCOpFilter> > filters; // n.b., sharing ovhd
  std::vector<shared_ptr<LCOpAction> > actions;

public:
  LCOpRule(op_env& _env) : env(_env) {}

  boost::optional<std::string> get_next_key_name() {
    return next_key_name;
  }

  std::vector<shared_ptr<LCOpAction>>& get_actions() {
    return actions;
  }

  void build();
  void update();
  int process(rgw_bucket_dir_entry& o, const DoutPrefixProvider *dpp,
	      WorkQ* wq);
}; /* LCOpRule */

using WorkItem =
  boost::variant<void*,
		 /* out-of-line delete */
		 std::tuple<LCOpRule, rgw_bucket_dir_entry>,
		 /* uncompleted MPU expiration */
		 std::tuple<lc_op, rgw_bucket_dir_entry>,
		 rgw_bucket_dir_entry>;

class WorkQ : public Thread
{
public:
  using unique_lock = std::unique_lock<std::mutex>;
  using work_f = std::function<void(RGWLC::LCWorker*, WorkQ*, WorkItem&)>;
  using dequeue_result = boost::variant<void*, WorkItem>;

  static constexpr uint32_t FLAG_NONE =        0x0000;
  static constexpr uint32_t FLAG_EWAIT_SYNC =  0x0001;
  static constexpr uint32_t FLAG_DWAIT_SYNC =  0x0002;
  static constexpr uint32_t FLAG_EDRAIN_SYNC = 0x0004;

private:
  const work_f bsf = [](RGWLC::LCWorker* wk, WorkQ* wq, WorkItem& wi) {};
  RGWLC::LCWorker* wk;
  uint32_t qmax;
  int ix;
  std::mutex mtx;
  std::condition_variable cv;
  uint32_t flags;
  vector<WorkItem> items;
  work_f f;

public:
  WorkQ(RGWLC::LCWorker* wk, uint32_t ix, uint32_t qmax)
    : wk(wk), qmax(qmax), ix(ix), flags(FLAG_NONE), f(bsf)
    {
      create(thr_name().c_str());
    }

  std::string thr_name() {
    return std::string{"wp_thrd: "}
    + std::to_string(wk->ix) + ", " + std::to_string(ix);
  }

  void setf(work_f _f) {
    f = _f;
  }

  void enqueue(WorkItem&& item) {
    unique_lock uniq(mtx);
    while ((!wk->get_lc()->going_down()) &&
	   (items.size() > qmax)) {
      flags |= FLAG_EWAIT_SYNC;
      cv.wait_for(uniq, 200ms);
    }
    items.push_back(item);
    if (flags & FLAG_DWAIT_SYNC) {
      flags &= ~FLAG_DWAIT_SYNC;
      cv.notify_one();
    }
  }

  void drain() {
    unique_lock uniq(mtx);
    flags |= FLAG_EDRAIN_SYNC;
    while (flags & FLAG_EDRAIN_SYNC) {
      cv.wait_for(uniq, 200ms);
    }
  }

private:
  dequeue_result dequeue() {
    unique_lock uniq(mtx);
    while ((!wk->get_lc()->going_down()) &&
	   (items.size() == 0)) {
      /* clear drain state, as we are NOT doing work and qlen==0 */
      if (flags & FLAG_EDRAIN_SYNC) {
	flags &= ~FLAG_EDRAIN_SYNC;
      }
      flags |= FLAG_DWAIT_SYNC;
      cv.wait_for(uniq, 200ms);
    }
    if (items.size() > 0) {
      auto item = items.back();
      items.pop_back();
      if (flags & FLAG_EWAIT_SYNC) {
	flags &= ~FLAG_EWAIT_SYNC;
	cv.notify_one();
      }
      return {item};
    }
    return nullptr;
  }

  void* entry() override {
    while (!wk->get_lc()->going_down()) {
      auto item = dequeue();
      if (item.which() == 0) {
	/* going down */
	break;
      }
      f(wk, this, boost::get<WorkItem>(item));
    }
    return nullptr;
  }
}; /* WorkQ */

class RGWLC::WorkPool
{
  using TVector = ceph::containers::tiny_vector<WorkQ, 3>;
  TVector wqs;
  uint64_t ix;

public:
  WorkPool(RGWLC::LCWorker* wk, uint16_t n_threads, uint32_t qmax)
    : wqs(TVector{
	n_threads,
	[&](const size_t ix, auto emplacer) {
	  emplacer.emplace(wk, ix, qmax);
	}}),
      ix(0)
    {}

  ~WorkPool() {
    for (auto& wq : wqs) {
      wq.join();
    }
  }

  void setf(WorkQ::work_f _f) {
    for (auto& wq : wqs) {
      wq.setf(_f);
    }
  }

  void enqueue(WorkItem item) {
    const auto tix = ix;
    ix = (ix+1) % wqs.size();
    (wqs[tix]).enqueue(std::move(item));
  }

  void drain() {
    for (auto& wq : wqs) {
      wq.drain();
    }
  }
}; /* WorkPool */

RGWLC::LCWorker::LCWorker(const DoutPrefixProvider* dpp, CephContext *cct,
			  RGWLC *lc, int ix)
  : dpp(dpp), cct(cct), lc(lc), ix(ix)
{
  auto wpw = cct->_conf.get_val<int64_t>("rgw_lc_max_wp_worker");
  workpool = new WorkPool(this, wpw, 512);
}

static inline bool worker_should_stop(time_t stop_at, bool once)
{
  return !once && stop_at < time(nullptr);
}

int RGWLC::handle_multipart_expiration(rgw::sal::Bucket* target,
				       const multimap<string, lc_op>& prefix_map,
				       LCWorker* worker, time_t stop_at, bool once)
{
  MultipartMetaFilter mp_filter;
  int ret;
  rgw::sal::Bucket::ListParams params;
  rgw::sal::Bucket::ListResults results;
  auto delay_ms = cct->_conf.get_val<int64_t>("rgw_lc_thread_delay");
  params.list_versions = false;
  /* lifecycle processing does not depend on total order, so can
   * take advantage of unordered listing optimizations--such as
   * operating on one shard at a time */
  params.allow_unordered = true;
  params.ns = RGW_OBJ_NS_MULTIPART;
  params.access_list_filter = &mp_filter;

  auto pf = [&](RGWLC::LCWorker* wk, WorkQ* wq, WorkItem& wi) {
    auto wt = boost::get<std::tuple<lc_op, rgw_bucket_dir_entry>>(wi);
    auto& [rule, obj] = wt;
    if (obj_has_expired(this, cct, obj.meta.mtime, rule.mp_expiration)) {
      rgw_obj_key key(obj.key);
      std::unique_ptr<rgw::sal::MultipartUpload> mpu = target->get_multipart_upload(key.name);
      RGWObjectCtx rctx(store);
      int ret = mpu->abort(this, cct, &rctx);
      if (ret == 0) {
        if (perfcounter) {
          perfcounter->inc(l_rgw_lc_abort_mpu, 1);
        }
      } else {
	if (ret == -ERR_NO_SUCH_UPLOAD) {
	  ldpp_dout(wk->get_lc(), 5)
	    << "ERROR: abort_multipart_upload failed, ret=" << ret
	    << ", thread:" << wq->thr_name()
	    << ", meta:" << obj.key
	    << dendl;
	} else {
	  ldpp_dout(wk->get_lc(), 0)
	    << "ERROR: abort_multipart_upload failed, ret=" << ret
	    << ", thread:" << wq->thr_name()
	    << ", meta:" << obj.key
	    << dendl;
	}
      } /* abort failed */
    } /* expired */
  };

  worker->workpool->setf(pf);

  for (auto prefix_iter = prefix_map.begin(); prefix_iter != prefix_map.end();
       ++prefix_iter) {

    if (worker_should_stop(stop_at, once)) {
      ldpp_dout(this, 5) << __func__ << " interval budget EXPIRED worker "
		     << worker->ix
		     << dendl;
      return 0;
    }

    if (!prefix_iter->second.status || prefix_iter->second.mp_expiration <= 0) {
      continue;
    }
    params.prefix = prefix_iter->first;
    do {
      auto offset = 0;
      results.objs.clear();
      ret = target->list(this, params, 1000, results, null_yield);
      if (ret < 0) {
          if (ret == (-ENOENT))
            return 0;
          ldpp_dout(this, 0) << "ERROR: store->list_objects():" <<dendl;
          return ret;
      }

      for (auto obj_iter = results.objs.begin(); obj_iter != results.objs.end(); ++obj_iter, ++offset) {
	std::tuple<lc_op, rgw_bucket_dir_entry> t1 =
	  {prefix_iter->second, *obj_iter};
	worker->workpool->enqueue(WorkItem{t1});
	if (going_down()) {
	  return 0;
	}
      } /* for objs */

      if ((offset % 100) == 0) {
	if (worker_should_stop(stop_at, once)) {
	  ldpp_dout(this, 5) << __func__ << " interval budget EXPIRED worker "
			     << worker->ix
			     << dendl;
	  return 0;
	}
      }

      std::this_thread::sleep_for(std::chrono::milliseconds(delay_ms));
    } while(results.is_truncated);
  } /* for prefix_map */

  worker->workpool->drain();
  return 0;
} /* RGWLC::handle_multipart_expiration */

static int read_obj_tags(const DoutPrefixProvider *dpp, rgw::sal::Object* obj, RGWObjectCtx& ctx, bufferlist& tags_bl)
{
  std::unique_ptr<rgw::sal::Object::ReadOp> rop = obj->get_read_op(&ctx);

  return rop->get_attr(dpp, RGW_ATTR_TAGS, tags_bl, null_yield);
}

static bool is_valid_op(const lc_op& op)
{
      return (op.status &&
              (op.expiration > 0
               || op.expiration_date != boost::none
               || op.noncur_expiration > 0
               || op.dm_expiration
               || !op.transitions.empty()
               || !op.noncur_transitions.empty()));
}

static bool zone_check(const lc_op& op, rgw::sal::Zone* zone)
{

  if (zone->get_tier_type() == "archive") {
    return (op.rule_flags & uint32_t(LCFlagType::ArchiveZone));
  } else {
    return (! (op.rule_flags & uint32_t(LCFlagType::ArchiveZone)));
  }
}

static inline bool has_all_tags(const lc_op& rule_action,
				const RGWObjTags& object_tags)
{
  if(! rule_action.obj_tags)
    return false;
  if(object_tags.count() < rule_action.obj_tags->count())
    return false;
  size_t tag_count = 0;
  for (const auto& tag : object_tags.get_tags()) {
    const auto& rule_tags = rule_action.obj_tags->get_tags();
    const auto& iter = rule_tags.find(tag.first);
    if(iter == rule_tags.end())
        continue;
    if(iter->second == tag.second)
    {
      tag_count++;
    }
  /* all tags in the rule appear in obj tags */
  }
  return tag_count == rule_action.obj_tags->count();
}

static int check_tags(const DoutPrefixProvider *dpp, lc_op_ctx& oc, bool *skip)
{
  auto& op = oc.op;

  if (op.obj_tags != boost::none) {
    *skip = true;

    bufferlist tags_bl;
    int ret = read_obj_tags(dpp, oc.obj.get(), oc.rctx, tags_bl);
    if (ret < 0) {
      if (ret != -ENODATA) {
        ldpp_dout(oc.dpp, 5) << "ERROR: read_obj_tags returned r="
			 << ret << " " << oc.wq->thr_name() << dendl;
      }
      return 0;
    }
    RGWObjTags dest_obj_tags;
    try {
      auto iter = tags_bl.cbegin();
      dest_obj_tags.decode(iter);
    } catch (buffer::error& err) {
      ldpp_dout(oc.dpp,0) << "ERROR: caught buffer::error, couldn't decode TagSet "
		      << oc.wq->thr_name() << dendl;
      return -EIO;
    }

    if (! has_all_tags(op, dest_obj_tags)) {
      ldpp_dout(oc.dpp, 20) << __func__ << "() skipping obj " << oc.obj
			<< " as tags do not match in rule: "
			<< op.id << " "
			<< oc.wq->thr_name() << dendl;
      return 0;
    }
  }
  *skip = false;
  return 0;
}

class LCOpFilter_Tags : public LCOpFilter {
public:
  bool check(const DoutPrefixProvider *dpp, lc_op_ctx& oc) override {
    auto& o = oc.o;

    if (o.is_delete_marker()) {
      return true;
    }

    bool skip;

    int ret = check_tags(dpp, oc, &skip);
    if (ret < 0) {
      if (ret == -ENOENT) {
        return false;
      }
      ldpp_dout(oc.dpp, 0) << "ERROR: check_tags on obj=" << oc.obj
		       << " returned ret=" << ret << " "
		       << oc.wq->thr_name() << dendl;
      return false;
    }

    return !skip;
  };
};

class LCOpAction_CurrentExpiration : public LCOpAction {
public:
  LCOpAction_CurrentExpiration(op_env& env) {}

  bool check(lc_op_ctx& oc, ceph::real_time *exp_time, const DoutPrefixProvider *dpp) override {
    auto& o = oc.o;
    if (!o.is_current()) {
      ldpp_dout(dpp, 20) << __func__ << "(): key=" << o.key
			<< ": not current, skipping "
			<< oc.wq->thr_name() << dendl;
      return false;
    }
    if (o.is_delete_marker()) {
      std::string nkn;
      if (oc.next_key_name) nkn = *oc.next_key_name;
      if (oc.next_has_same_name(o.key.name)) {
	ldpp_dout(dpp, 7) << __func__ << "(): dm-check SAME: key=" << o.key
		       << " next_key_name: %%" << nkn << "%% "
		       << oc.wq->thr_name() << dendl;
	return false;
      } else {
	ldpp_dout(dpp, 7) << __func__ << "(): dm-check DELE: key=" << o.key
			 << " next_key_name: %%" << nkn << "%% "
			 << oc.wq->thr_name() << dendl;
        *exp_time = real_clock::now();
        return true;
      }
    }

    auto& mtime = o.meta.mtime;
    bool is_expired;
    auto& op = oc.op;
    if (op.expiration <= 0) {
      if (op.expiration_date == boost::none) {
        ldpp_dout(dpp, 20) << __func__ << "(): key=" << o.key
			  << ": no expiration set in rule, skipping "
			  << oc.wq->thr_name() << dendl;
        return false;
      }
      is_expired = ceph_clock_now() >=
	ceph::real_clock::to_time_t(*op.expiration_date);
      *exp_time = *op.expiration_date;
    } else {
      is_expired = obj_has_expired(dpp, oc.cct, mtime, op.expiration, exp_time);
    }

    ldpp_dout(dpp, 20) << __func__ << "(): key=" << o.key << ": is_expired="
		      << (int)is_expired << " "
		      << oc.wq->thr_name() << dendl;
    return is_expired;
  }

  int process(lc_op_ctx& oc) {
    auto& o = oc.o;
    int r;
    if (o.is_delete_marker()) {
      r = remove_expired_obj(oc.dpp, oc, true,
			     rgw::notify::ObjectExpirationDeleteMarker);
      if (r < 0) {
	ldpp_dout(oc.dpp, 0) << "ERROR: current is-dm remove_expired_obj "
			 << oc.bucket << ":" << o.key
			 << " " << cpp_strerror(r) << " "
			 << oc.wq->thr_name() << dendl;
      return r;
      }
      ldpp_dout(oc.dpp, 2) << "DELETED: current is-dm "
		       << oc.bucket << ":" << o.key
		       << " " << oc.wq->thr_name() << dendl;
    } else {
      /* ! o.is_delete_marker() */
      r = remove_expired_obj(oc.dpp, oc, !oc.bucket->versioned(),
			     rgw::notify::ObjectExpirationCurrent);
      if (r < 0) {
	ldpp_dout(oc.dpp, 0) << "ERROR: remove_expired_obj "
			 << oc.bucket << ":" << o.key
			 << " " << cpp_strerror(r) << " "
			 << oc.wq->thr_name() << dendl;
	return r;
      }
      if (perfcounter) {
        perfcounter->inc(l_rgw_lc_expire_current, 1);
      }
      ldpp_dout(oc.dpp, 2) << "DELETED:" << oc.bucket << ":" << o.key
		       << " " << oc.wq->thr_name() << dendl;
    }
    return 0;
  }
};

class LCOpAction_NonCurrentExpiration : public LCOpAction {
protected:
public:
  LCOpAction_NonCurrentExpiration(op_env& env)
    {}

  bool check(lc_op_ctx& oc, ceph::real_time *exp_time, const DoutPrefixProvider *dpp) override {
    auto& o = oc.o;
    if (o.is_current()) {
      ldpp_dout(dpp, 20) << __func__ << "(): key=" << o.key
			<< ": current version, skipping "
			<< oc.wq->thr_name() << dendl;
      return false;
    }

    int expiration = oc.op.noncur_expiration;
    bool is_expired = obj_has_expired(dpp, oc.cct, oc.effective_mtime, expiration,
				      exp_time);

    ldpp_dout(dpp, 20) << __func__ << "(): key=" << o.key << ": is_expired="
		      << is_expired << " "
		      << oc.wq->thr_name() << dendl;

    return is_expired &&
      pass_object_lock_check(oc.store, oc.obj.get(), oc.rctx, dpp);
  }

  int process(lc_op_ctx& oc) {
    auto& o = oc.o;
    int r = remove_expired_obj(oc.dpp, oc, true,
			       rgw::notify::ObjectExpirationNoncurrent);
    if (r < 0) {
      ldpp_dout(oc.dpp, 0) << "ERROR: remove_expired_obj (non-current expiration) " 
		       << oc.bucket << ":" << o.key
		       << " " << cpp_strerror(r)
		       << " " << oc.wq->thr_name() << dendl;
      return r;
    }
    if (perfcounter) {
      perfcounter->inc(l_rgw_lc_expire_noncurrent, 1);
    }
    ldpp_dout(oc.dpp, 2) << "DELETED:" << oc.bucket << ":" << o.key
		     << " (non-current expiration) "
		     << oc.wq->thr_name() << dendl;
    return 0;
  }
};

class LCOpAction_DMExpiration : public LCOpAction {
public:
  LCOpAction_DMExpiration(op_env& env) {}

  bool check(lc_op_ctx& oc, ceph::real_time *exp_time, const DoutPrefixProvider *dpp) override {
    auto& o = oc.o;
    if (!o.is_delete_marker()) {
      ldpp_dout(dpp, 20) << __func__ << "(): key=" << o.key
			<< ": not a delete marker, skipping "
			<< oc.wq->thr_name() << dendl;
      return false;
    }
    if (oc.next_has_same_name(o.key.name)) {
      ldpp_dout(dpp, 20) << __func__ << "(): key=" << o.key
			<< ": next is same object, skipping "
			<< oc.wq->thr_name() << dendl;
      return false;
    }

    *exp_time = real_clock::now();

    return true;
  }

  int process(lc_op_ctx& oc) {
    auto& o = oc.o;
    int r = remove_expired_obj(oc.dpp, oc, true,
			       rgw::notify::ObjectExpirationDeleteMarker);
    if (r < 0) {
      ldpp_dout(oc.dpp, 0) << "ERROR: remove_expired_obj (delete marker expiration) "
		       << oc.bucket << ":" << o.key
		       << " " << cpp_strerror(r)
		       << " " << oc.wq->thr_name()
		       << dendl;
      return r;
    }
    if (perfcounter) {
      perfcounter->inc(l_rgw_lc_expire_dm, 1);
    }
    ldpp_dout(oc.dpp, 2) << "DELETED:" << oc.bucket << ":" << o.key
		     << " (delete marker expiration) "
		     << oc.wq->thr_name() << dendl;
    return 0;
  }
};

class LCOpAction_Transition : public LCOpAction {
  const transition_action& transition;
  bool need_to_process{false};

protected:
  virtual bool check_current_state(bool is_current) = 0;
  virtual ceph::real_time get_effective_mtime(lc_op_ctx& oc) = 0;
public:
  LCOpAction_Transition(const transition_action& _transition)
    : transition(_transition) {}

  bool check(lc_op_ctx& oc, ceph::real_time *exp_time, const DoutPrefixProvider *dpp) override {
    auto& o = oc.o;

    if (o.is_delete_marker()) {
      return false;
    }

    if (!check_current_state(o.is_current())) {
      return false;
    }

    auto mtime = get_effective_mtime(oc);
    bool is_expired;
    if (transition.days < 0) {
      if (transition.date == boost::none) {
        ldpp_dout(dpp, 20) << __func__ << "(): key=" << o.key
			  << ": no transition day/date set in rule, skipping "
			  << oc.wq->thr_name() << dendl;
        return false;
      }
      is_expired = ceph_clock_now() >=
	ceph::real_clock::to_time_t(*transition.date);
      *exp_time = *transition.date;
    } else {
      is_expired = obj_has_expired(dpp, oc.cct, mtime, transition.days, exp_time);
    }

    ldpp_dout(oc.dpp, 20) << __func__ << "(): key=" << o.key << ": is_expired="
		      << is_expired << " "
		      << oc.wq->thr_name() << dendl;

    need_to_process =
      (rgw_placement_rule::get_canonical_storage_class(o.meta.storage_class) !=
       transition.storage_class);

    return is_expired;
  }

  bool should_process() override {
    return need_to_process;
  }

  /* find out if the the storage class is remote cloud */
  int get_tier_target(const RGWZoneGroup &zonegroup, const rgw_placement_rule& rule,
                      RGWZoneGroupPlacementTier &tier) {
    std::map<std::string, RGWZoneGroupPlacementTarget>::const_iterator titer;
    titer = zonegroup.placement_targets.find(rule.name);
    if (titer == zonegroup.placement_targets.end()) {
      return -ENOENT;
    }

    const auto& target_rule = titer->second;
    std::map<std::string, RGWZoneGroupPlacementTier>::const_iterator ttier;
    ttier = target_rule.tier_targets.find(rule.storage_class);
    if (ttier != target_rule.tier_targets.end()) {
      tier = ttier->second;
    } else { // not found
      return -ENOENT;
    }
    return 0;
  }

  int delete_tier_obj(lc_op_ctx& oc) {
    int ret = 0;

    /* If bucket is versioned, create delete_marker for current version
     */
    if (oc.bucket->versioned() && oc.o.is_current() && !oc.o.is_delete_marker()) {
      ret = remove_expired_obj(oc.dpp, oc, false, rgw::notify::ObjectExpiration);
      ldpp_dout(oc.dpp, 20) << "delete_tier_obj Object(key:" << oc.o.key << ") current & not delete_marker" << " versioned_epoch:  " << oc.o.versioned_epoch << "flags: " << oc.o.flags << dendl;
    } else {
      ret = remove_expired_obj(oc.dpp, oc, true, rgw::notify::ObjectExpiration);
      ldpp_dout(oc.dpp, 20) << "delete_tier_obj Object(key:" << oc.o.key << ") not current " << "versioned_epoch:  " << oc.o.versioned_epoch << "flags: " << oc.o.flags << dendl;
    }
    return ret;
  }

  int update_tier_obj(lc_op_ctx& oc, RGWLCCloudTierCtx& tier_ctx) {

    map<string, bufferlist> attrs;
    int r = 0;

    real_time read_mtime;

    std::unique_ptr<rgw::sal::Object::ReadOp> read_op(oc.obj->get_read_op(&oc.rctx));

    read_op->params.lastmod = &read_mtime;

    r = read_op->prepare(null_yield, oc.dpp);
    if (r < 0) {
      return r;
    }

    if (read_mtime != tier_ctx.o.meta.mtime) {
      /* raced */
      return -ECANCELED;
    }

    attrs = oc.obj->get_attrs();
    
    rgw::sal::RadosStore *rados = static_cast<rgw::sal::RadosStore*>(oc.store);
    RGWRados::Object op_target(rados->getRados(), oc.bucket->get_info(), oc.rctx, oc.obj->get_obj());
    RGWRados::Object::Write obj_op(&op_target);

    obj_op.meta.modify_tail = true;
    obj_op.meta.flags = PUT_OBJ_CREATE;
    obj_op.meta.category = RGWObjCategory::CloudTiered;
    obj_op.meta.delete_at = real_time();
    bufferlist blo;
    obj_op.meta.data = &blo;
    obj_op.meta.if_match = NULL;
    obj_op.meta.if_nomatch = NULL;
    obj_op.meta.user_data = NULL;
    obj_op.meta.zones_trace = NULL;
    obj_op.meta.delete_at = real_time();
    obj_op.meta.olh_epoch = tier_ctx.o.versioned_epoch;
    
    RGWObjManifest *pmanifest; 
    RGWObjManifest manifest;

    pmanifest = &manifest;
    RGWObjTier tier_config;
    tier_config.name = oc.tier.storage_class;
    tier_config.tier_placement = oc.tier;
    tier_config.is_multipart_upload = tier_ctx.is_multipart_upload;

    pmanifest->set_tier_type("cloud-s3");
    pmanifest->set_tier_config(tier_config);

    /* check if its necessary */
    rgw_placement_rule target_placement;
    target_placement.inherit_from(tier_ctx.bucket_info.placement_rule);
    target_placement.storage_class = oc.tier.storage_class;
    pmanifest->set_head(target_placement, tier_ctx.obj->get_obj(), 0);

    pmanifest->set_tail_placement(target_placement, tier_ctx.obj->get_obj().bucket);

    pmanifest->set_obj_size(0);

    obj_op.meta.manifest = pmanifest;

    /* update storage class */
    bufferlist bl;
    bl.append(oc.tier.storage_class);
    attrs[RGW_ATTR_STORAGE_CLASS] = bl;

    attrs.erase(RGW_ATTR_ID_TAG);
    attrs.erase(RGW_ATTR_TAIL_TAG);

    r = obj_op.write_meta(oc.dpp, 0, 0, attrs, null_yield);
    if (r < 0) {
      return r;
    }

    return 0;
  }

  int transition_obj_to_cloud(lc_op_ctx& oc) {
    /* init */
    string id = "cloudid";
    string endpoint = oc.tier.t.s3.endpoint;
    RGWAccessKey key = oc.tier.t.s3.key;
    string region = oc.tier.t.s3.region;
    HostStyle host_style = oc.tier.t.s3.host_style;
    string bucket_name = oc.tier.t.s3.target_path;
    const RGWZoneGroup& zonegroup = oc.store->get_zone()->get_zonegroup();
    bool delete_object;
   
    /* If CurrentVersion object, remove it & create delete marker */
    delete_object = (!oc.tier.retain_head_object ||
                     (oc.o.is_current() && oc.bucket->versioned()));

    if (bucket_name.empty()) {
      bucket_name = "rgwx-" + zonegroup.get_name() + "-" + oc.tier.storage_class +
                    "-cloud-bucket";
      boost::algorithm::to_lower(bucket_name);
    }

    /* Create RGW REST connection */
    S3RESTConn conn(oc.cct, oc.store, id, { endpoint }, key, region, host_style);

    RGWLCCloudTierCtx tier_ctx(oc.cct, oc.dpp, oc.o, oc.store, oc.bucket->get_info(),
                        oc.obj.get(), oc.rctx, conn, bucket_name,
                        oc.tier.t.s3.target_storage_class);
    tier_ctx.acl_mappings = oc.tier.t.s3.acl_mappings;
    tier_ctx.multipart_min_part_size = oc.tier.t.s3.multipart_min_part_size;
    tier_ctx.multipart_sync_threshold = oc.tier.t.s3.multipart_sync_threshold;
    tier_ctx.storage_class = oc.tier.storage_class;

    std::set<std::string>& cloud_targets = oc.env.worker->get_cloud_targets();

    ldpp_dout(oc.dpp, 0) << "Transitioning object(" << oc.o.key << ") to the cloud endpoint(" << endpoint << ")" << dendl;

    /* Transition object to cloud end point */
    int ret = rgw_cloud_tier_transfer_object(tier_ctx, cloud_targets);

    if (ret < 0) {
      ldpp_dout(oc.dpp, 0) << "ERROR: failed to transfer object(" << oc.o.key << ") to the cloud endpoint(" << endpoint << ") ret=" << ret << dendl;
      return ret;
    }

    if (delete_object) {
      ret = delete_tier_obj(oc);
      if (ret < 0) {
        ldpp_dout(oc.dpp, 0) << "ERROR: Deleting tier object(" << oc.o.key << ") failed ret=" << ret << dendl;
        return ret;
      }
    } else {
      ret = update_tier_obj(oc, tier_ctx);
      if (ret < 0) {
        ldpp_dout(oc.dpp, 0) << "ERROR: Updating tier object(" << oc.o.key << ") failed ret=" << ret << dendl;
        return ret;
      }
    }

    return 0;
  }

  int process(lc_op_ctx& oc) {
    auto& o = oc.o;
    int r;

    if (oc.o.meta.category == RGWObjCategory::CloudTiered) {
      /* Skip objects which are already cloud tiered. */
      ldpp_dout(oc.dpp, 30) << "Object(key:" << oc.o.key << ") is already cloud tiered to cloud-s3 tier: " << oc.o.meta.storage_class << dendl;
      return 0;
    }

    std::string tier_type = ""; 
    const RGWZoneGroup& zonegroup = oc.store->get_zone()->get_zonegroup();

    rgw_placement_rule target_placement;
    target_placement.inherit_from(oc.bucket->get_placement_rule());
    target_placement.storage_class = transition.storage_class;

    r = get_tier_target(zonegroup, target_placement, oc.tier);

    if (!r && oc.tier.tier_type == "cloud-s3") {
      ldpp_dout(oc.dpp, 30) << "Found cloud s3 tier: " << target_placement.storage_class << dendl;
      if (!oc.o.is_current() &&
          !pass_object_lock_check(oc.store, oc.obj.get(), oc.rctx, oc.dpp)) {
        /* Skip objects which has object lock enabled. */
        ldpp_dout(oc.dpp, 10) << "Object(key:" << oc.o.key << ") is locked. Skipping transition to cloud-s3 tier: " << target_placement.storage_class << dendl;
        return 0;
      }

      /* Allow transition for only RadosStore */
      rgw::sal::RadosStore *rados = dynamic_cast<rgw::sal::RadosStore*>(oc.store);

      if (!rados) {
        ldpp_dout(oc.dpp, 10) << "Object(key:" << oc.o.key << ") is not on RadosStore. Skipping transition to cloud-s3 tier: " << target_placement.storage_class << dendl;
        return -1;
      }

      r = transition_obj_to_cloud(oc);
      if (r < 0) {
        ldpp_dout(oc.dpp, 0) << "ERROR: failed to transition obj(key:" << oc.o.key << ") to cloud (r=" << r << ")"
                             << dendl;
        return r;
      }
    } else {
      if (!oc.store->get_zone()->get_params().
  	    valid_placement(target_placement)) {
        ldpp_dout(oc.dpp, 0) << "ERROR: non existent dest placement: "
	  		     << target_placement
                             << " bucket="<< oc.bucket
                             << " rule_id=" << oc.op.id
			     << " " << oc.wq->thr_name() << dendl;
        return -EINVAL;
      }

      int r = oc.obj->transition(oc.rctx, oc.bucket, target_placement, o.meta.mtime,
	  		         o.versioned_epoch, oc.dpp, null_yield);
      if (r < 0) {
        ldpp_dout(oc.dpp, 0) << "ERROR: failed to transition obj " 
			     << oc.bucket << ":" << o.key 
			     << " -> " << transition.storage_class 
			     << " " << cpp_strerror(r)
			     << " " << oc.wq->thr_name() << dendl;
        return r;
      }
    }
    ldpp_dout(oc.dpp, 2) << "TRANSITIONED:" << oc.bucket
			 << ":" << o.key << " -> "
			 << transition.storage_class
			 << " " << oc.wq->thr_name() << dendl;
    return 0;
  }
};

class LCOpAction_CurrentTransition : public LCOpAction_Transition {
protected:
  bool check_current_state(bool is_current) override {
    return is_current;
  }

  ceph::real_time get_effective_mtime(lc_op_ctx& oc) override {
    return oc.o.meta.mtime;
  }
public:
  LCOpAction_CurrentTransition(const transition_action& _transition)
    : LCOpAction_Transition(_transition) {}
    int process(lc_op_ctx& oc) {
      int r = LCOpAction_Transition::process(oc);
      if (r == 0) {
        if (perfcounter) {
          perfcounter->inc(l_rgw_lc_transition_current, 1);
        }
      }
      return r;
    }
};

class LCOpAction_NonCurrentTransition : public LCOpAction_Transition {
protected:
  bool check_current_state(bool is_current) override {
    return !is_current;
  }

  ceph::real_time get_effective_mtime(lc_op_ctx& oc) override {
    return oc.effective_mtime;
  }
public:
  LCOpAction_NonCurrentTransition(op_env& env,
				  const transition_action& _transition)
    : LCOpAction_Transition(_transition)
    {}
    int process(lc_op_ctx& oc) {
      int r = LCOpAction_Transition::process(oc);
      if (r == 0) {
        if (perfcounter) {
          perfcounter->inc(l_rgw_lc_transition_noncurrent, 1);
        }
      }
      return r;
    }
};

void LCOpRule::build()
{
  filters.emplace_back(new LCOpFilter_Tags);

  auto& op = env.op;

  if (op.expiration > 0 ||
      op.expiration_date != boost::none) {
    actions.emplace_back(new LCOpAction_CurrentExpiration(env));
  }

  if (op.dm_expiration) {
    actions.emplace_back(new LCOpAction_DMExpiration(env));
  }

  if (op.noncur_expiration > 0) {
    actions.emplace_back(new LCOpAction_NonCurrentExpiration(env));
  }

  for (auto& iter : op.transitions) {
    actions.emplace_back(new LCOpAction_CurrentTransition(iter.second));
  }

  for (auto& iter : op.noncur_transitions) {
    actions.emplace_back(new LCOpAction_NonCurrentTransition(env, iter.second));
  }
}

void LCOpRule::update()
{
  next_key_name = env.ol.next_key_name();
  effective_mtime = env.ol.get_prev_obj().meta.mtime;
}

int LCOpRule::process(rgw_bucket_dir_entry& o,
		      const DoutPrefixProvider *dpp,
		      WorkQ* wq)
{
  lc_op_ctx ctx(env, o, next_key_name, effective_mtime, dpp, wq);
  shared_ptr<LCOpAction> *selected = nullptr; // n.b., req'd by sharing
  real_time exp;

  for (auto& a : actions) {
    real_time action_exp;

    if (a->check(ctx, &action_exp, dpp)) {
      if (action_exp > exp) {
        exp = action_exp;
        selected = &a;
      }
    }
  }

  if (selected &&
      (*selected)->should_process()) {

    /*
     * Calling filter checks after action checks because
     * all action checks (as they are implemented now) do
     * not access the objects themselves, but return result
     * from info from bucket index listing. The current tags filter
     * check does access the objects, so we avoid unnecessary rados calls
     * having filters check later in the process.
     */

    bool cont = false;
    for (auto& f : filters) {
      if (f->check(dpp, ctx)) {
        cont = true;
        break;
      }
    }

    if (!cont) {
      ldpp_dout(dpp, 20) << __func__ << "(): key=" << o.key
			 << ": no rule match, skipping "
			 << wq->thr_name() << dendl;
      return 0;
    }

    int r = (*selected)->process(ctx);
    if (r < 0) {
      ldpp_dout(dpp, 0) << "ERROR: remove_expired_obj " 
			<< env.bucket << ":" << o.key
			<< " " << cpp_strerror(r)
			<< " " << wq->thr_name() << dendl;
      return r;
    }
    ldpp_dout(dpp, 20) << "processed:" << env.bucket << ":"
		       << o.key << " " << wq->thr_name() << dendl;
  }

  return 0;

}

int RGWLC::bucket_lc_process(string& shard_id, LCWorker* worker,
			     time_t stop_at, bool once)
{
  RGWLifecycleConfiguration  config(cct);
  std::unique_ptr<rgw::sal::Bucket> bucket;
  string no_ns, list_versions;
  vector<rgw_bucket_dir_entry> objs;
  vector<std::string> result;
  boost::split(result, shard_id, boost::is_any_of(":"));
  string bucket_tenant = result[0];
  string bucket_name = result[1];
  string bucket_marker = result[2];
  int ret = store->get_bucket(this, nullptr, bucket_tenant, bucket_name, &bucket, null_yield);
  if (ret < 0) {
    ldpp_dout(this, 0) << "LC:get_bucket for " << bucket_name
		       << " failed" << dendl;
    return ret;
  }

  ret = bucket->load_bucket(this, null_yield);
  if (ret < 0) {
    ldpp_dout(this, 0) << "LC:load_bucket for " << bucket_name
		       << " failed" << dendl;
    return ret;
  }

  auto stack_guard = make_scope_guard(
    [&worker]
      {
	worker->workpool->drain();
      }
    );

  if (bucket->get_marker() != bucket_marker) {
    ldpp_dout(this, 1) << "LC: deleting stale entry found for bucket="
		       << bucket_tenant << ":" << bucket_name
		       << " cur_marker=" << bucket->get_marker()
                       << " orig_marker=" << bucket_marker << dendl;
    return -ENOENT;
  }

  map<string, bufferlist>::iterator aiter
    = bucket->get_attrs().find(RGW_ATTR_LC);
  if (aiter == bucket->get_attrs().end()) {
    ldpp_dout(this, 0) << "WARNING: bucket_attrs.find(RGW_ATTR_LC) failed for "
		       << bucket_name << " (terminates bucket_lc_process(...))"
		       << dendl;
    return 0;
  }

  bufferlist::const_iterator iter{&aiter->second};
  try {
      config.decode(iter);
    } catch (const buffer::error& e) {
      ldpp_dout(this, 0) << __func__ <<  "() decode life cycle config failed"
			 << dendl;
      return -1;
    }

  /* fetch information for zone checks */
  rgw::sal::Zone* zone = store->get_zone();

  auto pf = [](RGWLC::LCWorker* wk, WorkQ* wq, WorkItem& wi) {
    auto wt =
      boost::get<std::tuple<LCOpRule, rgw_bucket_dir_entry>>(wi);
    auto& [op_rule, o] = wt;

    ldpp_dout(wk->get_lc(), 20)
      << __func__ << "(): key=" << o.key << wq->thr_name() 
      << dendl;
    int ret = op_rule.process(o, wk->dpp, wq);
    if (ret < 0) {
      ldpp_dout(wk->get_lc(), 20)
	<< "ERROR: orule.process() returned ret=" << ret
	<< "thread:" << wq->thr_name()
	<< dendl;
    }
  };
  worker->workpool->setf(pf);

  multimap<string, lc_op>& prefix_map = config.get_prefix_map();
  ldpp_dout(this, 10) << __func__ <<  "() prefix_map size="
		      << prefix_map.size()
		      << dendl;

  rgw_obj_key pre_marker;
  rgw_obj_key next_marker;
  for(auto prefix_iter = prefix_map.begin(); prefix_iter != prefix_map.end();
      ++prefix_iter) {

    if (worker_should_stop(stop_at, once)) {
      ldpp_dout(this, 5) << __func__ << " interval budget EXPIRED worker "
		     << worker->ix
		     << dendl;
      return 0;
    }

    auto& op = prefix_iter->second;
    if (!is_valid_op(op)) {
      continue;
    }
    ldpp_dout(this, 20) << __func__ << "(): prefix=" << prefix_iter->first
			<< dendl;
    if (prefix_iter != prefix_map.begin() && 
        (prefix_iter->first.compare(0, prev(prefix_iter)->first.length(),
				    prev(prefix_iter)->first) == 0)) {
      next_marker = pre_marker;
    } else {
      pre_marker = next_marker;
    }

    LCObjsLister ol(store, bucket.get());
    ol.set_prefix(prefix_iter->first);

    if (! zone_check(op, zone)) {
      ldpp_dout(this, 7) << "LC rule not executable in " << zone->get_tier_type()
			 << " zone, skipping" << dendl;
      continue;
    }

    ret = ol.init(this);
    if (ret < 0) {
      if (ret == (-ENOENT))
        return 0;
      ldpp_dout(this, 0) << "ERROR: store->list_objects():" << dendl;
      return ret;
    }

    op_env oenv(op, store, worker, bucket.get(), ol);
    LCOpRule orule(oenv);
    orule.build(); // why can't ctor do it?
    rgw_bucket_dir_entry* o{nullptr};
    for (auto offset = 0; ol.get_obj(this, &o /* , fetch_barrier */); ++offset, ol.next()) {
      orule.update();
      std::tuple<LCOpRule, rgw_bucket_dir_entry> t1 = {orule, *o};
      worker->workpool->enqueue(WorkItem{t1});
      if ((offset % 100) == 0) {
	if (worker_should_stop(stop_at, once)) {
	  ldpp_dout(this, 5) << __func__ << " interval budget EXPIRED worker "
			     << worker->ix
			     << dendl;
	  return 0;
	}
      }
    }
    worker->workpool->drain();
  }

  ret = handle_multipart_expiration(bucket.get(), prefix_map, worker, stop_at, once);
  return ret;
}

int RGWLC::bucket_lc_post(int index, int max_lock_sec,
			  rgw::sal::Lifecycle::LCEntry& entry, int& result,
			  LCWorker* worker)
{
  utime_t lock_duration(cct->_conf->rgw_lc_lock_max_time, 0);

  rgw::sal::LCSerializer* lock = sal_lc->get_serializer(lc_index_lock_name,
							obj_names[index],
							cookie);

  ldpp_dout(this, 5) << "RGWLC::bucket_lc_post(): POST " << entry
	  << " index: " << index << " worker ix: " << worker->ix
	  << dendl;

  do {
    int ret = lock->try_lock(this, lock_duration, null_yield);
    if (ret == -EBUSY || ret == -EEXIST) {
      /* already locked by another lc processor */
      ldpp_dout(this, 0) << "RGWLC::bucket_lc_post() failed to acquire lock on "
			 << obj_names[index] << ", sleep 5, try again " << dendl;
      sleep(5);
      continue;
    }

    if (ret < 0)
      return 0;
    ldpp_dout(this, 20) << "RGWLC::bucket_lc_post() lock " << obj_names[index]
			<< dendl;
    if (result ==  -ENOENT) {
      /* XXXX are we SURE the only way result could == ENOENT is when
       * there is no such bucket?  It is currently the value returned
       * from bucket_lc_process(...) */
      ret = sal_lc->rm_entry(obj_names[index],  entry);
      if (ret < 0) {
        ldpp_dout(this, 0) << "RGWLC::bucket_lc_post() failed to remove entry "
            << obj_names[index] << dendl;
      }
      goto clean;
    } else if (result < 0) {
      entry.status = lc_failed;
    } else {
      entry.status = lc_complete;
    }

    ret = sal_lc->set_entry(obj_names[index],  entry);
    if (ret < 0) {
      ldpp_dout(this, 0) << "RGWLC::process() failed to set entry on "
          << obj_names[index] << dendl;
    }
clean:
    lock->unlock();
    delete lock;
    ldpp_dout(this, 20) << "RGWLC::bucket_lc_post() unlock "
			<< obj_names[index] << dendl;
    return 0;
  } while (true);
}

int RGWLC::list_lc_progress(string& marker, uint32_t max_entries,
			    vector<rgw::sal::Lifecycle::LCEntry>& progress_map,
			    int& index)
{
  progress_map.clear();
  for(; index < max_objs; index++, marker="") {
    vector<rgw::sal::Lifecycle::LCEntry> entries;
    int ret = sal_lc->list_entries(obj_names[index], marker, max_entries, entries);
    if (ret < 0) {
      if (ret == -ENOENT) {
        ldpp_dout(this, 10) << __func__ << "() ignoring unfound lc object="
                             << obj_names[index] << dendl;
        continue;
      } else {
        return ret;
      }
    }
    progress_map.reserve(progress_map.size() + entries.size());
    progress_map.insert(progress_map.end(), entries.begin(), entries.end());

    /* update index, marker tuple */
    if (progress_map.size() > 0)
      marker = progress_map.back().bucket;

    if (progress_map.size() >= max_entries)
      break;
  }
  return 0;
}

static inline vector<int> random_sequence(uint32_t n)
{
  vector<int> v(n, 0);
  std::generate(v.begin(), v.end(),
    [ix = 0]() mutable {
      return ix++;
    });
  std::random_device rd;
  std::default_random_engine rng{rd()};
  std::shuffle(v.begin(), v.end(), rd);
  return v;
}

static inline int get_lc_index(CephContext *cct,
			       const std::string& shard_id)
{
  int max_objs =
    (cct->_conf->rgw_lc_max_objs > HASH_PRIME ? HASH_PRIME :
     cct->_conf->rgw_lc_max_objs);
  /* n.b. review hash algo */
  int index = ceph_str_hash_linux(shard_id.c_str(),
				  shard_id.size()) % HASH_PRIME % max_objs;
  return index;
}

static inline void get_lc_oid(CephContext *cct,
			      const std::string& shard_id, string *oid)
{
  /* n.b. review hash algo */
  int index = get_lc_index(cct, shard_id);
  *oid = lc_oid_prefix;
  char buf[32];
  snprintf(buf, 32, ".%d", index);
  oid->append(buf);
  return;
}

static std::string get_lc_shard_name(const rgw_bucket& bucket){
  return string_join_reserve(':', bucket.tenant, bucket.name, bucket.marker);
}

int RGWLC::process(LCWorker* worker,
		   const std::unique_ptr<rgw::sal::Bucket>& optional_bucket,
		   bool once = false)
{
  int ret = 0;
  int max_secs = cct->_conf->rgw_lc_lock_max_time;

  if (optional_bucket) {
    /* if a bucket is provided, this is a single-bucket run, and
     * can be processed without traversing any state entries (we
     * do need the entry {pro,epi}logue which update the state entry
     * for this bucket) */
    auto bucket_entry_marker = get_lc_shard_name(optional_bucket->get_key());
    auto index = get_lc_index(store->ctx(), bucket_entry_marker);
    ret = process_bucket(index, max_secs, worker, bucket_entry_marker, once);
    return ret;
  } else {
    /* generate an index-shard sequence unrelated to any other
     * that might be running in parallel */
    std::string all_buckets{""};
    vector<int> shard_seq = random_sequence(max_objs);
    for (auto index : shard_seq) {
      ret = process(index, max_secs, worker, once);
      if (ret < 0)
	return ret;
    }
  }

  return 0;
}

bool RGWLC::expired_session(time_t started)
{
  time_t interval = (cct->_conf->rgw_lc_debug_interval > 0)
    ? cct->_conf->rgw_lc_debug_interval : secs_in_a_day;

  auto now = time(nullptr);

  ldpp_dout(this, 16) << "RGWLC::expired_session"
	   << " started: " << started
	   << " interval: " << interval << "(*2==" << 2*interval << ")"
	   << " now: " << now
	   << dendl;

  return (started + 2*interval < now);
}

time_t RGWLC::thread_stop_at()
{
  uint64_t interval = (cct->_conf->rgw_lc_debug_interval > 0)
    ? cct->_conf->rgw_lc_debug_interval : secs_in_a_day;

  return time(nullptr) + interval;
}

int RGWLC::process_bucket(int index, int max_lock_secs, LCWorker* worker,
			  const std::string& bucket_entry_marker,
			  bool once = false)
{
  ldpp_dout(this, 5) << "RGWLC::process_bucket(): ENTER: "
	  << "index: " << index << " worker ix: " << worker->ix
	  << dendl;

  int ret = 0;
  std::unique_ptr<rgw::sal::LCSerializer> serializer(
    sal_lc->get_serializer(lc_index_lock_name, obj_names[index],
			   std::string()));

  rgw::sal::Lifecycle::LCEntry entry;
  if (max_lock_secs <= 0) {
    return -EAGAIN;
  }

  utime_t time(max_lock_secs, 0);
  ret = serializer->try_lock(this, time, null_yield);
  if (ret == -EBUSY || ret == -EEXIST) {
    /* already locked by another lc processor */
    ldpp_dout(this, 0) << "RGWLC::process() failed to acquire lock on "
		       << obj_names[index] << dendl;
    return -EBUSY;
  }
  if (ret < 0)
    return 0;

  std::unique_lock<rgw::sal::LCSerializer> lock(
    *(serializer.get()), std::adopt_lock);

  ret = sal_lc->get_entry(obj_names[index], bucket_entry_marker, entry);
  if (ret >= 0) {
    if (entry.status == lc_processing) {
      if (expired_session(entry.start_time)) {
	ldpp_dout(this, 5) << "RGWLC::process_bucket(): STALE lc session found for: " << entry
			   << " index: " << index << " worker ix: " << worker->ix
			   << " (clearing)"
			   << dendl;
      } else {
	ldpp_dout(this, 5) << "RGWLC::process_bucket(): ACTIVE entry: "
			   << entry
			   << " index: " << index
			   << " worker ix: " << worker->ix
			   << dendl;
	return ret;
      }
    }
  }

  /* do nothing if no bucket */
  if (entry.bucket.empty()) {
    return ret;
  }

  ldpp_dout(this, 5) << "RGWLC::process_bucket(): START entry 1: " << entry
		     << " index: " << index << " worker ix: " << worker->ix
		     << dendl;

  entry.status = lc_processing;
  ret = sal_lc->set_entry(obj_names[index], entry);
  if (ret < 0) {
    ldpp_dout(this, 0) << "RGWLC::process_bucket() failed to set obj entry "
		       << obj_names[index] << entry.bucket << entry.status
		       << dendl;
    return ret;
  }

  ldpp_dout(this, 5) << "RGWLC::process_bucket(): START entry 2: " << entry
		     << " index: " << index << " worker ix: " << worker->ix
		     << dendl;

  lock.unlock();
  ret = bucket_lc_process(entry.bucket, worker, thread_stop_at(), once);
  bucket_lc_post(index, max_lock_secs, entry, ret, worker);

  return ret;
} /* RGWLC::process_bucket */

int RGWLC::process(int index, int max_lock_secs, LCWorker* worker,
		   bool once = false)
{
  ldpp_dout(this, 5) << "RGWLC::process(): ENTER: "
	  << "index: " << index << " worker ix: " << worker->ix
	  << dendl;

  int ret = 0;
  rgw::sal::LCSerializer* lock = sal_lc->get_serializer(lc_index_lock_name,
							obj_names[index],
							std::string());
  do {
    utime_t now = ceph_clock_now();
    //string = bucket_name:bucket_id, start_time, int = LC_BUCKET_STATUS
    rgw::sal::Lifecycle::LCEntry entry;
    if (max_lock_secs <= 0)
      return -EAGAIN;

    utime_t time(max_lock_secs, 0);
    ret = lock->try_lock(this, time, null_yield);
    if (ret == -EBUSY || ret == -EEXIST) {
      /* already locked by another lc processor */
      ldpp_dout(this, 0) << "RGWLC::process() failed to acquire lock on "
          << obj_names[index] << ", sleep 5, try again" << dendl;
      sleep(5);
      continue; // XXXX really retry forever?
    }
    if (ret < 0)
      return 0;

    rgw::sal::Lifecycle::LCHead head;
    ret = sal_lc->get_head(obj_names[index], head);
    if (ret < 0) {
      ldpp_dout(this, 0) << "RGWLC::process() failed to get obj head "
          << obj_names[index] << ", ret=" << ret << dendl;
      goto exit;
    }

    ret = sal_lc->get_entry(obj_names[index], head.marker, entry);
    if (ret >= 0) {
      if (entry.status == lc_processing) {
	if (expired_session(entry.start_time)) {
	  ldpp_dout(this, 5) << "RGWLC::process(): STALE lc session found for: " << entry
			     << " index: " << index << " worker ix: " << worker->ix
			     << " (clearing)"
			     << dendl;
	} else {
	  ldpp_dout(this, 5) << "RGWLC::process(): ACTIVE entry: " << entry
			     << " index: " << index << " worker ix: " << worker->ix
			     << dendl;
	  goto exit;
	}
      }
    }

    if(!if_already_run_today(head.start_date) ||
       once) {
      head.start_date = now;
      head.marker.clear();
      ret = bucket_lc_prepare(index, worker);
      if (ret < 0) {
      ldpp_dout(this, 0) << "RGWLC::process() failed to update lc object "
			 << obj_names[index]
			 << ", ret=" << ret
			 << dendl;
      goto exit;
      }
    }

    ret = sal_lc->get_next_entry(obj_names[index], head.marker, entry);
    if (ret < 0) {
      ldpp_dout(this, 0) << "RGWLC::process() failed to get obj entry "
          << obj_names[index] << dendl;
      goto exit;
    }

    /* termination condition (eof) */
    if (entry.bucket.empty())
      goto exit;

    ldpp_dout(this, 5) << "RGWLC::process(): START entry 1: " << entry
	    << " index: " << index << " worker ix: " << worker->ix
	    << dendl;

    entry.status = lc_processing;
    ret = sal_lc->set_entry(obj_names[index], entry);
    if (ret < 0) {
      ldpp_dout(this, 0) << "RGWLC::process() failed to set obj entry "
	      << obj_names[index] << entry.bucket << entry.status << dendl;
      goto exit;
    }

    head.marker = entry.bucket;
    ret = sal_lc->put_head(obj_names[index],  head);
    if (ret < 0) {
      ldpp_dout(this, 0) << "RGWLC::process() failed to put head "
			 << obj_names[index]
	      << dendl;
      goto exit;
    }

    ldpp_dout(this, 5) << "RGWLC::process(): START entry 2: " << entry
	    << " index: " << index << " worker ix: " << worker->ix
	    << dendl;

    lock->unlock();
    ret = bucket_lc_process(entry.bucket, worker, thread_stop_at(), once);
    bucket_lc_post(index, max_lock_secs, entry, ret, worker);
  } while(1 && !once);

  delete lock;
  return 0;

exit:
  lock->unlock();
  delete lock;
  return 0;
}

void RGWLC::start_processor()
{
  auto maxw = cct->_conf->rgw_lc_max_worker;
  workers.reserve(maxw);
  for (int ix = 0; ix < maxw; ++ix) {
    auto worker  =
      std::make_unique<RGWLC::LCWorker>(this /* dpp */, cct, this, ix);
    worker->create((string{"lifecycle_thr_"} + to_string(ix)).c_str());
    workers.emplace_back(std::move(worker));
  }
}

void RGWLC::stop_processor()
{
  down_flag = true;
  for (auto& worker : workers) {
    worker->stop();
    worker->join();
  }
  workers.clear();
}

unsigned RGWLC::get_subsys() const
{
  return dout_subsys;
}

std::ostream& RGWLC::gen_prefix(std::ostream& out) const
{
  return out << "lifecycle: ";
}

void RGWLC::LCWorker::stop()
{
  std::lock_guard l{lock};
  cond.notify_all();
}

bool RGWLC::going_down()
{
  return down_flag;
}

bool RGWLC::LCWorker::should_work(utime_t& now)
{
  int start_hour;
  int start_minute;
  int end_hour;
  int end_minute;
  string worktime = cct->_conf->rgw_lifecycle_work_time;
  sscanf(worktime.c_str(),"%d:%d-%d:%d",&start_hour, &start_minute,
	 &end_hour, &end_minute);
  struct tm bdt;
  time_t tt = now.sec();
  localtime_r(&tt, &bdt);

  // next-day adjustment if the configured end_hour is less than start_hour
  if (end_hour < start_hour) {
    bdt.tm_hour = bdt.tm_hour > end_hour ? bdt.tm_hour : bdt.tm_hour + hours_in_a_day;
    end_hour += hours_in_a_day;
  }

  if (cct->_conf->rgw_lc_debug_interval > 0) {
	  /* We're debugging, so say we can run */
	  return true;
  } else if ((bdt.tm_hour*60 + bdt.tm_min >= start_hour*60 + start_minute) &&
		     (bdt.tm_hour*60 + bdt.tm_min <= end_hour*60 + end_minute)) {
	  return true;
  } else {
	  return false;
  }

}

int RGWLC::LCWorker::schedule_next_start_time(utime_t &start, utime_t& now)
{
  int secs;

  if (cct->_conf->rgw_lc_debug_interval > 0) {
	secs = start + cct->_conf->rgw_lc_debug_interval - now;
	if (secs < 0)
	  secs = 0;
	return (secs);
  }

  int start_hour;
  int start_minute;
  int end_hour;
  int end_minute;
  string worktime = cct->_conf->rgw_lifecycle_work_time;
  sscanf(worktime.c_str(),"%d:%d-%d:%d",&start_hour, &start_minute, &end_hour,
	 &end_minute);
  struct tm bdt;
  time_t tt = now.sec();
  time_t nt;
  localtime_r(&tt, &bdt);
  bdt.tm_hour = start_hour;
  bdt.tm_min = start_minute;
  bdt.tm_sec = 0;
  nt = mktime(&bdt);
  secs = nt - tt;

  return secs > 0 ? secs : secs + secs_in_a_day;
}

RGWLC::LCWorker::~LCWorker()
{
  delete workpool;
} /* ~LCWorker */

void RGWLifecycleConfiguration::generate_test_instances(
  list<RGWLifecycleConfiguration*>& o)
{
  o.push_back(new RGWLifecycleConfiguration);
}

template<typename F>
static int guard_lc_modify(const DoutPrefixProvider *dpp,
                           rgw::sal::Store* store,
			   rgw::sal::Lifecycle* sal_lc,
			   const rgw_bucket& bucket, const string& cookie,
			   const F& f) {
  CephContext *cct = store->ctx();

  string shard_id = get_lc_shard_name(bucket);

  string oid; 
  get_lc_oid(cct, shard_id, &oid);

  /* XXX it makes sense to take shard_id for a bucket_id? */
  rgw::sal::Lifecycle::LCEntry entry;
  entry.bucket = shard_id;
  entry.status = lc_uninitial;
  int max_lock_secs = cct->_conf->rgw_lc_lock_max_time;

  rgw::sal::LCSerializer* lock = sal_lc->get_serializer(lc_index_lock_name,
							oid,
							cookie);
  utime_t time(max_lock_secs, 0);

  int ret;

  do {
    ret = lock->try_lock(dpp, time, null_yield);
    if (ret == -EBUSY || ret == -EEXIST) {
      ldpp_dout(dpp, 0) << "RGWLC::RGWPutLC() failed to acquire lock on "
          << oid << ", sleep 5, try again" << dendl;
      sleep(5); // XXX: return retryable error
      continue;
    }
    if (ret < 0) {
      ldpp_dout(dpp, 0) << "RGWLC::RGWPutLC() failed to acquire lock on "
          << oid << ", ret=" << ret << dendl;
      break;
    }
    ret = f(sal_lc, oid, entry);
    if (ret < 0) {
      ldpp_dout(dpp, 0) << "RGWLC::RGWPutLC() failed to set entry on "
          << oid << ", ret=" << ret << dendl;
    }
    break;
  } while(true);
  lock->unlock();
  delete lock;
  return ret;
}

int RGWLC::set_bucket_config(rgw::sal::Bucket* bucket,
                         const rgw::sal::Attrs& bucket_attrs,
                         RGWLifecycleConfiguration *config)
{
  int ret{0};
  rgw::sal::Attrs attrs = bucket_attrs;
  if (config) {
    /* if no RGWLifecycleconfiguration provided, it means
     * RGW_ATTR_LC is already valid and present */
    bufferlist lc_bl;
    config->encode(lc_bl);
    attrs[RGW_ATTR_LC] = std::move(lc_bl);

    ret =
      bucket->merge_and_store_attrs(this, attrs, null_yield);
    if (ret < 0) {
      return ret;
    }
  }

  rgw_bucket& b = bucket->get_key();


  ret = guard_lc_modify(this, store, sal_lc.get(), b, cookie,
			[&](rgw::sal::Lifecycle* sal_lc, const string& oid,
			    const rgw::sal::Lifecycle::LCEntry& entry) {
    return sal_lc->set_entry(oid, entry);
  });

  return ret;
}

int RGWLC::remove_bucket_config(rgw::sal::Bucket* bucket,
                                const rgw::sal::Attrs& bucket_attrs)
{
  rgw::sal::Attrs attrs = bucket_attrs;
  attrs.erase(RGW_ATTR_LC);
  int ret = bucket->merge_and_store_attrs(this, attrs, null_yield);

  rgw_bucket& b = bucket->get_key();

  if (ret < 0) {
    ldpp_dout(this, 0) << "RGWLC::RGWDeleteLC() failed to set attrs on bucket="
        << b.name << " returned err=" << ret << dendl;
    return ret;
  }


  ret = guard_lc_modify(this, store, sal_lc.get(), b, cookie,
			[&](rgw::sal::Lifecycle* sal_lc, const string& oid,
			    const rgw::sal::Lifecycle::LCEntry& entry) {
    return sal_lc->rm_entry(oid, entry);
  });

  return ret;
} /* RGWLC::remove_bucket_config */

RGWLC::~RGWLC()
{
  stop_processor();
  finalize();
} /* ~RGWLC() */

namespace rgw::lc {

int fix_lc_shard_entry(const DoutPrefixProvider *dpp,
                       rgw::sal::Store* store,
		       rgw::sal::Lifecycle* sal_lc,
		       rgw::sal::Bucket* bucket)
{
  if (auto aiter = bucket->get_attrs().find(RGW_ATTR_LC);
      aiter == bucket->get_attrs().end()) {
    return 0;    // No entry, nothing to fix
  }

  auto shard_name = get_lc_shard_name(bucket->get_key());
  std::string lc_oid;
  get_lc_oid(store->ctx(), shard_name, &lc_oid);

  rgw::sal::Lifecycle::LCEntry entry;
  // There are multiple cases we need to encounter here
  // 1. entry exists and is already set to marker, happens in plain buckets & newly resharded buckets
  // 2. entry doesn't exist, which usually happens when reshard has happened prior to update and next LC process has already dropped the update
  // 3. entry exists matching the current bucket id which was after a reshard (needs to be updated to the marker)
  // We are not dropping the old marker here as that would be caught by the next LC process update
  int ret = sal_lc->get_entry(lc_oid, shard_name, entry);
  if (ret == 0) {
    ldpp_dout(dpp, 5) << "Entry already exists, nothing to do" << dendl;
    return ret; // entry is already existing correctly set to marker
  }
  ldpp_dout(dpp, 5) << "lc_get_entry errored ret code=" << ret << dendl;
  if (ret == -ENOENT) {
    ldpp_dout(dpp, 1) << "No entry for bucket=" << bucket
			   << " creating " << dendl;
    // TODO: we have too many ppl making cookies like this!
    char cookie_buf[COOKIE_LEN + 1];
    gen_rand_alphanumeric(store->ctx(), cookie_buf, sizeof(cookie_buf) - 1);
    std::string cookie = cookie_buf;

    ret = guard_lc_modify(dpp,
      store, sal_lc, bucket->get_key(), cookie,
      [&lc_oid](rgw::sal::Lifecycle* slc,
			      const string& oid,
			      const rgw::sal::Lifecycle::LCEntry& entry) {
	return slc->set_entry(lc_oid, entry);
      });

  }

  return ret;
}

std::string s3_expiration_header(
  DoutPrefixProvider* dpp,
  const rgw_obj_key& obj_key,
  const RGWObjTags& obj_tagset,
  const ceph::real_time& mtime,
  const std::map<std::string, buffer::list>& bucket_attrs)
{
  CephContext* cct = dpp->get_cct();
  RGWLifecycleConfiguration config(cct);
  std::string hdr{""};

  const auto& aiter = bucket_attrs.find(RGW_ATTR_LC);
  if (aiter == bucket_attrs.end())
    return hdr;

  bufferlist::const_iterator iter{&aiter->second};
  try {
      config.decode(iter);
  } catch (const buffer::error& e) {
      ldpp_dout(dpp, 0) << __func__
			<<  "() decode life cycle config failed"
			<< dendl;
      return hdr;
  } /* catch */

  /* dump tags at debug level 16 */
  RGWObjTags::tag_map_t obj_tag_map = obj_tagset.get_tags();
  if (cct->_conf->subsys.should_gather(ceph_subsys_rgw, 16)) {
    for (const auto& elt : obj_tag_map) {
      ldpp_dout(dpp, 16) << __func__
		     <<  "() key=" << elt.first << " val=" << elt.second
		     << dendl;
    }
  }

  boost::optional<ceph::real_time> expiration_date;
  boost::optional<std::string> rule_id;

  const auto& rule_map = config.get_rule_map();
  for (const auto& ri : rule_map) {
    const auto& rule = ri.second;
    auto& id = rule.get_id();
    auto& filter = rule.get_filter();
    auto& prefix = filter.has_prefix() ? filter.get_prefix(): rule.get_prefix();
    auto& expiration = rule.get_expiration();
    auto& noncur_expiration = rule.get_noncur_expiration();

    ldpp_dout(dpp, 10) << "rule: " << ri.first
		       << " prefix: " << prefix
		       << " expiration: "
		       << " date: " << expiration.get_date()
		       << " days: " << expiration.get_days()
		       << " noncur_expiration: "
		       << " date: " << noncur_expiration.get_date()
		       << " days: " << noncur_expiration.get_days()
		       << dendl;

    /* skip if rule !enabled
     * if rule has prefix, skip iff object !match prefix
     * if rule has tags, skip iff object !match tags
     * note if object is current or non-current, compare accordingly
     * if rule has days, construct date expression and save iff older
     * than last saved
     * if rule has date, convert date expression and save iff older
     * than last saved
     * if the date accum has a value, format it into hdr
     */

    if (! rule.is_enabled())
      continue;

    if(! prefix.empty()) {
      if (! boost::starts_with(obj_key.name, prefix))
        continue;
    }

    if (filter.has_tags()) {
      bool tag_match = false;
      const RGWObjTags& rule_tagset = filter.get_tags();
      for (auto& tag : rule_tagset.get_tags()) {
	/* remember, S3 tags are {key,value} tuples */
        tag_match = true;
        auto obj_tag = obj_tag_map.find(tag.first);
        if (obj_tag == obj_tag_map.end() || obj_tag->second != tag.second) {
	        ldpp_dout(dpp, 10) << "tag does not match obj_key=" << obj_key
			         << " rule_id=" << id
			         << " tag=" << tag
			         << dendl;
	        tag_match = false;
	        break;
	      }
      }
      if (! tag_match)
	      continue;
    }

    // compute a uniform expiration date
    boost::optional<ceph::real_time> rule_expiration_date;
    const LCExpiration& rule_expiration =
      (obj_key.instance.empty()) ? expiration : noncur_expiration;

    if (rule_expiration.has_date()) {
      rule_expiration_date =
	boost::optional<ceph::real_time>(
	  ceph::from_iso_8601(rule.get_expiration().get_date()));
    } else {
      if (rule_expiration.has_days()) {
	rule_expiration_date =
	  boost::optional<ceph::real_time>(
	    mtime + make_timespan(double(rule_expiration.get_days()) * secs_in_a_day - ceph::real_clock::to_time_t(mtime)%(secs_in_a_day) + secs_in_a_day));
      }
    }

    // update earliest expiration
    if (rule_expiration_date) {
      if ((! expiration_date) ||
	  (*expiration_date > *rule_expiration_date)) {
      expiration_date =
	boost::optional<ceph::real_time>(rule_expiration_date);
      rule_id = boost::optional<std::string>(id);
      }
    }
  }

  // cond format header
  if (expiration_date && rule_id) {
    // Fri, 23 Dec 2012 00:00:00 GMT
    char exp_buf[100];
    time_t exp = ceph::real_clock::to_time_t(*expiration_date);
    if (std::strftime(exp_buf, sizeof(exp_buf),
		      "%a, %d %b %Y %T %Z", std::gmtime(&exp))) {
      hdr = fmt::format("expiry-date=\"{0}\", rule-id=\"{1}\"", exp_buf,
			*rule_id);
    } else {
      ldpp_dout(dpp, 0) << __func__ <<
	"() strftime of life cycle expiration header failed"
			<< dendl;
    }
  }

  return hdr;

} /* rgwlc_s3_expiration_header */

bool s3_multipart_abort_header(
  DoutPrefixProvider* dpp,
  const rgw_obj_key& obj_key,
  const ceph::real_time& mtime,
  const std::map<std::string, buffer::list>& bucket_attrs,
  ceph::real_time& abort_date,
  std::string& rule_id)
{
  CephContext* cct = dpp->get_cct();
  RGWLifecycleConfiguration config(cct);

  const auto& aiter = bucket_attrs.find(RGW_ATTR_LC);
  if (aiter == bucket_attrs.end())
    return false;

  bufferlist::const_iterator iter{&aiter->second};
  try {
    config.decode(iter);
  } catch (const buffer::error& e) {
    ldpp_dout(dpp, 0) << __func__
                      <<  "() decode life cycle config failed"
                      << dendl;
    return false;
  } /* catch */

  std::optional<ceph::real_time> abort_date_tmp;
  std::optional<std::string_view> rule_id_tmp;
  const auto& rule_map = config.get_rule_map();
  for (const auto& ri : rule_map) {
    const auto& rule = ri.second;
    const auto& id = rule.get_id();
    const auto& filter = rule.get_filter();
    const auto& prefix = filter.has_prefix()?filter.get_prefix():rule.get_prefix();
    const auto& mp_expiration = rule.get_mp_expiration();
    if (!rule.is_enabled()) {
      continue;
    }
    if(!prefix.empty() && !boost::starts_with(obj_key.name, prefix)) {
      continue;
    }

    std::optional<ceph::real_time> rule_abort_date;
    if (mp_expiration.has_days()) {
      rule_abort_date = std::optional<ceph::real_time>(
              mtime + make_timespan(mp_expiration.get_days() * secs_in_a_day - ceph::real_clock::to_time_t(mtime)%(secs_in_a_day) + secs_in_a_day));
    }

    // update earliest abort date
    if (rule_abort_date) {
      if ((! abort_date_tmp) ||
          (*abort_date_tmp > *rule_abort_date)) {
        abort_date_tmp =
                std::optional<ceph::real_time>(rule_abort_date);
        rule_id_tmp = std::optional<std::string_view>(id);
      }
    }
  }
  if (abort_date_tmp && rule_id_tmp) {
    abort_date = *abort_date_tmp;
    rule_id = *rule_id_tmp;
    return true;
  } else {
    return false;
  }
}

} /* namespace rgw::lc */

void lc_op::dump(Formatter *f) const
{
  f->dump_bool("status", status);
  f->dump_bool("dm_expiration", dm_expiration);

  f->dump_int("expiration", expiration);
  f->dump_int("noncur_expiration", noncur_expiration);
  f->dump_int("mp_expiration", mp_expiration);
  if (expiration_date) {
    utime_t ut(*expiration_date);
    f->dump_stream("expiration_date") << ut;
  }
  if (obj_tags) {
    f->dump_object("obj_tags", *obj_tags);
  }
  f->open_object_section("transitions");
  for(auto& [storage_class, transition] : transitions) {
    f->dump_object(storage_class, transition);
  }
  f->close_section();

  f->open_object_section("noncur_transitions");
  for (auto& [storage_class, transition] : noncur_transitions) {
    f->dump_object(storage_class, transition);
  }
  f->close_section();
}

void LCFilter::dump(Formatter *f) const
{
  f->dump_string("prefix", prefix);
  f->dump_object("obj_tags", obj_tags);
  if (have_flag(LCFlagType::ArchiveZone)) {
    f->dump_string("archivezone", "");
  }
}

void LCExpiration::dump(Formatter *f) const
{
  f->dump_string("days", days);
  f->dump_string("date", date);
}

void LCRule::dump(Formatter *f) const
{
  f->dump_string("id", id);
  f->dump_string("prefix", prefix);
  f->dump_string("status", status);
  f->dump_object("expiration", expiration);
  f->dump_object("noncur_expiration", noncur_expiration);
  f->dump_object("mp_expiration", mp_expiration);
  f->dump_object("filter", filter);
  f->open_object_section("transitions");
  for (auto& [storage_class, transition] : transitions) {
    f->dump_object(storage_class, transition);
  }
  f->close_section();

  f->open_object_section("noncur_transitions");
  for (auto& [storage_class, transition] : noncur_transitions) {
    f->dump_object(storage_class, transition);
  }
  f->close_section();
  f->dump_bool("dm_expiration", dm_expiration);
}


void RGWLifecycleConfiguration::dump(Formatter *f) const
{
  f->open_object_section("prefix_map");
  for (auto& prefix : prefix_map) {
    f->dump_object(prefix.first.c_str(), prefix.second);
  }
  f->close_section();

  f->open_array_section("rule_map");
  for (auto& rule : rule_map) {
    f->open_object_section("entry");
    f->dump_string("id", rule.first);
    f->open_object_section("rule");
    rule.second.dump(f);
    f->close_section();
    f->close_section();
  }
  f->close_section();
}

