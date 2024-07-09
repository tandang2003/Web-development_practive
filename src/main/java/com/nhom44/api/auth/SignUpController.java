package com.nhom44.api.auth;

import com.google.gson.Gson;
import com.mysql.cj.protocol.FullReadInputStream;
import com.nhom44.bean.Address;
import com.nhom44.bean.ResponseModel;
import com.nhom44.bean.User;
import com.nhom44.services.AddressService;
import com.nhom44.services.MailService;
import com.nhom44.services.UserService;
import com.nhom44.services.VerifyService;
import com.nhom44.validator.EmailSingleValidator;
import com.nhom44.validator.SingleValidator;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(
        urlPatterns = {"/api/register"}
)
public class SignUpController extends HttpServlet {
    public SignUpController() {
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Gson gson = new Gson();
        UserService userService = UserService.getInstance();
        AddressService addressService = AddressService.getInstance();
        PrintWriter printWriter = resp.getWriter();
        ResponseModel responseModel;
        Map<String, String[]> map = req.getParameterMap();
        responseModel = validate(map);
        if (responseModel != null) {
            User user = createUserObject(map);
            User addedUser = userService.addUser(user);
            if (addedUser.getPassword() == null && addedUser.getId() != 0) {
                int userId = userService.getIdUserWithEmail(addedUser.getEmail());
                String token = UUID.randomUUID().toString();
                VerifyService.getInstance().insert(token, userId);
                MailService.getInstance().sendMailToVerify(null, addedUser.getEmail(), token);
                responseModel = new ResponseModel();
                responseModel.setName("success");
                responseModel.setMessage("Xin vui lòng truy cập email để xác thực tài khoản của bạn");
                responseModel.setData("/home");
            } else if (addedUser.getPassword() != null && addedUser.getId() == 0) {
                responseModel = new ResponseModel();
                responseModel.setName("error");
                responseModel.setMessage("Hệ thống hiện tại hiện tại đang bận vui lòng thử lại sau");
                responseModel.setData(addedUser);
            }
            resp.setStatus(200);
            printWriter.print(gson.toJson(responseModel));
            printWriter.flush();
            printWriter.close();
        }

    }

    private User createUserObject(Map<String, String[]> map) {
        User user = new User();
        user.setStatus(0);
        map.keySet().forEach((key) -> {
            switch (key) {
                case "email":
                    user.setEmail(map.get(key)[0]);
                    break;
                case "name":
                    user.setFullName(map.get(key)[0]);
                    break;
                case "password":
                    user.setPassword(map.get(key)[0]);
                    break;
                case "phone":
                    user.setPhone(map.get(key)[0]);
                    break;
                case "birthday":
                    user.setBirthday(java.sql.Date.valueOf(LocalDate.parse(map.get(key)[0])));
                    break;
                case "gender":
                    user.setGender(Integer.parseInt(map.get(key)[0]));
                    break;
                case "province":
                    user.getAddress().setProvinceId(Integer.parseInt(map.get(key)[0]));
                    break;
                case "district":
                    user.getAddress().setDistrictId(Integer.parseInt(map.get(key)[0]));
                    break;
                case "ward":
                    user.getAddress().setWardId(Integer.parseInt(map.get(key)[0]));
                    break;
            }
        });
        return null;
    }

    private ResponseModel validate(Map<String, String[]> map) {
        ResponseModel responseModel = new ResponseModel();
        responseModel.setStatus("400");
        SingleValidator validator = new EmailSingleValidator();
        if (map.containsKey("email") && map.containsKey("password") && map.containsKey("rePassword")) {
            if (!validator.validator(map.get("email")[0])) {
                responseModel.setName("email");
                responseModel.setMessage("Email không hợp lệ");
                return responseModel;
            }
            if (UserService.getInstance().isContainEmail(map.get("email")[0])) {
                responseModel.setName("email");
                responseModel.setMessage("Email đã tồn tại");
                return responseModel;
            }
            if (map.get("password")[0].length() < 6) {
                responseModel.setName("password");

                responseModel.setMessage("Mật khẩu phải có ít nhất 6 ký tự");
                return responseModel;
            }
            //checking passoword and rePassword
            if (!map.get("password")[0].equals(map.get("rePassword")[0])) {
                responseModel.setName("password");
                responseModel.setMessage("Mật khẩu không khớp");
                return responseModel;
            }
        }
        return null;
    }
}
