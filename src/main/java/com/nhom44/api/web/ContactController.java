package com.nhom44.api.web;

import com.google.gson.Gson;
import com.nhom44.bean.Address;
import com.nhom44.bean.Contact;
import com.nhom44.bean.ResponseModel;
import com.nhom44.services.ContactService;
import com.nhom44.validator.EmailSingleValidator;
import com.nhom44.validator.SingleValidator;
import com.nhom44.validator.TitleOrNameSingleValidator;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.InvocationTargetException;
import java.util.Map;
import java.util.Set;

@WebServlet(urlPatterns = {"/api/contact/save"})
public class ContactController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String url = req.getRequestURI();
        ResponseModel responseModel;
        if (url.equals("/api/contact/save")) {
            Contact contact = Contact.builder().address(new Address()).build();
            Map<String, String[]> map = req.getParameterMap();
            responseModel = validator(map);
            if (responseModel == null) {
                responseModel = new ResponseModel();
                map.keySet().forEach(k -> {
                    switch (k) {
                        case "fullName":
                            contact.setFullName(map.get(k)[0]);
                            break;
                        case "email":
                            contact.setEmail(map.get(k)[0]);
                            break;
                        case "phone":
                            contact.setPhone(map.get(k)[0]);
                            break;
                        case "content":
                            contact.setContent(map.get(k)[0]);
                            break;
                        case "province":
                            contact.getAddress().setProvinceId(Integer.parseInt(map.get(k)[0]));
                            break;
                        case "district":
                            contact.getAddress().setDistrictId(Integer.parseInt(map.get(k)[0]));
                            break;
                        case "ward":
                            contact.getAddress().setWardId(Integer.parseInt(map.get(k)[0]));
                            break;
                    }
                });
                int status = ContactService.getInstance().add(contact);
                System.out.println(status);
                if (status == 1) {
                    responseModel.setName("success");
                    responseModel.setData("/home");
                    responseModel.setStatus("200");
                    responseModel.setMessage("Cảm ơn bạn đã liên hệ với chúng tôi");
                } else {
                    responseModel.setName("sys");
                    responseModel.setData("/home");
                    responseModel.setStatus("400");
                    responseModel.setMessage("Hệ thống đang bận vui lòng thử lại sau");
                }
            }
            resp.setStatus(200);
            PrintWriter printWriter = resp.getWriter();
            printWriter.print(new Gson().toJson(responseModel));
            printWriter.flush();
            printWriter.close();
            return;
        }
    }

    private ResponseModel validator(Map<String, String[]> map) {
        ResponseModel responseModel = new ResponseModel();
        if (map.containsKey("email") && map.containsKey("fullName")) {
            String value = map.get("email")[0];
            SingleValidator validator = new EmailSingleValidator();
            if (!validator.validator(value)) {
                responseModel.setName("email");
                responseModel.setData("email không hợp lệ vui lòng nhập lại");
                return responseModel;
            }
            value = map.get("fullName")[0];
            validator = new TitleOrNameSingleValidator();
            if (!validator.validator(value)) {
                responseModel.setName("fullName");
                responseModel.setData("Tên không hợp lệ vui lòng nhập lại");
                return responseModel;
            }
        } else {
            responseModel.setName("Please enter information");
            responseModel.setData("Vui lòng nhập đầy đủ thông tin");
            return responseModel;
        }
        return null;
    }

}
