package com.nhom44.log.util.page;

import com.nhom44.log.util.LogStation;

import javax.servlet.http.HttpServletRequest;

public class AdminLogPage extends LogStation {
    public AdminLogPage(HttpServletRequest request) {
        super(request);
        setLevel(2);
        resetDescription("Access to "+request.getRequestURI());
    }
}
