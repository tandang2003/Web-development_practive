package com.nhom44.controller;

import com.nhom44.log.util.page.LogPage;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

@WebServlet(urlPatterns = "/service")
public class ServiceController extends HttpServlet {
    @Override
    protected void doGet(javax.servlet.http.HttpServletRequest req, javax.servlet.http.HttpServletResponse resp) throws javax.servlet.ServletException, java.io.IOException {
        req.setAttribute("page", "service");
        new LogPage().log(req);
        req.getRequestDispatcher("/views/public/service.jsp").forward(req, resp);
    }
}
