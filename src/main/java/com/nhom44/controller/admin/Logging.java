package com.nhom44.controller.admin;

import com.nhom44.services.CategoryService;
import com.nhom44.services.ProjectService;
import com.nhom44.services.ServiceOfProjectService;
import com.nhom44.services.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = {"/admin/logging"})
public class Logging extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int numberProject = ProjectService.getInstance().getAllProject().size();
        int numberUser = UserService.getInstance().getAllUser().size();
        int numberCategory = CategoryService.getInstance().getAll().size();
        int numberService = ServiceOfProjectService.getInstance().getAll().size();
        req.setAttribute("numberProject",numberProject);
        req.setAttribute("numberUser",numberUser);
        req.setAttribute("numberCategory",numberCategory);
        req.setAttribute("numberService",numberService);
        req.getRequestDispatcher("/views/admin/logging.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
