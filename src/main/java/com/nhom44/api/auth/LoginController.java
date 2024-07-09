package com.nhom44.api.auth;

import com.google.gson.JsonObject;
import com.nhom44.bean.User;
import com.nhom44.services.UserService;
import com.nhom44.validator.EmailSingleValidator;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class LoginController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        JsonObject jsonObject = new JsonObject();
        String email = new EmailSingleValidator().validator(req.getParameter("email")) ? req.getParameter("email") : "";
        String password = req.getParameter("password") != null && !req.getParameter("password").isEmpty() ? req.getParameter("password") : "";
        boolean exist = UserService.getInstance().isContainEmail(email);
        if (!exist) {
            jsonObject.addProperty("error", "Tài khoản không tồn tại");
            jsonObject.addProperty("status", 400);
            resp.getWriter().print(jsonObject);
            resp.getWriter().flush();
            resp.getWriter().close();
            return;
        }
        User login = UserService.getInstance().login(email, password);
        if (login == null) {
            jsonObject.addProperty("error", "Mật khẩu không chính sác vui lòng thử lại");
            jsonObject.addProperty("status", 400);
            resp.getWriter().print(jsonObject);
            resp.getWriter().flush();
            resp.getWriter().close();
            return;
        }
        if(login.getStatus()==2){
            jsonObject.addProperty("error", "Tài khoản của bạn đã bị khóa");
            jsonObject.addProperty("status", 400);
            resp.getWriter().print(jsonObject);
            resp.getWriter().flush();
            resp.getWriter().close();
            return;
        }
        if(login.getStatus()==0){
            jsonObject.addProperty("error", "Tài khoản của bạn chưa được kích hoạt vui lòng kiểm tra email để kích hoạt tài khoản");
            jsonObject.addProperty("status", 400);
            resp.getWriter().print(jsonObject);
            resp.getWriter().flush();
            resp.getWriter().close();
            return;
        }
        req.getSession().setAttribute("user", login);
        jsonObject.addProperty("status", 200);
        jsonObject.addProperty("message", "Đăng nhập thành công chào mừng bạn trở lại");
        jsonObject.addProperty("redirect", "/home");
        resp.getWriter().print(jsonObject);
        resp.getWriter().flush();
        resp.getWriter().close();

    }
}
