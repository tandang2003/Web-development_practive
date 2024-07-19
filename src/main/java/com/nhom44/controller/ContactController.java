package com.nhom44.controller;

import com.nhom44.log.util.page.LogPage;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

@WebServlet(urlPatterns = "/contact")
public class ContactController extends HttpServlet {
    @Override
    protected void doGet(javax.servlet.http.HttpServletRequest req, javax.servlet.http.HttpServletResponse resp) throws javax.servlet.ServletException, java.io.IOException {
        req.setAttribute("page", "contact");
        new LogPage(req).log();
        req.getRequestDispatcher("/views/public/contact.jsp").forward(req, resp);
    }
}
