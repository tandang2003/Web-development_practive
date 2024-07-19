package com.nhom44.controller;

import com.nhom44.bean.Category;
import com.nhom44.log.util.page.LogPage;
import com.nhom44.services.CategoryService;
import com.nhom44.util.PriceObjectHelper;
import com.nhom44.util.SearcherProjectUtil;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import java.util.List;

@WebServlet(urlPatterns = "/project")
public class ProjectController extends HttpServlet {
    @Override
    protected void doGet(javax.servlet.http.HttpServletRequest req, javax.servlet.http.HttpServletResponse resp) throws javax.servlet.ServletException, java.io.IOException {
        req.setAttribute("page", "project");
        new LogPage(req).log();
        req.getRequestDispatcher("/views/public/project.jsp").forward(req, resp);
    }
}
