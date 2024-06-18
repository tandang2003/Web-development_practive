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
        LogPage logPage = new LogPage();
        logPage.setLevel(1);
        if (action != null && action.equals("logout")) {
            logPage.setLevel(2);
            req.getSession().invalidate();
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }
        logPage.log(req);
        req.getRequestDispatcher("/views/auth/login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        System.out.println(action);
        System.out.println(req.getParameterMap().keySet().toString());
        if (action != null && action.equals("login")) {
            String email = new EmailSingleValidator().validator(req.getParameter("email")) ? req.getParameter("email") : "";
            String password = req.getParameter("password") != null && !req.getParameter("password").isEmpty() ? req.getParameter("password") : "";
            System.out.println(password);
            System.out.println(StringUtil.hashPassword(password));
            User user = UserService.getInstance().login(email, password);
            System.out.println(user != null);
            if (user != null && Objects.equals(user.getEmail(), email) && Objects.equals(user.getPassword(), StringUtil.hashPassword(password))) {
                if (user.getStatus() == 2) {
                    req.setAttribute("error", "Tài khoản của bạn đã bị khóa");
                    System.out.println("Tài khoản của bạn đã bị khóa");
                    req.getRequestDispatcher("/views/auth/login.jsp").forward(req, resp);
                    return;
                }
                if (user.getStatus() == 0) {
                    String token = UUID.randomUUID().toString();
                    VerifyService.getInstance().insert(token, user.getId());
                    MailService.getInstance().sendMailToAGaig(null, user.getEmail(), token);
                    req.setAttribute("error", "Tài khoản của bạn chưa được kích hoạt vui lòng kiểm tra email để kích hoạt tài khoản");
                    System.out.println("Tài khoản của bạn chưa được kích hoạt vui lòng kiểm tra email để kích hoạt tài khoản");
                    req.getRequestDispatcher("/views/auth/login.jsp").forward(req, resp);

                    return;
                }
                req.getSession().setAttribute("auth", user);
                if (user.getRole() == 1) {
                    resp.sendRedirect(req.getContextPath() + "/admin");
                    return;
                }
                if (user.getRole() == 0) {
                    resp.sendRedirect(req.getContextPath() + "/user");
                    return;
                }
            }
            req.setAttribute("error", "Sai thông tin đăng nhập hoặc mật khẩu");
            System.out.println("Sai thông tin đăng nhập hoặc mật khẩu");
            req.getRequestDispatcher("/views/auth/login.jsp").forward(req, resp);

//            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }
        req.getRequestDispatcher("/views/auth/login.jsp").forward(req, resp);
    }
}
