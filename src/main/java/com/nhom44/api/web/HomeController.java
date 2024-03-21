package com.nhom44.api.web;

import com.google.gson.Gson;
import com.nhom44.bean.Contact;
import com.nhom44.bean.User;
import com.nhom44.bean.Project;
import com.nhom44.bean.ResponseModel;
import com.nhom44.services.ContactService;
import com.nhom44.services.ProjectService;
import com.nhom44.validator.EmailSingleValidator;
import com.nhom44.validator.NumberVallidator;
import com.nhom44.validator.SingleValidator;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.validation.Validator;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.InvocationTargetException;
import java.util.List;

@WebServlet(urlPatterns = {"/api/home", "/api/home/projects", "/api/home/contact"})
public class HomeController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String url = req.getRequestURI();
        User user = (User) req.getSession().getAttribute("auth");
        System.out.println(req.getParameterMap().keySet().toString());
        ResponseModel responseModel = new ResponseModel();
        if (url.equals("/api/home/projects")) {
            String id = req.getParameter("id");
            if (new NumberVallidator().validator(id)) {
                int i = Integer.parseInt(id);
                List<Project> projects = ProjectService.getInstance().get8ActiveProjectHighestView(i,user==null?0:user.getId());
                System.out.println(projects);
                responseModel.setName("success");
                responseModel.setData(new Gson().toJson(projects));
            } else {
                responseModel.setName("error");
                responseModel.setData("id is not number");
            }
            PrintWriter printWriter = resp.getWriter();
            printWriter.print(new Gson().toJson(responseModel));
            printWriter.flush();
            printWriter.close();
            return;


        }
        super.doPost(req, resp);
    }
}
