
package com.nhom44.filter;

import com.nhom44.bean.User;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class  Authencation implements Filter {
    private HttpServletRequest request;
    private HttpServletResponse response;
    private FilterChain filterChain;
    private ServletContext context;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        this.context = filterConfig.getServletContext();
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        this.request = (HttpServletRequest) request;
        this.response = (HttpServletResponse) response;
        this.filterChain = chain;
        String uri = ((HttpServletRequest) request).getRequestURI();

        User user = (User) this.request.getSession().getAttribute("auth");
        if (user == null) {
            this.response.sendRedirect(this.request.getContextPath() + "/login");
            return;
        } else if (uri.startsWith("/admin") && user.getRole() != 1) {
            this.response.sendRedirect(this.request.getContextPath() + "/login");
            return;

        }
//            if (user == null || user.getRole() != 1) {
//                this.response.sendRedirect(this.request.getContextPath() + "/login");
//                return;
//            }
        this.filterChain.doFilter(this.request, this.response);

    }

    @Override
    public void destroy() {
        Filter.super.destroy();
    }
}
