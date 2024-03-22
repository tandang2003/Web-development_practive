package com.nhom44.controller;

import com.nhom44.DAO.ImageDAO;
import com.nhom44.bean.*;
import com.nhom44.services.*;
import com.nhom44.util.LoadSession;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = {"/post/project", "/post/service"})
public class PostController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String url = req.getRequestURI();
        LoadSession.loadSession(req);
        String FindingID = req.getParameter("id");
        if (FindingID == null) {
            resp.sendRedirect("/404");
            return;
        }
        if (url.equals("/post/project")) {
            try {
                req.setAttribute("page", "post-project");
                Project project = ProjectService.getInstance().getActiveById(Integer.parseInt(FindingID));
                project.setUpdatedAt(project.getUpdatedAt().substring(0, 10));
                List<Service> servicesOfProject = ServiceOfProjectService.getInstance().getServicesByProjectId(project.getId());
                List<String> gallery = ImageService.getInstance().getGroupImagesByProjectId(Integer.parseInt(FindingID));
                Post post = PostService.getInstance().getById(project.getPostId());
                List<Project> suggestProjects = ProjectService.getInstance().getSuggestProjects(project.getCategoryId());
                User user = (User) req.getSession().getAttribute("auth");
                if (user != null) {
                    project.setSaveBy(ProjectService.getInstance().isLikeByUser(user.getId(), post.getId()) ? user.getId() : 0);
                    ProjectService.getInstance().addHistory(user.getId(), post.getId());
                }
                req.setAttribute("suggestProjects", suggestProjects);
                req.setAttribute("gallery", gallery);
                req.setAttribute("services", servicesOfProject);
                req.setAttribute("post", post);
                req.setAttribute("project", project);
                req.getRequestDispatcher("/views/public/postProject.jsp").forward(req, resp);
                return;
            } catch (NullPointerException e) {
                resp.sendRedirect("/404");
                return;
            }
        }
        if (url.equals("/post/service")) {
            try {
                req.setAttribute("page", "post-service");
                Service service = ServiceOfProjectService.getInstance().getActiveById(Integer.parseInt(FindingID));
                service.setUpdatedAt(service.getUpdatedAt().substring(0, 10));
                Post post = PostService.getInstance().getById(service.getPostId());
                List<Service> suggestServices = ServiceOfProjectService.getInstance().getSuggestServices();
                User user = (User) req.getSession().getAttribute("auth");
                if (user != null) {
                    ProjectService.getInstance().addHistory(user.getId(), post.getId());
                }
                req.setAttribute("suggestServices", suggestServices);
                req.setAttribute("post", post);
                req.setAttribute("service", service);
                req.getRequestDispatcher("/views/public/postService.jsp").forward(req, resp);
                return;
            } catch (NullPointerException e) {
                resp.sendRedirect("/404");
                return;
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action") != null ? req.getParameter("action") : "";
        if (action.equals("cast")) {
            String name = req.getParameter("name");
            resp.getWriter().println("Hello " + name);
            return;
        }
    }
}
