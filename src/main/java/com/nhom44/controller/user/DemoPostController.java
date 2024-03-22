package com.nhom44.controller.user;

import com.nhom44.bean.Project;
import com.nhom44.bean.Post;
import com.nhom44.bean.Service;
import com.nhom44.services.ImageService;
import com.nhom44.services.PostService;
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

@WebServlet(urlPatterns = {"/user/own-project/demo-post/*"})
public class DemoPostController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        LoadSession.loadSession(req);
        req.setAttribute("page", "account");
        String path = req.getPathInfo();
        System.out.println("path: " + path);
        String url = req.getRequestURL().toString();
        String id = url.substring(url.lastIndexOf("/") + 1);

        if (id == null||id.equals("")) {
            resp.sendRedirect("/404");
            return;
        }
        try {
            Integer.parseInt(id);
        } catch (NumberFormatException e) {
            resp.sendRedirect("/404");
            return;
        }
        int idInt = Integer.parseInt(id);
        if (idInt <= 0) {
            resp.sendRedirect("/404");
            return;
        }
        Project project = ProjectService.getInstance().getById(idInt);
        if (project == null) {
            resp.sendRedirect("/404");
            return;
        }
        System.out.println(project.toString());
        req.setAttribute("project", project);
        Post post = PostService.getInstance().getById(project.getPostId());
        req.setAttribute("post", post);
        List<Service> services = ServiceOfProjectService.getInstance().getServicesByProjectId(project.getId());
        System.out.println("services: " + services.size());
        for (Service service : services) {
            System.out.println(service.getName());
        }
        List<String> gallery = ImageService.getInstance().getGroupImagesByProjectId(idInt);
        req.setAttribute("gallery", gallery);
        req.setAttribute("services", services);
        req.getRequestDispatcher("/views/user/demoPost.jsp").forward(req, resp);
    }
}
