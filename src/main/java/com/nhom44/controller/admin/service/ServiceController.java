package com.nhom44.controller.admin.service;

import com.nhom44.bean.Project;
import com.nhom44.bean.Post;
import com.nhom44.bean.Service;
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

@WebServlet(urlPatterns = "/admin/service")
public class ServiceController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action") != null ? req.getParameter("action") : "#";
        try {
            if (action.equalsIgnoreCase("add")) {
                req.getRequestDispatcher("/views/admin/service/service_add.jsp").forward(req, resp);
                return;
            } else if (action.equals("edit")) {
                if (!new NumberVallidator().validator(req.getParameter("id"))) {
                    // error
                }
                int id = Integer.parseInt(req.getParameter("id"));
                Service service = ServiceOfProjectService.getInstance().getById(id);
                Post post = PostService.getInstance().getById(service.getPostId());
                if (post == null) {
                    //error
                }
                req.setAttribute("post", post);
                req.setAttribute("service", service);
                req.getRequestDispatcher("/views/admin/service/service_edit.jsp").forward(req, resp);
                return;
            } else if (action.equals("delete")) {
//            req.getRequestDispatcher("/views/admin/service/service_delete.jsp").forward(req, resp);
            }
            req.setAttribute("serviceList", ServiceOfProjectService.getInstance().getAll());
            req.getRequestDispatcher("/views/admin/service/service_manage.jsp").forward(req, resp);
        } catch (NullPointerException e) {
            resp.sendRedirect("/admin/project_management");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
