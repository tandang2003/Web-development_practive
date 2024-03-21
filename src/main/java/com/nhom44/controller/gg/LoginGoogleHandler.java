package com.nhom44.controller.gg;

import com.nhom44.bean.GoogleAccount;
import com.nhom44.bean.User;
import com.nhom44.services.UserService;
import com.nhom44.util.GoogleUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/other-login/google")
public class LoginGoogleHandler extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String code = req.getParameter("code");
        System.out.println("code: " + code);
//        System.out.println(code);
        String token = GoogleUtil.getToken(code);
        GoogleAccount googleAccount = GoogleUtil.getUserInfo(token);
        User user = new User();
        user.setEmail(googleAccount.getEmail());
        user.setFullName(googleAccount.getName());
        user.setPassword(googleAccount.getId());
        if (!UserService.getInstance().isContainEmail(user.getEmail())) {
            user.setRole(0);
            user.setStatus(1);
            UserService.getInstance().GoogleAdditional(user);
        }
        user = UserService.getInstance().getUserByEmail(user.getEmail());
        req.getSession().setAttribute("auth", user);
        System.out.println("success create");
        resp.sendRedirect(req.getContextPath() + "/home");
    }
}
