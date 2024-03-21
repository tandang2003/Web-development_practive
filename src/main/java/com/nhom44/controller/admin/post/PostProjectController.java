package com.nhom44.controller.admin.post;

import com.nhom44.bean.Post;
import com.nhom44.bean.Project;
import com.nhom44.services.PostService;
import com.nhom44.services.ProjectService;
import com.nhom44.validator.NumberVallidator;
import org.apache.commons.beanutils.BeanUtils;
import org.jdbi.v3.core.statement.UnableToExecuteStatementException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.List;

@WebServlet(urlPatterns = "/admin/post_project")
public class PostProjectController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action") == null ? "#" : req.getParameter("action");

        if (action.equalsIgnoreCase("edit")) {
            if (!new NumberVallidator().validator(req.getParameter("id"))) {
                //TODO: redirect to error page
            }
            try {
                int id = Integer.parseInt(req.getParameter("id"));
                Project project = ProjectService.getInstance().getById(id);
                Post post = PostService.getInstance().getById(project.getPostId());
                req.setAttribute("post", post);
                req.getRequestDispatcher("/views/admin/project/update_project_post.jsp").forward(req, resp);
                return;
            } catch (NullPointerException e) {
                req.setAttribute("error", "Có lỗi xảy ra, vui lòng thử lại sau");
                req.getRequestDispatcher("/views/admin/project/post_project.jsp").forward(req, resp);
            }
        }
        if (action.equalsIgnoreCase("save")) {
            doPost(req, resp);
        }
        List<Project> projects = ProjectService.getInstance().getNumOfSavedAndRead();
        req.setAttribute("projects", projects);
        req.getRequestDispatcher("/views/admin/project/post_project.jsp").forward(req, resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (!new NumberVallidator().validator(req.getParameter("id"))) {
            // TODO: redirect to error page
        }
        Post post = new Post();
        try {
            BeanUtils.populate(post, req.getParameterMap());
            PostService.getInstance().updatePost(post);
        } catch (IllegalAccessException | NullPointerException | InvocationTargetException |
                 UnableToExecuteStatementException e) {
            req.setAttribute("error", "Có lỗi xảy ra, vui lòng thử lại sau");
            req.getRequestDispatcher("/views/admin/project/update_project_post.jsp").forward(req, resp);
        }

        resp.sendRedirect("/admin/post_project");
    }
}
