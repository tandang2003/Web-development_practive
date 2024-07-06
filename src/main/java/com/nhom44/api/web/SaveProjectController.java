package com.nhom44.api.web;

import com.google.gson.Gson;
import com.nhom44.bean.User;
import com.nhom44.bean.Project;
import com.nhom44.bean.ResponseModel;
import com.nhom44.bean.SaveItem;
import com.nhom44.log.model.Log;
import com.nhom44.log.util.function.LikeLog;
import com.nhom44.log.util.function.LogFunction;
import com.nhom44.services.ProjectService;
import com.nhom44.services.SaveProjectService;

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
        String url = req.getPathInfo();
        int projectId = Integer.parseInt(url.substring(url.lastIndexOf("/") + 1));
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("auth");
        LikeLog likeLog = new LikeLog();
        if (user == null) {
            likeLog.setLevel(3);
            likeLog.log(req);
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
            likeLog.setLevel(3);
            likeLog.log(req);
            resp.setStatus(400);
            ResponseModel resModel = new ResponseModel();
            resModel.setName("save");
            resModel.setMessage("save project success");
            resp.getWriter().println(new Gson().toJson(resModel));
            resp.getWriter().flush();
            return;
        }
        boolean isSave = SaveProjectService.getInstance().isSaveProject(project.getPostId(), user.getId());
        SaveItem saveItem = SaveItem.builder()
                .postId(project.getPostId())
                .userId(1)
                .build();
        if (!isSave) {
            saveItem.setStatus(1);
            SaveProjectService.getInstance().saveProject(saveItem);
            LikeLog logFunction = new LikeLog();
            logFunction.setValue(saveItem);
            logFunction.setPostValue();
            logFunction.log(req);
            resp.setStatus(200);
            ResponseModel resModel = new ResponseModel();
            resModel.setName("save");
            resModel.setMessage("save project success");
            resp.getWriter().println(new Gson().toJson(resModel));
            resp.getWriter().flush();
            return;
        } else {
            saveItem.setStatus(0);
            SaveProjectService.getInstance().deleteSaveProject(saveItem);
            LikeLog logFunction = new LikeLog();
            logFunction.setValue(saveItem);
            logFunction.setPreValue();
            logFunction.log(req);
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