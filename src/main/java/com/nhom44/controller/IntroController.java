package com.nhom44.controller;

import com.nhom44.log.util.page.LogPage;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

@WebServlet(urlPatterns = "/intro")
public class IntroController extends HttpServlet {
    @Override
    protected void doGet(javax.servlet.http.HttpServletRequest req, javax.servlet.http.HttpServletResponse resp) throws javax.servlet.ServletException, java.io.IOException {
        new LogPage().log(req);
        req.getRequestDispatcher("/views/public/intro.jsp").forward(req, resp);
    }
}
