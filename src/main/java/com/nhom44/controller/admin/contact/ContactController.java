package com.nhom44.controller.admin.contact;

import com.nhom44.log.util.page.AdminLogPage;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = {"/admin/contact"})
public class ContactController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        new AdminLogPage(req).log();
        req.getRequestDispatcher("/views/admin/contact/contact_manage.jsp").forward(req,resp);
    }
}
