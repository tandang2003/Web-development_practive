package com.nhom44.controller.admin.category;

import com.nhom44.bean.Category;
import com.nhom44.services.CategoryService;
import com.nhom44.validator.NumberVallidator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/admin/category_management")
public class CategoryManagementController extends HttpServlet {
    CategoryService categoryService = CategoryService.getInstance();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action= req.getParameter("action")==null?"#": req.getParameter("action");
        if(action.equalsIgnoreCase("add")){
            req.getRequestDispatcher("/views/admin/category/add_category.jsp").forward(req, resp);
            return;
        }
        if(action.equalsIgnoreCase("edit")){
            if(!new NumberVallidator().validator(req.getParameter("id"))){
                resp.sendRedirect("/404");
            }
                int id = Integer.parseInt(req.getParameter("id"));
                Category category = CategoryService.getInstance().getById(id);
                if(category==null){
                    resp.sendRedirect("/404");
                }
                req.setAttribute("category", category);
                req.getRequestDispatcher("/views/admin/category/edit_category.jsp").forward(req, resp);
                return;
        }
        req.setAttribute("categories", categoryService.getAll());
        req.getRequestDispatcher("/views/admin/category/category_management.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
