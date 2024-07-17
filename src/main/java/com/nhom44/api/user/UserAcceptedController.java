package com.nhom44.api.user;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.nhom44.bean.Project;
import com.nhom44.bean.ResponseModel;
import com.nhom44.bean.User;
import com.nhom44.services.ProjectService;
import com.nhom44.services.ServiceOfProjectService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import static com.nhom44.util.GsonUtil.getGson;

@WebServlet(urlPatterns = {"/api/user/accepted", "/api/user/project"})
public class UserAcceptedController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String url = req.getServletPath();
        if (url.equals("/api/user/project")) {
            User user = (User) req.getSession().getAttribute("account");
            List<Project> projects = ProjectService.getInstance().getOwnProject(user.getId());
            Map<Integer, String> map = ServiceOfProjectService.getInstance().getServicesForOwnerByProjectIds(projects);
//            req.setAttribute("map", map);
            JsonObject jsonObject = new JsonObject();
            jsonObject.add("projects", getGson().toJsonTree(projects));
            jsonObject.add("map", getGson().toJsonTree(map));
            resp.getWriter().print(jsonObject.toString());
            resp.getWriter().flush();
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        ResponseModel responseModel;
        if (id == null) {
            resp.setStatus(404);
            responseModel = new ResponseModel();
            responseModel.setName("error");
            responseModel.setData("/404");
            resp.getWriter().print(getGson().toJson(responseModel));
            resp.getWriter().flush();
            return;
        }
        int idInt = Integer.parseInt(id);
        if (idInt <= 0) {
            resp.setStatus(404);
            responseModel = new ResponseModel();
            responseModel.setName("error");
            responseModel.setData("/404");
            resp.getWriter().print(getGson().toJson(responseModel));
            resp.getWriter().flush();
            return;
        }
        try {
            Project project = ProjectService.getInstance().getById(idInt);
            if (project == null) {
                resp.setStatus(404);
                responseModel = new ResponseModel();
                responseModel.setName("error");
                responseModel.setData("/404");
                resp.getWriter().print(getGson().toJson(responseModel));
                resp.getWriter().flush();
                return;
            }
            ProjectService.getInstance().acceptProject(idInt);
            resp.setStatus(200);
            responseModel = new ResponseModel();
            responseModel.setName("success");
            resp.getWriter().print(getGson().toJson(responseModel));
            resp.getWriter().flush();
            return;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            resp.setStatus(404);
            responseModel = new ResponseModel();
            responseModel.setName("error");
            responseModel.setData("/404");
            resp.getWriter().print(getGson().toJson(responseModel));
            resp.getWriter().flush();
            return;
        }
    }
}
