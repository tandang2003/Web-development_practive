package com.nhom44.api.admin;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.nhom44.bean.Address;
import com.nhom44.bean.ResponseModel;
import com.nhom44.services.AddressService;
import com.nhom44.services.UserService;
import com.nhom44.bean.User;
import com.nhom44.util.DateUtil;
import com.nhom44.util.StringUtil;
import com.nhom44.validator.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import static com.nhom44.util.GsonUtil.getGson;

@WebServlet(urlPatterns = {"/api/admin/users", "/api/admin/user/add", "/api/admin/user/edit/*"})
public class UserController extends HttpServlet {
    private Gson gson;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        gson = getGson();
        String url = req.getServletPath();

        if (url.equals("/api/admin/users")) {
            UserService userService = UserService.getInstance();
            List<User> users = userService.getAllUser();

            PrintWriter printWriter = resp.getWriter();
            Gson gson = getGson();
            String json = gson.toJson(users);
            printWriter.println(json);
            printWriter.flush();
            printWriter.close();
        } else if (url.equals("/api/admin/user/edit")) {
            String id = req.getPathInfo().substring(1);
            if (id == null) {
                resp.setStatus(200);
                JsonObject jsonObject = new JsonObject();
                jsonObject.addProperty("status", 404);
                jsonObject.addProperty("messages", "Không tìm thấy người tài khoản người dùng");
                jsonObject.addProperty("data", "/admin/user_management");
                return;
            }
            User user = UserService.getInstance().getUserById(Integer.parseInt(id));
            if (user == null) {
                resp.setStatus(200);
                JsonObject jsonObject = new JsonObject();
                jsonObject.addProperty("status", 404);
                jsonObject.addProperty("messages", "Không tìm thấy người tài khoản người dùng");
                jsonObject.addProperty("data", "/admin/user_management");
                resp.getWriter().println(jsonObject);
                resp.getWriter().flush();
                return;
            }
            resp.setStatus(200);
            JsonObject jsonObject = new JsonObject();
            jsonObject.addProperty("status", 200);
            jsonObject.add("data", gson.toJsonTree(user));
            resp.getWriter().println(jsonObject);
            resp.getWriter().flush();
            return;
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Map<String, String[]> map = req.getParameterMap();
        String url = req.getServletPath();
        if (url.equals("/api/admin/user/add")) {
            if (!addValidate(req, resp))
                return;
            User user = createUser(map, null);
            UserService.getInstance().addUser(user);
            resp.setStatus(200);
            JsonObject jsonObject = new JsonObject();
            jsonObject.addProperty("status", 200);
            jsonObject.addProperty("messages", "Tài khoản người dùng được tạo thành công");
            jsonObject.addProperty("data", "/admin/user_management");
            resp.getWriter().println(jsonObject);
            resp.getWriter().flush();
            return;
        }
        if (url.equals("/api/admin/user/edit")) {
            if (!updateValidate(req, resp))
                return;
            String id = req.getParameter("id");
            System.out.println(id);
            resp.setStatus(200);
//
            if (id == null) {
                JsonObject jsonObject = new JsonObject();
                jsonObject.addProperty("status", 404);
                jsonObject.addProperty("messages", "Không tìm thấy người tài khoản người dùng vui lòng thử lại sau 5p");
                return;
            }
            User user = UserService.getInstance().getUserById(Integer.parseInt(id));
            User newUserInfo = createUser(map, null);
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
            User updatedUser = createUser(req.getParameterMap(), user);
            UserService.getInstance().update(updatedUser);
            response.addProperty("status", 200);
            response.addProperty("message", "Cập nhật thông tin thành công");
            resp.getWriter().print(response.toString());
            resp.getWriter().flush();
            resp.getWriter().close();
        }

    }

    private boolean addValidate(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String email = req.getParameter("email") == null ? "" : req.getParameter("email");
        JsonObject jsonObject = new JsonObject();
        if (email.equals("")) {
            jsonObject.addProperty("email", "Vui lòng nhập email");
            jsonObject.addProperty("status", 400);
            resp.setStatus(200);
            resp.getWriter().println(jsonObject);
            resp.getWriter().flush();
            return false;
        }
        if (!email.matches("^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,6}$")) {
            jsonObject.addProperty("email", "Email không hợp lệ");
            jsonObject.addProperty("status", 400);
            resp.setStatus(200);
            resp.getWriter().println(jsonObject);
            resp.getWriter().flush();
            return false;
        }
        if (UserService.getInstance().isContainEmail(email)) {
            jsonObject.addProperty("email", "Email đã tồn tại vui lòng sử dụng email khác");
            jsonObject.addProperty("status", 400);
            resp.setStatus(200);
            resp.getWriter().println(jsonObject);
            resp.getWriter().flush();
            return false;
        }
        String password = req.getParameter("password") == null ? "" : req.getParameter("password");
        if (password.equals("")) {
            jsonObject.addProperty("password", "Vui lòng nhập mật khẩu");
            jsonObject.addProperty("status", 400);
            resp.setStatus(200);
            resp.getWriter().println(jsonObject);
            resp.getWriter().flush();
            return false;
        }
        return true;
    }
    private boolean updateValidate(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String email = req.getParameter("email") == null ? "" : req.getParameter("email");
        JsonObject jsonObject = new JsonObject();
        if (email.equals("")) {
            jsonObject.addProperty("email", "Vui lòng nhập email");
            jsonObject.addProperty("status", 400);
            resp.setStatus(200);
            resp.getWriter().println(jsonObject);
            resp.getWriter().flush();
            return false;
        }
        if (!email.matches("^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,6}$")) {
            jsonObject.addProperty("email", "Email không hợp lệ");
            jsonObject.addProperty("status", 400);
            resp.setStatus(200);
            resp.getWriter().println(jsonObject);
            resp.getWriter().flush();
            return false;
        }

        return true;
    }

    private User createUser(Map<String, String[]> map, User user) {
        if (user == null) user = new User();
        User finalUser = user;
        map.keySet().forEach((key) -> {
            switch (key) {
                case "email":
                    finalUser.setEmail(map.get(key)[0]);
                    break;
                case "password":
                    if (map.get(key)[0].equals(""))
                        finalUser.setPassword(StringUtil.hashPassword(map.get(key)[0]));
                    break;
                case "fullName":
                    finalUser.setFullName(map.get(key)[0]);
                    break;
                case "birthday":
                    finalUser.setBirthday(java.sql.Date.valueOf(map.get(key)[0]));
                    break;
                case "phone":
                    finalUser.setPhone(map.get(key)[0]);
                    break;
                case "province":
                    finalUser.getAddress().setProvinceId(Integer.parseInt(map.get(key)[0]));
                    break;
                case "district":
                    finalUser.getAddress().setDistrictId(Integer.parseInt(map.get(key)[0]));
                    break;
                case "ward":
                    finalUser.getAddress().setWardId(Integer.parseInt(map.get(key)[0]));
                    break;
                case "gender":
                    finalUser.setGender(Integer.parseInt(map.get(key)[0]));
                    break;
                case "status":
                    finalUser.setStatus(Integer.parseInt(map.get(key)[0]));
                    break;
                case "role":
                    finalUser.setRole(Integer.parseInt(map.get(key)[0]));
                    break;
            }
        });
        return finalUser;
    }
}

