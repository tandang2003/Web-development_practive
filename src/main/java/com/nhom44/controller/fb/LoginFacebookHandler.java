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

        if (code != null) {
            try {
                String accessToken = FacebookUtil.getAccessToken(code);
                System.out.println("Access Token: " + accessToken);
                FacebookAccount userInfo = FacebookUtil.getUserInfo(accessToken);
                System.out.println("User Info: " + userInfo);

                User user = new User();
                user.setEmail(userInfo.getEmail());
                user.setFullName(userInfo.getName());
                user.setPassword(userInfo.getId());
                if (!UserService.getInstance().isContainEmail(user.getEmail())) {
                    user.setRole(0);
                    user.setStatus(1);
                    user.setCreatedAt(new java.sql.Timestamp(System.currentTimeMillis()));
                    user.setUpdatedAt(new java.sql.Timestamp(System.currentTimeMillis()));
                    UserService.getInstance().FacebookAdditional(user);
                }
                user = UserService.getInstance().getUserByEmail(user.getEmail());
                req.getSession().setAttribute("auth", user);
                System.out.println("success create");
                System.out.println("User: " + user);
                resp.sendRedirect(req.getContextPath() + "/home");
            } catch (Exception e) {
                e.printStackTrace();
                resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to login with Facebook.");
            }
        } else {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "No code received from Facebook.");
        }
    }


}
