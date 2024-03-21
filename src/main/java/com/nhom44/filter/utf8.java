package com.nhom44.filter;


import javax.servlet.*;
import java.io.IOException;

public class utf8 implements Filter {
    private String encoding = "utf-8";
    private ServletRequest request;
    private ServletResponse response;
    private FilterChain filterChain;

    public void init(FilterConfig config) throws ServletException {
        String encodingParam =
                config.getInitParameter("encoding");
        if (encodingParam != null) {
            encoding = encodingParam;
        }
    }

    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        this.request = request;
        this.response = response;
        this.filterChain = chain;
        request.setCharacterEncoding(encoding);
        response.setCharacterEncoding(encoding);
        filterChain.doFilter(request, response);

    }
}
