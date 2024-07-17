
package com.nhom44.filter;

import com.nhom44.bean.User;
import com.nhom44.services.UserService;

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
        System.out.println(1);
        this.request = (HttpServletRequest) request;
        this.response = (HttpServletResponse) response;
        this.filterChain = chain;
        String uri = ((HttpServletRequest) request).getRequestURI();

        User user = (User) this.request.getSession().getAttribute("account");

        if (user == null) {
            this.response.sendRedirect(this.request.getContextPath() + "/login");
            return;
        } else {
            int id= UserService.getInstance().getRole(user.getId());
            if (uri.startsWith("/admin") && id != 1) {
                this.response.sendRedirect(this.request.getContextPath() + "/home");
                return;
            }
        }
        this.filterChain.doFilter(this.request, this.response);
    }

    @Override
    public void destroy() {
        Filter.super.destroy();
    }
}
