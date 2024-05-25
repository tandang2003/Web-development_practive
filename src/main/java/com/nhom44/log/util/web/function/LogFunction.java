package com.nhom44.log.util.web.function;

import com.nhom44.log.util.LogStation;

import javax.servlet.http.HttpServletRequest;

public abstract class LogFunction extends LogStation {
    public LogFunction() {
        super();
    }
    public  void setPreValue(String updatedAt){
        this.preValue = getValue(updatedAt);
    }

    protected abstract String getValue(String updatedAt);

    public void setPostValue(String updatedAt){
        this.postValue = getValue(updatedAt);
    }
}
