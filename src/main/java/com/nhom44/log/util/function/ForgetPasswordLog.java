package com.nhom44.log.util.function;

import javax.servlet.http.HttpServletRequest;

public class ForgetPasswordLog extends LogFunction{
    public ForgetPasswordLog(HttpServletRequest request) {
        super(request);
    }

    @Override
    protected String getValue() {
        return null;
    }
}
