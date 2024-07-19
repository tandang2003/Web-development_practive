package com.nhom44.api.admin;

import com.google.gson.Gson;
import com.nhom44.bean.Project;
import com.nhom44.services.ProjectService;
import com.nhom44.services.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import static com.nhom44.util.GsonUtil.getGson;

@WebServlet(urlPatterns = "/api/admin/project_schedule")
public class ProjectScheduleController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ProjectService projectService = ProjectService.getInstance();
        List<Project> projects = projectService.getExcuting();

        for (int i = 0; i < projects.size(); i++) {
            projects.get(i).setOwner(UserService.getInstance().getUserOwnerOfProject(projects.get(i).getId()).getEmail());
        }
        PrintWriter out = resp.getWriter();
        out.print(getGson().toJson(projects));
        out.flush();
        out.close();
    }
}
