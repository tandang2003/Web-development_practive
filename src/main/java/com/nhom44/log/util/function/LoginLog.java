package com.nhom44.log.util.function;

import javax.servlet.http.HttpServletRequest;

public class LoginLog extends LogFunction{
    public LoginLog(HttpServletRequest request) {
        super(request);
    }

    @Override
    protected String getValue() {
        return null;
    }
}
