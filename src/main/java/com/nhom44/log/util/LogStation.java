package com.nhom44.log.util;

import com.nhom44.log.model.Log;
import com.nhom44.log.model.LogContext;
import com.nhom44.services.LogServices;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

public abstract class LogStation {
    protected Log log;

    protected String preValue;
    protected String postValue;
    protected int level;

    public LogStation() {
        this.log = LogContext.getLog();
        level = 1;
    }

    public void log(HttpServletRequest request) {
        setLogLevel();
        setAddress(request);
        setDescription(request);
        log.setPreValue(preValue);
        log.setAfterValue(postValue);
        LogServices.getInstance().insert(log);
    }

    public void log(HttpServletRequest request, String preValue, String postValue) {
        setLogLevel();
        setAddress(request);
        setDescription(request);
        LogServices.getInstance().insert(log);
    }

    protected void setLogLevel() {
        log.setLevel(level);
    }

    public void setLevel(int level) {
        this.level = level;
    }

    protected void setAddress(HttpServletRequest request) {
        log.setAddress(request.getRequestURI());
    }

    protected void setDescription(HttpServletRequest request) {
        log.setDescription("Access to " + request.getServletPath() + request.getPathInfo() + " Page");
    }

}
