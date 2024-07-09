package com.nhom44.log.util.function;

import javax.servlet.http.HttpServletRequest;

public class SignupLog extends LogFunction{
    public SignupLog(HttpServletRequest request) {
        super(request);
    }

    @Override
    protected String getValue() {
        return null;
    }
}
