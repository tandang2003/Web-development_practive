package com.nhom44.filter;

import com.google.gson.JsonObject;
import com.nhom44.bean.User;
import com.nhom44.services.UserService;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class FilterRole implements Filter {
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
        String uri = ((HttpServletRequest) request).getServletPath();

        User user = (User) this.request.getSession().getAttribute("account");
        if (user == null) {
            this.filterChain.doFilter(this.request, this.response);
            return;
        }
        if (user.getRoleId() == 2) {
            System.out.println("watcher");
            if (uri.startsWith("/admin") && (uri.contains("add") || uri.contains("/edit") || uri.endsWith("/delete"))) {
                this.response.sendRedirect(this.request.getContextPath() + "/admin/dashboard");
                return;
            }
        }
        if (user.getRoleId() == 3) {
            if (uri.startsWith("/api/admin/user") && uri.endsWith("/edit")) {
                JsonObject jsonObject = new JsonObject();
                jsonObject.addProperty("message", "Bạn không có quyền thực hiện hành vi này");
                this.response.getWriter().println(jsonObject.toString());
                this.response.setStatus(200);
                return;
            }
        } else {
            if (uri.startsWith("/admin/logging")) {
                JsonObject jsonObject = new JsonObject();
                jsonObject.addProperty("message", "Bạn không có quyền thực hiện hành vi này");
                this.response.getWriter().println(jsonObject.toString());
                this.response.setStatus(200);
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
