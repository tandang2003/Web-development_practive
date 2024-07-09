package com.nhom44.api.auth;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.nhom44.bean.ResponseModel;
import com.nhom44.bean.User;
import com.nhom44.log.util.function.ForgetPasswordLog;
import com.nhom44.services.MailService;
import com.nhom44.services.UserService;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.UUID;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(
        urlPatterns = {"/api/reset-password"}
)
public class ResetPasswordController extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        resp.setStatus(200);
        PrintWriter out = resp.getWriter();
        JsonObject jsonObject = new JsonObject();
        if (email == null || email.isEmpty()) {
            ForgetPasswordLog forgetPasswordLog = new ForgetPasswordLog(req, null);
            forgetPasswordLog.failLog();
            jsonObject.addProperty("message", "Email không được để trống vui lòng điền đầy đủ thông tin");
            jsonObject.addProperty("status",400);
            out.println(jsonObject.toString());
            out.flush();
            out.close();
            return;
        }
        User user = UserService.getInstance().getUserByEmailForCustomer(email);
        if (user == null) {
            ForgetPasswordLog forgetPasswordLog = new ForgetPasswordLog(req, null);
            forgetPasswordLog.failLog();
            jsonObject.addProperty("message", "Tài khoản không tồn tại vui lòng nhập lại");
            jsonObject.addProperty("status",400);
            out.println(jsonObject.toString());
            out.flush();
            out.close();
            return;
        }

        String newPw = UUID.randomUUID().toString().substring(0, 9);
        user.setPassword(newPw);
//        UserService.getInstance().update(user.getEmail(), user.getEmail(), newPw, user.getFullName(), user.getBirthday(), user.getPhone(), user.getAddressId(), user.getGender() + "", user.getStatus() + "", user.getRole() + "");
        UserService.getInstance().updatePassword(user.getEmail(), newPw);
        ForgetPasswordLog forgetPasswordLog = new ForgetPasswordLog(req, user);
        forgetPasswordLog.successLog();
        MailService.getInstance().sendMailToResetPassword(user.getEmail(), newPw);
        jsonObject.addProperty("message", "Thay đổi mật khẩu thành công vui lòng thực hiện kiểm tra email để lấy mật khẩu mới");
        jsonObject.addProperty("redirect","/home");
        jsonObject.addProperty("status",200);
        out.println(jsonObject.toString());
        out.flush();
        out.close();
        return;
    }
}
