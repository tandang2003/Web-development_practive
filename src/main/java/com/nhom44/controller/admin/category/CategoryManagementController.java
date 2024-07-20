package com.nhom44.controller.admin.category;

import com.nhom44.bean.Category;
import com.nhom44.log.util.page.AdminLogPage;
import com.nhom44.services.CategoryService;
import com.nhom44.validator.NumberVallidator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = {"/admin/category_management", "/admin/category_management/add", "/admin/category_management/edit/*"})
public class CategoryManagementController extends HttpServlet {
    CategoryService categoryService = CategoryService.getInstance();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        new AdminLogPage(req).log();
        String url = req.getServletPath();
        if (url.equalsIgnoreCase("/admin/category_management/add")) {
            req.getRequestDispatcher("/views/admin/category/add_category.jsp").forward(req, resp);
            return;
        }
        if (url.equalsIgnoreCase("/admin/category_management/edit")) {
            if (!new NumberVallidator().validator(req.getPathInfo().substring(1))) {
                resp.sendRedirect("/404");
            }
            req.getRequestDispatcher("/views/admin/category/edit_category.jsp").forward(req, resp);
            return;
        }
        req.getRequestDispatcher("/views/admin/category/category_management.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    }
}
