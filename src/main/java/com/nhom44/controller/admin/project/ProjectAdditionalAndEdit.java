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

@WebServlet(urlPatterns = {"/admin/project/add", "/admin/project/edit"})
public class ProjectAdditionalAndEdit extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        CategoryService categoryService = CategoryService.getInstance();
        req.setAttribute("categories", categoryService.getAll());
        ServiceOfProjectService serviceOfProjectService = ServiceOfProjectService.getInstance();
        req.setAttribute("services", serviceOfProjectService.getAll());
        ProvinceService provinceService = ProvinceService.getInstance();
        req.setAttribute("provinces", provinceService.getAll());
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String url = req.getRequestURI();
        resp.addHeader("Access-Control-Allow-Origin", "*");
        if (url.equals("/admin/project/add")) {
            req.getRequestDispatcher("/views/admin/project/add_project.jsp").forward(req, resp);
        } else if (url.equals("/admin/project/edit")) {
            if (req.getParameter("id") == null || req.getParameter("id").isEmpty()) {
             //error
               resp.sendRedirect("/404");
                return;
            }
            try {
                int id = Integer.parseInt(req.getParameter("id"));
                Project project = ProjectService.getInstance().getById(id);
                if (project == null) {
                    resp.sendRedirect("/admin/project_management");
                    return;
                }
                req.setAttribute("project", project);
                if (project.getEstimated_complete() == null || project.getEstimated_complete().isEmpty() || project.getSchedule() == null || project.getSchedule().isEmpty()) {
                    req.setAttribute("isExcuting", false);
                } else {
                    req.setAttribute("isExcuting", true);
                }
                System.out.println(project.toString());
                Post post = PostService.getInstance().getById(project.getPostId());
                System.out.println(post.toString());
                req.setAttribute("post", post);
                List<Service> services = ServiceOfProjectService.getInstance().getServicesByProjectId(id);

                req.setAttribute("servicesOfproject", services);

                String userEmail = UserService.getInstance().getUserOwnerOfProject(project.getId()).getEmail();
                req.setAttribute("userEmail", userEmail);

                List<String> groupImages = ImageService.getInstance().getGroupImagesByProjectId(id);
                req.setAttribute("groupImages", groupImages);
                req.getRequestDispatcher("/views/admin/project/update_project_page.jsp").forward(req, resp);
            } catch (NumberFormatException | NullPointerException e) {
                resp.sendRedirect("/admin/project_management");
            }
        }
    }
}
