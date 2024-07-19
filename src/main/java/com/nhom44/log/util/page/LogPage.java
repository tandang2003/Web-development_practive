package com.nhom44.log.util.page;

import com.nhom44.log.model.Log;
import com.nhom44.log.model.LogContext;
import com.nhom44.log.util.LogStation;
import com.nhom44.services.LogServices;

import javax.servlet.http.HttpServletRequest;

public class LogPage extends LogStation {

    public LogPage(HttpServletRequest request) {
        super(request);
        resetDescription("Access to "+request.getRequestURI());
    }
}
