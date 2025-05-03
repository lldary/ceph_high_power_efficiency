#pragma once
#include <iostream>
#include <sstream>
#include <string>

// 定义日志级别颜色
#define COLOR_DEBUG "\033[0;33;40m"
#define COLOR_ERROR "\033[0;31;40m"
#define COLOR_INFO "\033[0;32;40m"
#define COLOR_RESET "\033[0m"
#define COLOR_DIM "\033[2m"

// 终止递归的重载
void logFormat(std::ostringstream &oss, const std::string &fmt);

// 日志函数模板
template <typename... Args>
void debugLog(const std::string &fmt, Args... args)
{
    std::ostringstream oss;
    oss << COLOR_DEBUG << "[ DEBUG ]" << COLOR_RESET << COLOR_DIM << " " << __FUNCTION__ << ":" << __LINE__ << ": " << COLOR_RESET;
    logFormat(oss, fmt, std::forward<Args>(args)...);
    std::cout << oss.str() << std::endl;
}

template <typename... Args>
void errorLog(const std::string &fmt, Args... args)
{
    std::ostringstream oss;
    oss << COLOR_ERROR << "[ ERROR ]" << COLOR_RESET << COLOR_DIM << " " << __FUNCTION__ << ":" << __LINE__ << ": " << COLOR_RESET;
    logFormat(oss, fmt, std::forward<Args>(args)...);
    std::cout << oss.str() << std::endl;
}

template <typename... Args>
void infoLog(const std::string &fmt, Args... args)
{
    std::ostringstream oss;
    oss << COLOR_INFO << "[ BRIEF ]" << COLOR_RESET << COLOR_DIM << " " << __FUNCTION__ << ":" << __LINE__ << ": " << COLOR_RESET;
    logFormat(oss, fmt, std::forward<Args>(args)...);
    std::cout << oss.str() << std::endl;
}

// 递归模板函数，用于格式化参数包
template <typename T, typename... Args>
void logFormat(std::ostringstream &oss, const std::string &fmt, T value, Args... args)
{
    size_t pos = fmt.find("{}");
    if (pos != std::string::npos)
    {
        oss << fmt.substr(0, pos) << value;
        logFormat(oss, fmt.substr(pos + 2), std::forward<Args>(args)...);
    }
    else
    {
        oss << fmt;
    }
}