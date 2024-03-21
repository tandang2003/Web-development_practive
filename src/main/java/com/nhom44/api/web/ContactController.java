package com.nhom44.api.web;

import com.google.gson.Gson;
import com.nhom44.bean.Contact;
import com.nhom44.bean.ResponseModel;
import com.nhom44.services.ContactService;
import com.nhom44.validator.EmailSingleValidator;
import com.nhom44.validator.SingleValidator;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.InvocationTargetException;

@WebServlet(urlPatterns = {"/api/contact/save"})
public class ContactController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String url = req.getRequestURI();
        System.out.println(req.getParameterMap().keySet().toString());
        ResponseModel responseModel= new ResponseModel();
        if (url.equals("/api/contact/save")) {
            Contact contact = new Contact();
            try {
                BeanUtils.populate(contact, req.getParameterMap());
            } catch (IllegalAccessException | InvocationTargetException e) {
                throw new RuntimeException(e);
            }
            System.out.println(contact.toString());
            SingleValidator validator = new EmailSingleValidator();
            if(!validator.validator(contact.getEmail())){
                resp.setStatus(400);
                responseModel.setName("email");
                responseModel.setData("email không hợp lệ vui lòng nhập lại");
                PrintWriter printWriter = resp.getWriter();
                printWriter.print(new Gson().toJson(responseModel));
                printWriter.flush();
                printWriter.close();
                return;
            }
            int status = ContactService.getInstance().add(contact);
            if (status == 1) {
                responseModel.setName("success");
                responseModel.setData("/home");
                responseModel.setStatus("200");
                responseModel.setMessage("Cảm ơn bạn đã liên hệ với chúng tôi");
            } else {
                responseModel.setName("sys");
                responseModel.setData("/home");
                responseModel.setStatus("500");
                responseModel.setMessage("Có lỗi xảy ra vui lòng thử lại sau");
            }
            PrintWriter printWriter = resp.getWriter();
            printWriter.print(new Gson().toJson(responseModel));
            printWriter.flush();
            printWriter.close();
            return;
        }
    }
}
