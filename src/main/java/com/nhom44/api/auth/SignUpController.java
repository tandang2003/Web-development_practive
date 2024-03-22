package com.nhom44.api.auth;

import com.google.gson.Gson;
import com.nhom44.bean.ResponseModel;
import com.nhom44.bean.User;
import com.nhom44.services.MailService;
import com.nhom44.services.UserService;
import com.nhom44.services.VerifyService;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Objects;
import java.util.UUID;
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
        System.out.println(req.getParameterMap().keySet().toString());
        System.out.println(req.getParameter("email"));
        System.out.println(req.getParameter("birthday"));
        Gson gson = new Gson();
        System.out.println("step 1");
        UserService userService = UserService.getInstance();
        PrintWriter printWriter = resp.getWriter();
        List<ResponseModel> errMess = new ArrayList();
        String action = req.getParameter("action");
        boolean isErr = false;
        String email = req.getParameter("email") == null ? "" : req.getParameter("email");
        System.out.println("step 1.5");
        if (!email.contains("@") || !email.contains(".")) {
            ResponseModel responseModel = new ResponseModel();
            responseModel.setMessage("Email không hợp lệ");
            responseModel.setData((Object) null);
            responseModel.setName("email");
            errMess.add(responseModel);
            isErr = true;
        }

        System.out.println("step 2");
        String password = req.getParameter("password");
        String verifypassword = req.getParameter("verifypassword");
        ResponseModel responseModel;
        if (!Objects.equals(password, verifypassword)) {
            req.setAttribute("password", "Mật khẩu không trùng khớp");
            responseModel = new ResponseModel();
            responseModel.setMessage("Mật khẩu không trùng khớp");
            responseModel.setData((Object) null);
            responseModel.setName("password");
            errMess.add(responseModel);
            isErr = true;
        }

        if (password.length() < 6) {
            req.setAttribute("password", "Mật khẩu phải có ít nhất 6 ký tự");
            responseModel = new ResponseModel();
            responseModel.setMessage("Mật khẩu phải có ít nhất 6 ký tự");
            responseModel.setData((Object) null);
            responseModel.setName("password");
            errMess.add(responseModel);
            isErr = true;
        }

        System.out.println("step 3");
        String name = req.getParameter("fullname");
        if (name == null || name.trim().isEmpty() || name.length() < 6) {
            req.setAttribute("fullname", "Tên phải có ít nhất 6 ký tự");
             responseModel = new ResponseModel();
            responseModel.setName("fullname");
            responseModel.setMessage("Tên phải có ít nhất 6 ký tự");
            errMess.add(responseModel);
            isErr = true;
        }

        System.out.println("step 4");
        String ip_birthday = req.getParameter("birthday");
        Date birthday = null;
        if (ip_birthday != null && !ip_birthday.trim().isEmpty()) {
            System.out.println(ip_birthday);
            SimpleDateFormat dmy = new SimpleDateFormat("yyyy-MM-dd");
            dmy.setLenient(false);

            try {
                birthday = dmy.parse(ip_birthday);
            } catch (Exception var28) {
                 responseModel = new ResponseModel();
                responseModel.setMessage("Ngày sinh không hợp lệ");
                responseModel.setData((Object) null);
                responseModel.setName("birthday");
                errMess.add(responseModel);
                isErr = true;
            }
        } else {
            req.setAttribute("birthday", "Vui lòng chọn ngày sinh");
             responseModel = new ResponseModel();
            responseModel.setMessage("Vui lòng chọn ngày sinh");
            responseModel.setData((Object) null);
            responseModel.setName("birthday");
            errMess.add(responseModel);
            isErr = true;
        }

        System.out.println("step 5");
        String phone = req.getParameter("phone");
        String regexPhone = "^(0|\\+84)(\\s|\\.)?((3[2-9])|(5[689])|(7[06-9])|(8[1-689])|(9[0-46-9]))(\\d)(\\s|\\.)?(\\d{3})(\\s|\\.)?(\\d{3})$";
        Pattern patternPhone = Pattern.compile(regexPhone);
        Matcher matcherPhone = patternPhone.matcher(phone);

        if (phone.length() < 10) {
            req.setAttribute("phone", "Số điện thoại phải có ít nhất 10 ký tự");
            responseModel = new ResponseModel();
            responseModel.setMessage("Số điện thoại phải có ít nhất 10 ký tự");
            responseModel.setData((Object) null);
            responseModel.setName("phone");
            errMess.add(responseModel);
            isErr = true;
        } else if (!matcherPhone.matches()) {
            req.setAttribute("phone", "Số điện thoại không hợp lệ");
            responseModel = new ResponseModel();
            responseModel.setMessage("Số điện thoại không hợp lệ");
            responseModel.setData((Object) null);
            responseModel.setName("phone");
            errMess.add(responseModel);
            isErr = true;
        }

        System.out.println("step 6");
        String province = req.getParameter("province");
        if (province == null || province.trim().isEmpty()) {
            req.setAttribute("province", "Vui lòng chọn tỉnh thành");
             responseModel = new ResponseModel();
            responseModel.setMessage("Vui lòng chọn tỉnh thành");
            responseModel.setData((Object) null);
            responseModel.setName("province");
            errMess.add(responseModel);
            isErr = true;
        }

        System.out.println(province);
        String isMale = req.getParameter("isMale");
        String isFemale = req.getParameter("isFemale");
        if (isMale.isEmpty() && isFemale.isEmpty()) {
            req.setAttribute("gender", "Vui lòng chọn giới tính");
             responseModel = new ResponseModel();
            responseModel.setMessage("Vui lòng chọn giới tính");
            responseModel.setData((Object) null);
            responseModel.setName("gender");
            errMess.add(responseModel);
            isErr = true;
        } else {
            isMale = isMale.equals("true") ? "1" : "0";
        }

        System.out.println("step 7");
        String status = "0";
        String role = "0";
        System.out.println("ready");
        if (isErr) {
            resp.setStatus(400);
            printWriter.println(gson.toJson(errMess));
            printWriter.flush();
            printWriter.close();
        } else {
            System.out.println((new java.sql.Date(birthday.getTime())).toLocalDate().toString());

            User user = null;
            if (UserService.getInstance().isContainEmail(email)) {
                resp.setStatus(400);
                responseModel = new ResponseModel();
                responseModel.setName("email");
                responseModel.setMessage("Email đã tồn tại");
                errMess.add(responseModel);
                printWriter.print(gson.toJson(errMess));
            } else {
                user = userService.additional(email, password, name, new java.sql.Date(birthday.getTime()), phone, province, isMale, status, role);
                if (user.getPassword() == null) {
                    int userId = userService.getIdUserWithEmail(user.getEmail());
                    String token = UUID.randomUUID().toString();
                    VerifyService.getInstance().insert(token, userId);
                    MailService.getInstance().sendMailToVerify(null,user.getEmail(), token);
                    responseModel = new ResponseModel();
                    responseModel.setName("success");
                    responseModel.setMessage("Xin vui lòng truy cập email để xác thực tài khoản của bạn");
                    responseModel.setData(user);
                    resp.setStatus(200);
                    printWriter.print(gson.toJson(responseModel));
                } else if (user.getPassword() != null) {
                    responseModel = new ResponseModel();
                    resp.setStatus(200);
                    responseModel.setName("sys");
                    responseModel.setMessage("Thêm thất bại");
                    responseModel.setData(user);
                    printWriter.print(gson.toJson(responseModel));
                }
                printWriter.flush();
                printWriter.close();
            }
        }
    }
}
