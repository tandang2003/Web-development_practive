package com.nhom44.log.util.web.function;

import com.nhom44.log.util.LogStation;

import javax.servlet.http.HttpServletRequest;

public abstract class LogFunction extends LogStation {
    public LogFunction() {
        super();
    }

    public void setPreValue() {
        this.preValue = getValue();
    }

    protected abstract String getValue();

    public void setPostValue() {
        this.postValue = getValue();
    }
}
