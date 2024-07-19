package com.nhom44.controller.fb;

import com.nhom44.bean.FacebookAccount;
import com.nhom44.bean.User;
import com.nhom44.services.UserService;
import com.nhom44.util.FacebookUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/other-login/facebook")
public class LoginFacebookHandler extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String code = req.getParameter("code");
        System.out.println("code: " + code);
        String token = FacebookUtil.getAccessToken(code);
        FacebookAccount facebookAccount = FacebookUtil.getUserInfo(token);
        User user = new User();
        user.setEmail(facebookAccount.getEmail());
        user.setFullName(facebookAccount.getName());
        user.setPassword(facebookAccount.getId());
        if (!UserService.getInstance().isContainEmail(user.getEmail())) {
            user.setRole(0);
            user.setStatus(1);
            UserService.getInstance().FacebookAdditional(user);
        }
        user = UserService.getInstance().getUserByEmail(user.getEmail());
        req.getSession().setAttribute("account", user);
        System.out.println(req.getSession().getAttribute("account").toString());
        System.out.println("success create");
        resp.sendRedirect(req.getContextPath() + "/home");
    }


}
