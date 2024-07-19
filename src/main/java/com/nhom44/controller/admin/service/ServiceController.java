package com.nhom44.controller.admin.service;

import com.nhom44.bean.Project;
import com.nhom44.bean.Post;
import com.nhom44.bean.Service;
import com.nhom44.log.util.page.AdminLogPage;
import com.nhom44.services.PostService;
import com.nhom44.services.ProjectService;
import com.nhom44.services.ServiceOfProjectService;
import com.nhom44.validator.NumberVallidator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = {"/admin/service", "/admin/service/add", "/admin/service/edit/*"})
public class ServiceController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String url = req.getServletPath();
        new AdminLogPage(req).log();
        if (url.equalsIgnoreCase("/admin/service/add")) {
            req.getRequestDispatcher("/views/admin/service/service_add.jsp").forward(req, resp);
            return;
        } else if (url.equals("/admin/service/edit")) {
            req.getRequestDispatcher("/views/admin/service/service_edit.jsp").forward(req, resp);
            return;
        }
        req.getRequestDispatcher("/views/admin/service/service_manage.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
