package com.nhom44.api.user;

import com.google.gson.Gson;
import com.nhom44.bean.Project;
import com.nhom44.bean.ResponseModel;
import com.nhom44.services.ProjectService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = {"/api/user/accepted"})
public class UserAcceptedController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        System.out.println("id: " + id);
        ResponseModel responseModel;
        if (id == null) {
            System.out.println("id null");
            resp.setStatus(404);
            responseModel = new ResponseModel();
            responseModel.setName("error");
            responseModel.setData("/404");
            resp.getWriter().print(new Gson().toJson(responseModel));
            resp.getWriter().flush();
            return;
        }
        int idInt = Integer.parseInt(id);
        if (idInt <= 0) {
            System.out.println("id <= 0");
            resp.setStatus(404);
            responseModel = new ResponseModel();
            responseModel.setName("error");
            responseModel.setData("/404");
            resp.getWriter().print(new Gson().toJson(responseModel));
            resp.getWriter().flush();
            return;
        }
        try {
            Project project = ProjectService.getInstance().getById(idInt);
            if (project == null) {
                System.out.println("project null");
                resp.setStatus(404);
                responseModel = new ResponseModel();
                responseModel.setName("error");
                responseModel.setData("/404");
                resp.getWriter().print(new Gson().toJson(responseModel));
                resp.getWriter().flush();
                return;
            }
           ProjectService.getInstance().acceptProject(idInt);
            resp.setStatus(200);
            responseModel = new ResponseModel();
            responseModel.setName("success");
            resp.getWriter().print(new Gson().toJson(responseModel));
            resp.getWriter().flush();
            return;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            resp.setStatus(404);
            responseModel = new ResponseModel();
            responseModel.setName("error");
            responseModel.setData("/404");
            resp.getWriter().print(new Gson().toJson(responseModel));
            resp.getWriter().flush();
            return;
        }
    }
}
