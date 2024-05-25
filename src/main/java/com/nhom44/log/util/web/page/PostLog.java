package com.nhom44.log.util.web.page;

import com.nhom44.log.util.LogStation;

import javax.servlet.http.HttpServletRequest;

public class PostLog extends LogPage {
    public PostLog() {
        super();
    }
    @Override
    protected void setAddress(HttpServletRequest request) {
        log.setAddress(request.getServletPath() + request.getPathInfo());
    }

    @Override
    protected void setDescription(HttpServletRequest request) {
        log.setDescription("Access to " + request.getServletPath() + request.getPathInfo() + " Page");
    }
}
