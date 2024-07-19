package com.nhom44.api.user;

import com.google.api.client.json.Json;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.nhom44.bean.User;
import com.nhom44.services.UserService;
import com.nhom44.util.StringUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.util.Map;

import static com.nhom44.util.GsonUtil.getGson;

@WebServlet(urlPatterns = {"/api/user", "/api/user/update"})
public class UserController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setStatus(200);
        User userSession = (User) req.getSession().getAttribute("account");
        if (userSession == null) {
            resp.setStatus(401);
            JsonObject response = new JsonObject();
            response.addProperty("status", 401);
            response.addProperty("message", "Bạn chưa đăng nhập");
            response.addProperty("redirect", "/login");
            resp.getWriter().print(response.toString());
            resp.getWriter().flush();
            resp.getWriter().close();
            return;
        }
        User user = UserService.getInstance().getUserById(userSession.getId());
        JsonObject response = new JsonObject();
        response.addProperty("status", 200);
        response.add("data",getGson().toJsonTree(user));
        resp.getWriter().print(response.toString());
        resp.getWriter().flush();
        resp.getWriter().close();


    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setStatus(200);
        User userSession = (User) req.getSession().getAttribute("account");
        User user = UserService.getInstance().getUserById(userSession.getId());
        User newUserInfo = createUser(req.getParameterMap(), null);
        JsonObject response = new JsonObject();
        if (!newUserInfo.getEmail().equals(user.getEmail())) {
            if (UserService.getInstance().isContainEmail(newUserInfo.getEmail())) {
                response.addProperty("message", "Email đã tồn tại vui lòng đổi email mới");
                response.addProperty("status", 400);
                resp.getWriter().print(response.toString());
                resp.getWriter().flush();
                resp.getWriter().close();
                return;
            }
        }
        if (!StringUtil.hashPassword(newUserInfo.getPassword()).equals(user.getPassword())) {
            if (!newUserInfo.getPassword().equals(req.getParameter("repassword"))) {
                response.addProperty("error", "Mật khẩu không trùng khớp vui lòng thực hiện lại");
                response.addProperty("status", 400);
                resp.getWriter().print(response.toString());
                resp.getWriter().flush();
                resp.getWriter().close();
                return;
            }
        }
        User updatedUser = createUser(req.getParameterMap(), user);
        updatedUser.setPassword(StringUtil.hashPassword(updatedUser.getPassword()));
        UserService.getInstance().update(updatedUser);
        response.addProperty("status", 200);
        response.addProperty("message", "Cập nhật thông tin thành công");
        resp.getWriter().print(response.toString());
        resp.getWriter().flush();
        resp.getWriter().close();
    }


    private User createUser(Map<String, String[]> map, User user) {
        map.forEach((key, value) -> {
            switch (key) {
                case "fullName":
                    user.setFullName(value[0]);
                    break;
                case "birthday":
                    user.setBirthday(Date.valueOf(value[0]));
                    break;
                case "phone":
                    user.setPhone(value[0]);
                    break;
                case "province":
                    user.getAddress().setProvinceId(Integer.parseInt(value[0]));
                    break;
                case "district":
                    user.getAddress().setDistrictId(Integer.parseInt(value[0]));
                    break;
                case "ward":
                    user.getAddress().setWardId(Integer.parseInt(value[0]));
                    break;
                case "gender":
                    user.setGender(Integer.parseInt(value[0]));
                    break;
                case "email":
                    user.setEmail(value[0]);
                    break;
                case "password":
                    user.setPassword(value[0]);
                    break;
            }
        });
        return user;
    }
}
