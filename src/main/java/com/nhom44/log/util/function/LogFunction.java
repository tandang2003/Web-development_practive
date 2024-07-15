package com.nhom44.log.util.function;

import com.nhom44.log.util.LogStation;

import javax.servlet.http.HttpServletRequest;

public abstract class LogFunction extends LogStation {


    public LogFunction(HttpServletRequest request) {
        super(request);
    }

    public void setPreValue() {
        this.preValue = getValue();
    }

    protected abstract String getValue();

    public void setPostValue() {
        this.postValue = getValue();
    }
}
