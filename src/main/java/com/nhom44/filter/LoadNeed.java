package com.nhom44.filter;

import com.nhom44.bean.Category;
import com.nhom44.bean.Province;
import com.nhom44.bean.Service;
import com.nhom44.services.CategoryService;
import com.nhom44.services.ProvinceService;
import com.nhom44.services.ServiceOfProjectService;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class LoadNeed implements Filter {
    private HttpServletRequest request;
    private HttpServletResponse response;
    private FilterChain filterChain;
    private ServletContext context;

    public void init(FilterConfig config) throws ServletException {
        this.context = config.getServletContext();
    }

    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        this.request = (HttpServletRequest) request;
        this.response = (HttpServletResponse) response;
        this.filterChain = chain;
        List<Province> allProvinces = ProvinceService.getInstance().getAll();
        this.request.setAttribute("allProvinces", allProvinces);
        List<Service> allServices = ServiceOfProjectService.getInstance().getAllActive();
        this.request.setAttribute("allServices", allServices);
        List<Category> allCategories = CategoryService.getInstance().getAllActive();
        this.request.setAttribute("allCategories", allCategories);
        this.filterChain.doFilter(this.request, this.response);
    }
}
