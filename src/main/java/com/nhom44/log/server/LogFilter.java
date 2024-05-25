package com.nhom44.log.server;

import com.nhom44.ip2location.Ip2Location;
import com.nhom44.log.model.Log;
import com.nhom44.log.model.LogContext;

import javax.servlet.*;
import java.io.IOException;
import java.sql.Timestamp;
import java.time.Instant;

public class LogFilter implements Filter {
    private ServletContext context;
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        this.context = filterConfig.getServletContext();
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        System.out.println(2);
        String ip = servletRequest.getRemoteAddr();
        String nation = Ip2Location.getNationality(ip);
        String createdAt = String.valueOf(Timestamp.from(Instant.now()));
        String updatedAt = String.valueOf(Timestamp.from(Instant.now()));
        Log log = Log.builder()
                .ip(ip)
                .national(nation)
                .build();

        LogContext.setLog(log);
        filterChain.doFilter(servletRequest, servletResponse);
        LogContext.removeLog();
    }

    @Override
    public void destroy() {
        Filter.super.destroy();
    }
}
