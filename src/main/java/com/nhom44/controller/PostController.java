package com.nhom44.controller;

import com.nhom44.DAO.ImageDAO;
import com.nhom44.bean.*;
import com.nhom44.log.util.web.page.PostLog;
import com.nhom44.services.*;
import com.nhom44.util.LoadSession;
import com.nhom44.validator.NumberVallidator;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = {"/post/project/*", "/post/service/*"})
public class PostController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String url = req.getServletPath();
        String id = req.getPathInfo().trim().substring(1);
        String FindingID = id;
        if (id == null || !new NumberVallidator().validator(id)) {
            resp.sendRedirect("/404");
            return;
        }
        new PostLog().log(req);
        if (url.equals("/post/project")) {
            req.getRequestDispatcher("/views/public/postProject.jsp").forward(req, resp);
        } else if (url.equals("/post/service")) {
            req.getRequestDispatcher("/views/public/postService.jsp").forward(req, resp);
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
