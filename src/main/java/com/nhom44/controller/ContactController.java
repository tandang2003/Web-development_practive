package com.nhom44.controller;

import com.nhom44.bean.Category;
import com.nhom44.services.CategoryService;
import com.nhom44.util.LoadSession;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import java.util.List;

@WebServlet(urlPatterns = "/contact")
public class ContactController extends HttpServlet {
    @Override
    protected void doGet(javax.servlet.http.HttpServletRequest req, javax.servlet.http.HttpServletResponse resp) throws javax.servlet.ServletException, java.io.IOException {
        req.setAttribute("page", "contact");
        LoadSession.loadSession(req);
        req.getRequestDispatcher("/views/public/contact.jsp").forward(req, resp);
    }
}
