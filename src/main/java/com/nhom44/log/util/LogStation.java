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

    public LogStation() {
        this.log = LogContext.getLog();
    }

    public void log(HttpServletRequest request){
        setLevel();
        setAddress(request);
        setDescription(request);
        log.setPreValue(preValue);
        log.setAfterValue(postValue);
        LogServices.getInstance().insert(log);
    }

    public void log(HttpServletRequest request, String preValue, String postValue){
        setLevel();
        setAddress(request);
        setDescription(request);
        LogServices.getInstance().insert(log);
    }
    private void setLevel() {
        log.setLevel(1);
    }
    protected void setAddress(HttpServletRequest request) {
        log.setAddress(request.getServletPath());
    }

    protected void setDescription(HttpServletRequest request) {
        log.setDescription("Access to " + request.getServletPath()+request.getPathInfo() + " Page");
    }

}
