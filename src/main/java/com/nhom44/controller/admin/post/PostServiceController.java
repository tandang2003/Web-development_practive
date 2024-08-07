package com.nhom44.controller.admin.post;

import com.nhom44.bean.Post;
import com.nhom44.log.util.page.AdminLogPage;
import com.nhom44.log.util.page.LogPage;
import com.nhom44.services.PostService;
import com.nhom44.services.ServiceOfProjectService;
import com.nhom44.validator.NumberVallidator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/admin/post_service")
public class PostServiceController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        new AdminLogPage(req).log();
        String action = req.getParameter("action") != null ? req.getParameter("action") : "#";
        if (action.equalsIgnoreCase("edit")) {
            if (!new NumberVallidator().validator(req.getParameter("id"))) {
//                req.setAttribute("service", ServiceOfProjectService.getInstance().getById(Integer.parseInt(req.getParameter("id"))));
                //error
                resp.sendRedirect("/404");
            }
            int id = Integer.parseInt(req.getParameter("id"));
            Post post = PostService.getInstance().getById(id);
            if (post == null) {
                resp.sendRedirect("/404");
            }
            req.setAttribute("post", post);
            req.getRequestDispatcher("/views/admin/service/update_service_post.jsp").forward(req, resp);
            return;
        }
        req.setAttribute("services", ServiceOfProjectService.getInstance().getAdminAll());

        req.getRequestDispatcher("/views/admin/service/post_service.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    }
}
