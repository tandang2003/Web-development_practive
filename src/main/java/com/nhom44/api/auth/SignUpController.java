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

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
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
        Gson gson = new Gson();
        UserService userService = UserService.getInstance();
        AddressService addressService = AddressService.getInstance();
        PrintWriter printWriter = resp.getWriter();
        List<ResponseModel> errMess = new ArrayList();
        String action = req.getParameter("action");
        boolean isErr = false;
        String email = req.getParameter("email") == null ? "" : req.getParameter("email");
        System.out.println("step 1.5");
        if (!email.contains("@") || !email.contains(".")) {
            ResponseModel responseModel = new ResponseModel();
            responseModel.setData((Object) null);
            responseModel.setName("email");
            errMess.add(responseModel);
            isErr = true;
        }
        System.out.println(email);

        System.out.println("step 2");
        String password = req.getParameter("password");
        String verifypassword = req.getParameter("verifypassword");
        ResponseModel responseModel;
        if (!Objects.equals(password, verifypassword)) {
            responseModel = new ResponseModel();
            responseModel.setData((Object) null);
            responseModel.setName("password");
            errMess.add(responseModel);
            isErr = true;
        }

        if (password.length() < 6) {
            responseModel = new ResponseModel();
            responseModel.setData((Object) null);
            responseModel.setName("password");
            errMess.add(responseModel);
            isErr = true;
        }
        System.out.println(password);
        System.out.println(verifypassword);

        System.out.println("step 3");
        String name = req.getParameter("fullname");
        if (name == null || name.trim().isEmpty() || name.length() < 6) {
            responseModel = new ResponseModel();
            responseModel.setName("fullname");
            errMess.add(responseModel);
            isErr = true;
        }
        System.out.println(name);

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
                responseModel.setData((Object) null);
                responseModel.setName("birthday");
                errMess.add(responseModel);
                isErr = true;
            }
        } else {
            responseModel = new ResponseModel();
            responseModel.setData((Object) null);
            responseModel.setName("birthday");
            errMess.add(responseModel);
            isErr = true;
        }
        System.out.println(birthday);

        System.out.println("step 5");
        String phone = req.getParameter("phone");
        String regexPhone = "^(0|\\+84)(\\s|\\.)?((3[2-9])|(5[689])|(7[06-9])|(8[1-689])|(9[0-46-9]))(\\d)(\\s|\\.)?(\\d{3})(\\s|\\.)?(\\d{3})$";
        Pattern patternPhone = Pattern.compile(regexPhone);
        Matcher matcherPhone = patternPhone.matcher(phone);
        System.out.println(phone);
        if (!phone.isEmpty() && phone.length() < 10) {
            responseModel = new ResponseModel();
            responseModel.setData((Object) null);
            responseModel.setName("phone");
            errMess.add(responseModel);
            isErr = true;
        } else if (!matcherPhone.matches()) {
            responseModel = new ResponseModel();
            responseModel.setData((Object) null);
            responseModel.setName("phone");
            errMess.add(responseModel);
            isErr = true;
        } else {
            System.out.println("phone: " + phone);
            responseModel = new ResponseModel();
            responseModel.setData((Object) null);
            responseModel.setName("phone");
            errMess.add(responseModel);
            isErr = true;
        }
        System.out.println(phone);

        System.out.println("step 6");
        Address address = new Address();
        Address addedAddress = new Address();
        String province = req.getParameter("province");
        String district = req.getParameter("district");
        String ward = req.getParameter("ward");
        System.out.println("step 6.5");
        System.out.println("province: " + province + "\n" + "district: " + district + "\n" + "ward: " + ward);
        if (province == null || province.trim().isEmpty()) {
            responseModel = new ResponseModel();
            responseModel.setData((Object) null);
            responseModel.setName("province");
            errMess.add(responseModel);
            isErr = true;
            System.out.println("province: " + province);
        } else if (district == null || district.trim().isEmpty()) {
            responseModel = new ResponseModel();
            responseModel.setData((Object) null);
            responseModel.setName("district");
            errMess.add(responseModel);
            isErr = true;
            System.out.println("district: " + district);
        } else if (ward == null || ward.trim().isEmpty()) {
            responseModel = new ResponseModel();
            responseModel.setData((Object) null);
            responseModel.setName("ward");
            errMess.add(responseModel);
            isErr = true;
            System.out.println("ward: " + ward);
        } else {
            System.out.println("address: " + address.toString());
            address.setProvinceId(Integer.parseInt(province));
            address.setDistrictId(Integer.parseInt(district));
            address.setWardId(Integer.parseInt(ward));
            System.out.println("ward: " + address.getWardId());
            addedAddress = addressService.addAddress(address);
            System.out.println("address: " + addedAddress.toString());
            responseModel = new ResponseModel();
            responseModel.setData(addedAddress);
            responseModel.setName("address");
            errMess.add(responseModel);
            isErr = true;

        }
        System.out.println(addedAddress.getId());
        System.out.println(isErr + "blablabla");
        System.out.println("step 6.9");
        String isMale = req.getParameter("isMale");
        String isFemale = req.getParameter("isFemale");
        System.out.println(isMale);
        System.out.println(isFemale);
        if (isMale.isEmpty() && isFemale.isEmpty()) {
            responseModel = new ResponseModel();
            responseModel.setData((Object) null);
            responseModel.setName("gender");
            errMess.add(responseModel);
            System.out.println(isFemale);
            isErr = true;
        } else {
            isMale = isMale.equals("true") ? "1" : "0";
            System.out.println(isMale);
        }
        System.out.println("step 7");
        String status = "0";
        String role = "0";
        System.out.println("ready");
        System.out.println("isErr " + isErr);
        if (!isErr) {
            resp.setStatus(400);
            printWriter.println(gson.toJson(errMess));
            printWriter.flush();
            printWriter.close();
            System.out.println("step 7.5");
            System.out.println("isErr " + isErr);
        } else {

            System.out.println("--------------------------");
            if (UserService.getInstance().isContainEmail(email)) {
                resp.setStatus(400);
                responseModel = new ResponseModel();
                responseModel.setName("email");
                responseModel.setMessage("Email đã tồn tại");
                errMess.add(responseModel);
                printWriter.print(gson.toJson(errMess));
                System.out.println("step 7.6");
            } else {
                User user, addedUser;
                user = new User();
                user.setEmail(email);
                System.out.println(user.getEmail());
                user.setPassword(password);
                System.out.println(user.getPassword());
                user.setFullName(name);
                System.out.println(user.getFullName());
                user.setBirthday(new java.sql.Date(birthday.getTime()));
                System.out.println(user.getBirthday());
                user.setPhone(phone);
                System.out.println(user.getPhone());
                user.setGender(Integer.parseInt(isMale));
                System.out.println(user.getGender());
                user.setStatus(Integer.parseInt(status));
                user.setRole(Integer.parseInt(role));
                user.setAddressId(addedAddress.getId());
                System.out.println(addedAddress.getId());
                System.out.println(user.getAddressId());
                addedUser = userService.addUser(user);
                System.out.println("step 8");
                System.out.println(addedUser.toString());
                if (addedUser.getPassword() == null && addedUser.getId() != 0) {
                    System.out.println("bla bla bla");
                    int userId = userService.getIdUserWithEmail(addedUser.getEmail());
                    String token = UUID.randomUUID().toString();
                    VerifyService.getInstance().insert(token, userId);
                    MailService.getInstance().sendMailToVerify(null, addedUser.getEmail(), token);
                    responseModel = new ResponseModel();
                    responseModel.setName("success");
                    responseModel.setMessage("Xin vui lòng truy cập email để xác thực tài khoản của bạn");
                    resp.setStatus(200);
                    printWriter.print(gson.toJson(responseModel));
                    System.out.println("step 9");
                } else if (addedUser.getPassword() != null && addedUser.getId() == 0) {
                    responseModel = new ResponseModel();
                    resp.setStatus(200);
                    responseModel.setName("sys");
                    responseModel.setMessage("Thêm thất bại");
                    responseModel.setData(addedUser);
                    printWriter.print(gson.toJson(responseModel));
                    System.out.println("step 10");
                }
                printWriter.flush();
                printWriter.close();
            }
        }
    }
}
