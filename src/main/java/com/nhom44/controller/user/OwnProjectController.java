package com.nhom44.controller.user;

import com.nhom44.bean.Project;
import com.nhom44.bean.User;
import com.nhom44.services.ProjectService;
import com.nhom44.services.ServiceOfProjectService;
import com.nhom44.util.LoadSession;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet(urlPatterns = {"/user/own-project"})
public class OwnProjectController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("page", "account");
        LoadSession.loadSession(req);
        User user= (User) req.getSession().getAttribute("auth");
        List<Project> projects= ProjectService.getInstance().getOwnProject(user.getId());
        req.setAttribute("projects", projects);
        Map<Integer, String> map = ServiceOfProjectService.getInstance().getServicesForOwnerByProjectIds(projects);
        req.setAttribute("map", map);
        req.getRequestDispatcher("/views/user/ownproject.jsp").forward(req, resp);
    }

}
