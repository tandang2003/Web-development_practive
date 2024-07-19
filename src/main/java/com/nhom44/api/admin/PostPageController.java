package com.nhom44.api.admin;

import com.google.gson.JsonObject;
import com.nhom44.bean.Project;
import com.nhom44.services.ProjectService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import static com.nhom44.util.GsonUtil.getGson;

@WebServlet(urlPatterns = "/api/admin/post_page/project")
public class PostPageController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String url=req.getServletPath();
        if (url.equals("/api/admin/post_page/project")) {
            List<Project> projects = ProjectService.getInstance().getNumOfSavedAndRead();
            resp.getWriter().print(getGson().toJson(projects));
            resp.getWriter().flush();
        }
    }
}
