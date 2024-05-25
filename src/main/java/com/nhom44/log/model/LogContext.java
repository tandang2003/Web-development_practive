package com.nhom44.log.model;

public class LogContext {
    public static ThreadLocal<Log> logHolder= new ThreadLocal<>();
    public static void setLog(Log log){
        logHolder.set(log);
    }
    public static Log getLog(){
        return logHolder.get();
    }
    public static void removeLog(){
        logHolder.remove();
    }

}
