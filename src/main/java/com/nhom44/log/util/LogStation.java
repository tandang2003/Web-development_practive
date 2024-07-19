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
    protected HttpServletRequest request;
    protected String description;

    public LogStation(HttpServletRequest request) {
        this.log = LogContext.getLog();
        level = 1;
        this.request = request;
    }

    public void log() {
        setLogLevel();
        setAddress();
        setDescription();
        log.setPreValue(preValue);
        log.setAfterValue(postValue);
        LogServices.getInstance().insert(log);
    }

    public void log(HttpServletRequest request, String preValue, String postValue) {
        setLogLevel();
        setAddress();
        setDescription();
        LogServices.getInstance().insert(log);
    }

    protected void setLogLevel() {
        log.setLevel(level);
    }

    public void setLevel(int level) {
        this.level = level;
    }

    protected void setAddress() {
        log.setAddress(request.getRequestURI());
    }

    public void resetDescription(String description) {
        this.description = description;
    }

    protected void setDescription() {
        log.setDescription(description);
    }

}
