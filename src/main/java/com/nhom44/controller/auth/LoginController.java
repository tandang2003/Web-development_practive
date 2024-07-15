package com.nhom44.controller.auth;

import com.nhom44.log.util.page.LogPage;
import com.nhom44.services.*;
import com.nhom44.bean.User;
import com.nhom44.util.StringUtil;
import com.nhom44.validator.EmailSingleValidator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Objects;
import java.util.UUID;

@WebServlet(urlPatterns = {"/login", "/logout"})
public class LoginController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        LogPage logPage = new LogPage(req);
        logPage.setLevel(1);
        if (action != null && action.equals("logout")) {
            logPage.setLevel(2);
            req.getSession().invalidate();
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }
        logPage.log();
        req.getRequestDispatcher("/views/auth/login.jsp").forward(req, resp);
    }

}
