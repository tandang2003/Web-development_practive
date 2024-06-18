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
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Objects;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@WebServlet(urlPatterns = {"/api/admin/user", "/api/admin/user/add", "/api/admin/user/edit/*"})
public class UserController extends HttpServlet {
    private Gson gson;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String url = req.getServletPath();

        if (url.equals("/api/admin/user")) {
            UserService userService = UserService.getInstance();
            List<User> users = userService.getAllUser();

            PrintWriter printWriter = resp.getWriter();
            Gson gson = new Gson();
            String json = gson.toJson(users);
            printWriter.println(json);
            printWriter.flush();
            printWriter.close();
        } else if (url.equals("/api/admin/user/edit")) {
            String userEmail = req.getParameter("useremail");

            if (userEmail != null) {
                UserService userService = UserService.getInstance();
                User user = userService.getUserByEmail(userEmail);

                if (user != null) {
                    AddressService addressService = AddressService.getInstance();
                    Address address = addressService.getAddressById(user.getAddressId());

                    // Create a JSON object to include user and nested address details
                    JsonObject jsonResponse = new JsonObject();
                    jsonResponse.addProperty("id", user.getId());
                    jsonResponse.addProperty("fullName", user.getFullName());
                    jsonResponse.addProperty("email", user.getEmail());
                    jsonResponse.addProperty("password", user.getPassword());
                    jsonResponse.addProperty("birthday", user.getBirthday().toString());
                    jsonResponse.addProperty("phone", user.getPhone());
                    jsonResponse.addProperty("gender", user.getGender());
                    jsonResponse.addProperty("status", user.getStatus());

                    // Create nested address JSON object
                    JsonObject addressJson = new JsonObject();
                    addressJson.addProperty("id", address.getId());
                    addressJson.addProperty("provinceId", address.getProvinceId());
                    addressJson.addProperty("districtId", address.getDistrictId());
                    addressJson.addProperty("wardId", address.getWardId());

                    jsonResponse.add("address", addressJson); // Add nested address JSON object

                    jsonResponse.addProperty("role", user.getRole());

                    // Convert JSON object to string
                    Gson gson1 = new Gson();
                    String json1 = gson1.toJson(jsonResponse);

                    // Set content type and write JSON to response
                    resp.setContentType("application/json");
                    resp.setCharacterEncoding("UTF-8");
                    PrintWriter out = resp.getWriter();
                    out.print(json1);
                    out.flush();
                } else {
                    resp.setStatus(HttpServletResponse.SC_NOT_FOUND);
                }
            } else {
                resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        gson = new Gson();
        System.out.println("step 1");
        AddressService addressService = AddressService.getInstance();
        UserService userService = UserService.getInstance();
        PrintWriter printWriter = resp.getWriter();
        List<ResponseModel> errMess = new ArrayList<>();
        String action = req.getParameter("action");
        System.out.println(action);
        boolean isErr = false;
        if (action.equalsIgnoreCase("add")) {
            String email = req.getParameter("email") == null ? "" : req.getParameter("email");
            String regex = "^[\\w!#$%&amp;'*+/=?`{|}~^-]+(?:\\.[\\w!#$%&amp;'*+/=?`{|}~^-]+)*@(?:[a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,6}$";
            Pattern pattern = Pattern.compile(regex);
            Matcher matcher = pattern.matcher(email);
            System.out.println("step 1.5");
            if (!matcher.matches()) {
                req.setAttribute("email", "Email không hợp lệ");
                ResponseModel responseModel = new ResponseModel();
                responseModel.setMessage("Email không hợp lệ");
                responseModel.setData(null);
                responseModel.setName("email");
                errMess.add(responseModel);
                isErr = true;
            }
            System.out.println("step 2");
            String password = req.getParameter("password");
            if (password == null || password.length() < 6) {
                req.setAttribute("password", "Mật khẩu phải có ít nhất 6 ký tự");
                ResponseModel responseModel = new ResponseModel();
                responseModel.setMessage("Mật khẩu phải có ít nhất 6 ký tự");
                responseModel.setData(null);
                responseModel.setName("password");
                errMess.add(responseModel);

                isErr = true;
            }
            System.out.println("step 3");
            String name = req.getParameter("fullname");
            if (name == null || name.trim().isEmpty() || name.length() < 6) {
                req.setAttribute("fullname", "Tên phải có ít nhất 6 ký tự");
                ResponseModel responseModel = new ResponseModel();
                responseModel.setName("fullname");
                responseModel.setMessage("Tên phải có ít nhất 6 ký tự");
//            responseModel.setData(null);
                errMess.add(responseModel);
                isErr = true;
            }
            System.out.println("step 4");
            String ip_birthday = req.getParameter("birthday");
            Date birthday = null;
            if (ip_birthday == null || ip_birthday.trim().isEmpty()) {
                req.setAttribute("birthday", "Vui lòng chọn ngày sinh");
                ResponseModel responseModel = new ResponseModel();
                responseModel.setMessage("Vui lòng chọn ngày sinh");
                responseModel.setData(null);
                responseModel.setName("birthday");
                errMess.add(responseModel);
                isErr = true;
            } else {
                ip_birthday = DateUtil.formatStringDate(ip_birthday);
                SimpleDateFormat dmy = new SimpleDateFormat("yyyy-MM-dd");
                dmy.setLenient(false);
                try {
                    birthday = dmy.parse(ip_birthday);
                } catch (Exception e) {
                    req.setAttribute("birthday", "Ngày sinh không hợp lệ");
                    ResponseModel responseModel = new ResponseModel();
                    responseModel.setMessage("Ngày sinh không hợp lệ");
                    responseModel.setData(null);
                    responseModel.setName("birthday");
                    errMess.add(responseModel);
                    isErr = true;
                }
            }
            System.out.println("step 5");
            String phone = req.getParameter("phone");
            String regexPhone = "^(0|\\+84)(\\s|\\.)?((3[2-9])|(5[689])|(7[06-9])|(8[1-689])|(9[0-46-9]))(\\d)(\\s|\\.)?(\\d{3})(\\s|\\.)?(\\d{3})$";
            Pattern patternPhone = Pattern.compile(regexPhone);
            Matcher matcherPhone = patternPhone.matcher(phone);
            if (phone == null || phone.length() < 10) {
                req.setAttribute("phone", "Số điện thoại phải có ít nhất 10 ký tự");
                ResponseModel responseModel = new ResponseModel();
                responseModel.setMessage("Số điện thoại phải có ít nhất 10 ký tự");
                responseModel.setData(null);
                responseModel.setName("phone");
                errMess.add(responseModel);
                isErr = true;
            } else if (!matcherPhone.matches()) {
                req.setAttribute("phone", "Số điện thoại không hợp lệ");
                ResponseModel responseModel = new ResponseModel();
                responseModel.setMessage("Số điện thoại không hợp lệ");
                responseModel.setData(null);
                responseModel.setName("phone");
                errMess.add(responseModel);
                isErr = true;
            }
            System.out.println("step 6");
            Address address = new Address();
            Address addedAddress = new Address();
            String province = req.getParameter("province");
            String district = req.getParameter("district");
            String ward = req.getParameter("ward");
            System.out.println("step 6.5");
            System.out.println("province: " + province + "\n" + "district: " + district + "\n" + "ward: " + ward);
            if (province == null || province.trim().isEmpty()) {
                ResponseModel responseModel = new ResponseModel();
                responseModel.setData((Object) null);
                responseModel.setName("province");
                errMess.add(responseModel);
                isErr = true;
                System.out.println("province: " + province);
            } else if (district == null || district.trim().isEmpty()) {
                ResponseModel responseModel = new ResponseModel();
                responseModel.setData((Object) null);
                responseModel.setName("district");
                errMess.add(responseModel);
                isErr = true;
                System.out.println("district: " + district);
            } else if (ward == null || ward.trim().isEmpty()) {
                ResponseModel responseModel = new ResponseModel();
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
                ResponseModel responseModel = new ResponseModel();
                responseModel.setData(addedAddress);
                responseModel.setName("address");
                errMess.add(responseModel);
                isErr = true;

            }
            System.out.println(addedAddress.getId());
            System.out.println(isErr + "blablabla");
            System.out.println("step 6.9");
            String isMale = req.getParameter("isMale") == null ? "" : req.getParameter("isMale");
            String isFemale = req.getParameter("isFemale") == null ? "" : req.getParameter("isFemale");
            if (isMale.isEmpty() && isFemale.isEmpty()) {
                ResponseModel responseModel = new ResponseModel();
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
            String status = req.getParameter("status");
            String role = req.getParameter("role");
            System.out.println("ready");
            if (!isErr) {
                resp.setStatus(400);
                printWriter.println(gson.toJson(errMess));
                printWriter.flush();
                printWriter.close();
//            req.getRequestDispatcher("/views/admin/user/add_user.jsp").forward(req, resp);
                return;

            }

            ResponseModel responseModel = null;
            User user, addedUser;
            if (UserService.getInstance().isContainEmail(email)) {

                resp.setStatus(400);
                responseModel = new ResponseModel();
                responseModel.setName("email");
                responseModel.setMessage("Email đã tồn tại");
                errMess.add(responseModel);
                printWriter.print(gson.toJson(errMess));
                return;
            } else
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
                responseModel = new ResponseModel<>();
                responseModel.setName("success");
                responseModel.setData("/admin/user_management?action=manager");
                responseModel.setMessage("Thêm thành công");
//                responseModel.setData(user);
                resp.setStatus(200);
                printWriter.print(gson.toJson(responseModel));
            } else if (addedUser.getPassword() != null && addedUser.getId() == 0) {
                responseModel = new ResponseModel<>();
                resp.setStatus(200);
                responseModel.setName("sys");
                responseModel.setMessage("Thêm thất bại");
                responseModel.setData(user);
                printWriter.print(gson.toJson(responseModel));
            }
            printWriter.flush();
            printWriter.close();
//            req.getRequestDispatcher()
        } else if (action.equalsIgnoreCase("edit")) {
            ResponseModel responseModel = null;
            String oldEmail = req.getParameter("oldEmail");
            User user = userService.getUserByEmail(oldEmail);

            SingleValidator singleValidator = new EmailSingleValidator();
            String fullName = req.getParameter("fullname") == null ? "" : req.getParameter("fullname");
            String email = req.getParameter("email") == null ? "" : req.getParameter("email");
            String password = req.getParameter("password") == null ? "" : req.getParameter("password");
            String phone = req.getParameter("phone") == null ? "" : req.getParameter("phone");
            String province = req.getParameter("province") == null ? "" : req.getParameter("province");
            String district = req.getParameter("district") == null ? "" : req.getParameter("district");
            String ward = req.getParameter("ward") == null ? "" : req.getParameter("ward");
            System.out.println("province" + province);
            String birthday = req.getParameter("birthday") == null ? "" : req.getParameter("birthday");
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
                    responseModel = new ResponseModel();
                    responseModel.setName("fullName");
                    responseModel.setMessage("Tên không hợp lệ");
                    errMess.add(responseModel);
                } else user.setFullName(fullName);
            if (!password.isEmpty())

                if (!singleValidator.validator(password)) {
                    responseModel = new ResponseModel();
                    responseModel.setName("password");
                    responseModel.setMessage("Mật khẩu mới không hợp lệ");
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
//            System.out.println("user prov "+user.getProvince());
            System.out.println(!province.equals(user.getAddressId() + ""));
            if (!province.equals(user.getAddressId() + ""))
                if (province.isEmpty() || !singleValidator.validator(province)) {
                    responseModel = new ResponseModel();
                    responseModel.setName("address");
                    responseModel.setMessage("Địa chỉ không hợp lệ");
                    errMess.add(responseModel);
                } else {
                    System.out.println("set");
//                    user.setProvinceId(Integer.parseInt(province));
                }
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
            if (errMess.size() > 0) {
                resp.setStatus(400);
                printWriter.print(gson.toJson(errMess));
                System.out.println(gson.toJson(errMess));

            } else {
                user = UserService.getInstance().update(user);

                if (user != null) {
                    System.out.println(user.toString());
                    resp.setStatus(200);
                    responseModel = new ResponseModel<>();
                    responseModel.setName("success");
                    responseModel.setData("/admin/user_management?action=manager");
                    responseModel.setMessage("Lưu thành công");
                    resp.setStatus(200);
                    printWriter.print(gson.toJson(responseModel));

                } else {
                    resp.setStatus(200);
                    responseModel.setName("sys");
                    responseModel.setMessage("Thêm thất bại");
                    printWriter.print(gson.toJson(responseModel));

                }
            }
        }
        printWriter.flush();
        printWriter.close();
    }

}

