
.. _disaster-recovery-experts:

Advanced: Metadata repair tools
===============================

.. warning::

    If you do not have expert knowledge of CephFS internals, you will
    need to seek assistance before using any of these tools.

    The tools mentioned here can easily cause damage as well as fixing it.

    It is essential to understand exactly what has gone wrong with your
    file system before attempting to repair it.

    If you do not have access to professional support for your cluster,
    consult the ceph-users mailing list or the #ceph IRC/Slack channel.


Journal export
--------------

Before attempting any dangerous operation, make a copy of the journal by
running the following command:

.. prompt:: bash #

   cephfs-journal-tool journal export backup.bin

If the journal is badly corrupted, this command might not work. If the journal
is badly corrupted, make a RADOS-level copy
(http://tracker.ceph.com/issues/9902).


Dentry recovery from journal
----------------------------

If a journal is damaged or for any reason an MDS is incapable of replaying it,
attempt to recover file metadata by running the following command:

.. prompt:: bash #

   cephfs-journal-tool event recover_dentries summary

By default, this command acts on MDS rank ``0``. Pass the option ``--rank=<n>``
to the ``cephfs-journal-tool`` command to operate on other ranks.

This command writes all inodes and dentries recoverable from the journal into
the backing store, but only if these inodes and dentries are higher-versioned
than the existing contents of the backing store. Any regions of the journal
that are missing or damaged will be skipped.

In addition to writing out dentries and inodes, this command updates the
InoTables of each ``in`` MDS rank, to indicate that any written inodes' numbers
are now in use. In simple cases, this will result in an entirely valid backing
store state.

.. warning::

    The resulting state of the backing store is not guaranteed to be
    self-consistent, and an online MDS scrub will be required afterwards. The
    journal contents will not be modified by this command. Truncate the journal
    separately after recovering what you can.

Journal truncation
------------------

If the journal is corrupt or MDSs cannot replay it for any reason, you can
truncate it like so:

::

    cephfs-journal-tool [--rank=N] journal reset

Specify the MDS rank using the ``--rank`` option when the file system has/had
multiple active MDS.

.. warning::

    Resetting the journal *will* lose metadata unless you have extracted
    it by other means such as ``recover_dentries``.  It is likely to leave
    some orphaned objects in the data pool.  It may result in re-allocation
    of already-written inodes, such that permissions rules could be violated.

MDS table wipes
---------------

After the journal has been reset, it may no longer be consistent with respect
to the contents of the MDS tables (InoTable, SessionMap, SnapServer).

To reset the SessionMap (erase all sessions), use:

::

    cephfs-table-tool all reset session

This command acts on the tables of all 'in' MDS ranks.  Replace 'all' with an MDS
rank to operate on that rank only.

The session table is the table most likely to need resetting, but if you know you
also need to reset the other tables then replace 'session' with 'snap' or 'inode'.

MDS map reset
-------------

Once the in-RADOS state of the file system (i.e. contents of the metadata pool)
is somewhat recovered, it may be necessary to update the MDS map to reflect
the contents of the metadata pool.  Use the following command to reset the MDS
map to a single MDS:

::

    ceph fs reset <fs name> --yes-i-really-mean-it

Once this is run, any in-RADOS state for MDS ranks other than 0 will be ignored:
as a result it is possible for this to result in data loss.

One might wonder what the difference is between 'fs reset' and 'fs remove; fs new'.  The
key distinction is that doing a remove/new will leave rank 0 in 'creating' state, such
that it would overwrite any existing root inode on disk and orphan any existing files.  In
contrast, the 'reset' command will leave rank 0 in 'active' state such that the next MDS
daemon to claim the rank will go ahead and use the existing in-RADOS metadata.

Recovery from missing metadata objects
--------------------------------------

Depending on what objects are missing or corrupt, you may need to
run various commands to regenerate default versions of the
objects.

::

    # Session table
    cephfs-table-tool 0 reset session
    # SnapServer
    cephfs-table-tool 0 reset snap
    # InoTable
    cephfs-table-tool 0 reset inode
    # Journal
    cephfs-journal-tool --rank=0 journal reset
    # Root inodes ("/" and MDS directory)
    cephfs-data-scan init

Finally, you can regenerate metadata objects for missing files
and directories based on the contents of a data pool.  This is
a three-phase process.  First, scanning *all* objects to calculate
size and mtime metadata for inodes.  Second, scanning the first
object from every file to collect this metadata and inject it into
the metadata pool. Third, checking inode linkages and fixing found
errors.

::

    cephfs-data-scan scan_extents [<data pool> [<extra data pool> ...]]
    cephfs-data-scan scan_inodes [<data pool>]
    cephfs-data-scan scan_links

'scan_extents' and 'scan_inodes' commands may take a *very long* time
if there are many files or very large files in the data pool.

To accelerate the process, run multiple instances of the tool.

Decide on a number of workers, and pass each worker a number within
the range 0-(worker_m - 1).

The example below shows how to run 4 workers simultaneously:

::

    # Worker 0
    cephfs-data-scan scan_extents --worker_n 0 --worker_m 4
    # Worker 1
    cephfs-data-scan scan_extents --worker_n 1 --worker_m 4
    # Worker 2
    cephfs-data-scan scan_extents --worker_n 2 --worker_m 4
    # Worker 3
    cephfs-data-scan scan_extents --worker_n 3 --worker_m 4

    # Worker 0
    cephfs-data-scan scan_inodes --worker_n 0 --worker_m 4
    # Worker 1
    cephfs-data-scan scan_inodes --worker_n 1 --worker_m 4
    # Worker 2
    cephfs-data-scan scan_inodes --worker_n 2 --worker_m 4
    # Worker 3
    cephfs-data-scan scan_inodes --worker_n 3 --worker_m 4

It is **important** to ensure that all workers have completed the
scan_extents phase before any workers enter the scan_inodes phase.

After completing the metadata recovery, you may want to run cleanup
operation to delete ancillary data generated during recovery.

::

    cephfs-data-scan cleanup [<data pool>]

Note, the data pool parameters for 'scan_extents', 'scan_inodes' and
'cleanup' commands are optional, and usually the tool will be able to
detect the pools automatically. Still you may override this. The
'scan_extents' command needs all data pools to be specified, while
'scan_inodes' and 'cleanup' commands need only the main data pool.


Using an alternate metadata pool for recovery
---------------------------------------------

.. warning::

   There has not been extensive testing of this procedure. It should be
   undertaken with great care.

If an existing file system is damaged and inoperative, it is possible to create
a fresh metadata pool and attempt to reconstruct the file system metadata into
this new pool, leaving the old metadata in place. This could be used to make a
safer attempt at recovery since the existing metadata pool would not be
modified.

.. caution::

   During this process, multiple metadata pools will contain data referring to
   the same data pool. Extreme caution must be exercised to avoid changing the
   data pool contents while this is the case. Once recovery is complete, the
   damaged metadata pool should be archived or deleted.

To begin, the existing file system should be taken down, if not done already,
to prevent further modification of the data pool. Unmount all clients and then
mark the file system failed:

::

    ceph fs fail <fs_name>

Next, create a recovery file system in which we will populate a new metadata pool
backed by the original data pool.

::

    ceph osd pool create cephfs_recovery_meta
    ceph fs new cephfs_recovery recovery <data_pool> --recover --allow-dangerous-metadata-overlay

.. note::

   The ``--recover`` flag prevents any MDS from joining the new file system.

Next, we will create the intial metadata for the fs:

::

    cephfs-table-tool cephfs_recovery:0 reset session
    cephfs-table-tool cephfs_recovery:0 reset snap
    cephfs-table-tool cephfs_recovery:0 reset inode
    cephfs-journal-tool --rank cephfs_recovery:0 journal reset --force

Now perform the recovery of the metadata pool from the data pool:

::

    cephfs-data-scan init --force-init --filesystem cephfs_recovery --alternate-pool cephfs_recovery_meta
    cephfs-data-scan scan_extents --alternate-pool cephfs_recovery_meta --filesystem <fs_name>
    cephfs-data-scan scan_inodes --alternate-pool cephfs_recovery_meta --filesystem <fs_name> --force-corrupt
    cephfs-data-scan scan_links --filesystem cephfs_recovery

.. note::

   Each scan procedure above goes through the entire data pool. This may take a
   significant amount of time. See the previous section on how to distribute
   this task among workers.

If the damaged file system contains dirty journal data, it may be recovered next
with:

::

    cephfs-journal-tool --rank=<fs_name>:0 event recover_dentries list --alternate-pool cephfs_recovery_meta

After recovery, some recovered directories will have incorrect statistics.
Ensure the parameters ``mds_verify_scatter`` and ``mds_debug_scatterstat`` are
set to false (the default) to prevent the MDS from checking the statistics:

::

    ceph config rm mds mds_verify_scatter
    ceph config rm mds mds_debug_scatterstat

.. note::

    Also verify the config has not been set globally or with a local ceph.conf file.

Now, allow an MDS to join the recovery file system:

::

    ceph fs set cephfs_recovery joinable true

Finally, run a forward :doc:`scrub </cephfs/scrub>` to repair recursive statistics.
Ensure you have an MDS running and issue:

::

    ceph tell mds.recovery_fs:0 scrub start / recursive,repair,force

.. note::

   The `Symbolic link recovery <https://tracker.ceph.com/issues/46166>`_ is supported from Quincy.
   Symbolic links were recovered as empty regular files before.

It is recommended to migrate any data from the recovery file system as soon as
possible. Do not restore the old file system while the recovery file system is
operational.

.. note::

    If the data pool is also corrupt, some files may not be restored because
    backtrace information is lost. If any data objects are missing (due to
    issues like lost Placement Groups on the data pool), the recovered files
    will contain holes in place of the missing data.

.. _Symbolic link recovery: https://tracker.ceph.com/issues/46166
