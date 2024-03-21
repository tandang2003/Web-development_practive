package com.nhom44.api.user;

import com.google.gson.Gson;
import com.nhom44.bean.ResponseModel;
import com.nhom44.bean.User;
import com.nhom44.services.UserService;
import com.nhom44.util.DateUtil;
import com.nhom44.util.StringUtil;
import com.nhom44.validator.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@WebServlet(urlPatterns = {"/api/user", "/api/user/update"})
public class UserController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println(req.getParameterMap().keySet().toString());
        User user = (User) req.getSession().getAttribute("auth");
        System.out.println("auth" + user.toString());
        HttpSession session = req.getSession();
        List<ResponseModel> errMess = new ArrayList<>();
        ResponseModel responseModel = null;
        Gson gson = new Gson();
        PrintWriter writer = resp.getWriter();
        SingleValidator singleValidator = new EmailSingleValidator();
        String fullName = req.getParameter("fullName") == null ? "" : req.getParameter("fullName");
        String email = req.getParameter("email") == null ? "" : req.getParameter("email");
        String password = req.getParameter("password") == null ? "" : req.getParameter("password");
        String phone = req.getParameter("phone") == null ? "" : req.getParameter("phone");
        String province = req.getParameter("provinceId") == null ? "" : req.getParameter("provinceId");
        String birthday = req.getParameter("birthday") == null ? "" : req.getParameter("birthday");
        String rePassword = req.getParameter("rePassword") == null ? "" : req.getParameter("rePassword");
        System.out.println(email);
        System.out.println(user.getEmail());
        if (!email.equals(user.getEmail()))
            if (UserService.getInstance().isContainEmail(email)) {
                responseModel = new ResponseModel();
                responseModel.setName("email");
                responseModel.setMessage("Email đã tồn tại");
                errMess.add(responseModel);
            } else if (email.isEmpty() || !singleValidator.validator(email)) {
                responseModel = new ResponseModel();
                responseModel.setName("email");
                responseModel.setMessage("Email không hợp lệ");
                errMess.add(responseModel);
            } else user.setEmail(email);
        singleValidator = new TitleOrNameSingleValidator();
        if (!Objects.equals(fullName, user.getFullName()))
            if (fullName.isEmpty() || !singleValidator.validator(fullName)) {
                System.out.println("fullname" + fullName);
                responseModel = new ResponseModel();
                responseModel.setName("fullName");
                responseModel.setMessage("Tên không hợp lệ");
                errMess.add(responseModel);
            } else user.setFullName(fullName);
        if (!password.equals(""))

            if (!singleValidator.validator(password)) {
                responseModel = new ResponseModel();
                responseModel.setName("password");
                responseModel.setMessage("Mật khẩu mới không hợp lệ");
                errMess.add(responseModel);
            } else if (!singleValidator.validator(rePassword)) {
                responseModel = new ResponseModel();
                responseModel.setName("rePassword");
                responseModel.setMessage("Mật khẩu nhập xác nhận không hợp lệ");
                errMess.add(responseModel);
            } else if (!Objects.equals(password, rePassword)) {
                responseModel = new ResponseModel();
                System.out.println("password" + password);
                System.out.println("repassword" + rePassword);
                responseModel.setName("rePassword");
                responseModel.setMessage("Mật khẩu nhập xác nhận không trùng khớp");
                errMess.add(responseModel);
            } else user.setPassword(StringUtil.hashPassword(password));
        singleValidator = new PhoneValidator();
        if (!phone.equals(user.getPhone()))
            if (phone.equals("") || !singleValidator.validator(phone)) {
                responseModel = new ResponseModel();
                responseModel.setName("phone");
                responseModel.setMessage("Số điện thoại không hợp lệ");
                errMess.add(responseModel);
            } else user.setPhone(phone);
        singleValidator = new NumberVallidator();
        if (!province.equals(user.getProvinceId() + ""))
            if (province.equals("") || !singleValidator.validator(province)) {
                responseModel = new ResponseModel();
                responseModel.setName("address");
                responseModel.setMessage("Địa chỉ không hợp lệ");
                errMess.add(responseModel);
            } else user.setProvinceId(Integer.parseInt(province));
        singleValidator = new DateValidator();
        java.util.Date dbirthday = null;

        if (!birthday.equals(user.getBirthday().toString()))
            if (birthday == null || birthday.trim().isEmpty()) {
                req.setAttribute("birthday", "Ngày sinh không hợp lệ");
                responseModel = new ResponseModel();
                responseModel.setMessage("Vui lòng chọn ngày sinh");
                responseModel.setData(null);
                responseModel.setName("birthday");
                errMess.add(responseModel);
            } else {
                birthday = DateUtil.formatStringDate(birthday);
                SimpleDateFormat dmy = new SimpleDateFormat("yyyy-MM-dd");
                dmy.setLenient(false);
                try {
                    dbirthday = dmy.parse(birthday);
                    user.setBirthday(new java.sql.Date(dbirthday.getTime()));
                } catch (Exception e) {
                    req.setAttribute("birthday", "Ngày sinh không hợp lệ");
                    responseModel = new ResponseModel();
                    responseModel.setMessage("Ngày sinh không hợp lệ");
                    responseModel.setData(null);
                    responseModel.setName("birthday");
                    errMess.add(responseModel);
                }
            }
        System.out.println(user.toString());
        System.out.println(errMess.toString());
        if (!errMess.isEmpty()) {
            resp.setStatus(400);
            System.out.println(errMess.toString());
            writer.println(gson.toJson(errMess));
            writer.flush();
            writer.close();
            return;
        }
        UserService.getInstance().update(user);
        resp.setStatus(200);
        session.setAttribute("auth", user);
        responseModel = new ResponseModel();
        responseModel.setName("success");
        responseModel.setData("/user");
        writer.println(gson.toJson(responseModel));
        writer.flush();
        writer.close();
        System.out.println(user.toString());
    }
}
