package com.nhom44.api.admin;

import com.google.gson.JsonArray;
import com.nhom44.bean.Project;
import com.nhom44.services.ProjectService;
import com.nhom44.services.UserService;
import com.nhom44.util.StringUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = {"/api/dashboard", "/api/dashboard/project","/api/dashboard/contact","/api/dashboard/count"})
public class dashboard extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println(req.getRequestURI());
        if (req.getRequestURI().startsWith("/api/dashboard/project")) {
            List<Project> projects = ProjectService.getInstance().getAllProject();
            List<String> emails = UserService.getInstance().getEmailOwner();
            System.out.println(StringUtil.buildJsonUserProject(projects, emails));
            resp.getWriter().println(StringUtil.buildJsonUserProject(projects, emails));
            resp.getWriter().flush();
            resp.getWriter().close();
            return;
        }
        if (req.getRequestURI().startsWith("/api/dashboard/contact")) {
            List<String> emails = UserService.getInstance().getEmailOwner();
//            resp.getWriter().println(StringUtil.buildJsonContact(emails));
            resp.getWriter().flush();
            resp.getWriter().close();
            return;
        }


    }
}
