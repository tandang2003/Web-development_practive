package com.nhom44.controller.admin.project;

import com.nhom44.bean.Post;
import com.nhom44.bean.Project;
import com.nhom44.bean.Service;
import com.nhom44.services.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = {"/admin/project/add", "/admin/project/edit/*"})
public class ProjectAdditionalAndEdit extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (req.getRequestURI().equals("/admin/project/add")) {
            req.getRequestDispatcher("/views/admin/project/add_project.jsp").forward(req, resp);
        }else if(req.getServletPath().equals("/admin/project/edit"))
                req.getRequestDispatcher("/views/admin/project/update_project_page.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    }
}
