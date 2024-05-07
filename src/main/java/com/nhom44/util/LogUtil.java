package com.nhom44.util;

public class LogUtil {
    public static final int LOG_LEVEL_INFO = 1;
    public static final int LOG_LEVEL_ALERT = 2;
    public static final int LOG_LEVEL_WARNING = 3;
    public static final int LOG_LEVEL_DANGER = 4;

    public static String getLogStr(int logLevel){
        switch (logLevel){
            case LOG_LEVEL_INFO:
                return "INFO";
            case LOG_LEVEL_ALERT:
                return "ALERT";
            case LOG_LEVEL_WARNING:
                return "WARNING";
            case LOG_LEVEL_DANGER:
                return "DANGER";
            default:
                return "UNKNOWN";
        }
    }
}
