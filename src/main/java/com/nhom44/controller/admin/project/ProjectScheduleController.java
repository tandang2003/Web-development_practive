package com.nhom44.controller.admin.project;

import com.nhom44.bean.Project;
import com.nhom44.services.ProjectService;
import com.nhom44.services.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns="/admin/project_schedule")
public class ProjectScheduleController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ProjectService projectService = ProjectService.getInstance();
        List<Project> projects = projectService.getExcuting();
        for (Project project: projects) {
            System.out.println(project.toString());
        }
        List<String> emails= UserService.getInstance().getEmailOwner();
//        for (Project project: projects) {
//            emails.add(UserService.getInstance().getEmailUserWithProjectId(project.getId()));
//        }
        req.setAttribute("emails", emails);
        req.setAttribute("projects", projects);
        req.getRequestDispatcher("/views/admin/project/project_schedule.jsp").forward(req, resp);
    }
}
