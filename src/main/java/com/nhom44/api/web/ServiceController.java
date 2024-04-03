package com.nhom44.api.web;

import com.google.gson.Gson;
import com.nhom44.bean.ResponseModel;
import com.nhom44.bean.Service;
import com.nhom44.services.ServiceOfProjectService;
import com.nhom44.util.LoadSession;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import java.util.List;

@WebServlet(urlPatterns = "/api/services")
public class ServiceController extends HttpServlet {
    @Override
    protected void doGet(javax.servlet.http.HttpServletRequest req, javax.servlet.http.HttpServletResponse resp) throws javax.servlet.ServletException, java.io.IOException {
        System.out.println("success loading service");
        List<Service> services = ServiceOfProjectService.getInstance().getAllActive();
        ResponseModel responseModel = new ResponseModel();
        responseModel.setStatus("200");
        responseModel.setMessage("Success");
        responseModel.setData(services);
        resp.setStatus(200);
        resp.getWriter().println(new Gson().toJson(responseModel));
        resp.getWriter().flush();
        resp.getWriter().close();

    }
}
