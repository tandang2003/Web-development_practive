package com.nhom44.api.web;

import com.google.gson.Gson;
import com.nhom44.bean.Project;
import com.nhom44.bean.ResponseModel;
import com.nhom44.bean.User;
import com.nhom44.services.ProjectService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(urlPatterns = {"/api/save_project/*"})
public class SaveProjectController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String url = req.getRequestURI();
        int projectId = Integer.parseInt(url.substring(url.lastIndexOf("/")+1));
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("auth");
        if (user == null) {
            System.out.println("user null");
            String respUrl = "/login";
            resp.setStatus(400);
            ResponseModel resModel = new ResponseModel();
            resModel.setName("login");
            resModel.setData(respUrl);
            resp.getWriter().println(new Gson().toJson(resModel));
            resp.getWriter().flush();
            return;
        }
        Project project = ProjectService.getInstance().getById(projectId);
        if (project == null) {
            resp.setStatus(400);
            ResponseModel resModel = new ResponseModel();
            resModel.setName("error");
            resModel.setMessage("project not found");
            resp.getWriter().println(new Gson().toJson(resModel));
            resp.getWriter().flush();
            return;
        }
        boolean isSave = ProjectService.getInstance().isSaveProject(project.getPostId(), user.getId());
        if (!isSave) {
            if (ProjectService.getInstance().saveProject(project.getPostId(), user.getId())) {
                resp.setStatus(200);
                ResponseModel resModel = new ResponseModel();
                resModel.setName("save");
                resModel.setMessage("save project success");
                resp.getWriter().println(new Gson().toJson(resModel));
                resp.getWriter().flush();
                return;
            }
        } else {
            if (ProjectService.getInstance().deleteSaveProject(project.getPostId(), user.getId())) {
                resp.setStatus(200);
                ResponseModel resModel = new ResponseModel();
                resModel.setName("delete");
                resModel.setMessage("delete project success");
                resp.getWriter().println(new Gson().toJson(resModel));
                resp.getWriter().flush();
                return;
            }
        }
    }
}
