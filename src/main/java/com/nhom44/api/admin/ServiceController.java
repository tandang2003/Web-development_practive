package com.nhom44.api.admin;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.nhom44.bean.Post;
import com.nhom44.bean.ResponseModel;
import com.nhom44.bean.Service;
import com.nhom44.log.util.function.admin.ServiceLog;
import com.nhom44.services.PostService;
import com.nhom44.services.ServiceOfProjectService;
import com.nhom44.util.Upload;
import com.nhom44.validator.DescriptionSingleValidator;
import com.nhom44.validator.SingleValidator;
import com.nhom44.validator.TitleOrNameSingleValidator;
import org.apache.commons.beanutils.BeanUtils;
import org.jdbi.v3.core.statement.UnableToExecuteStatementException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import static com.nhom44.util.GsonUtil.getGson;

@WebServlet(urlPatterns = {"/api/admin/service", "/api/admin/service/add", "/api/admin/service/edit/*"})
public class ServiceController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String url = req.getServletPath();
        if (url.equalsIgnoreCase("/api/admin/service")) {
            resp.getWriter().println(getGson().toJson(ServiceOfProjectService.getInstance().getAdminAll()));
            resp.getWriter().flush();
            return;
        } else if (url.equals("/api/admin/service/edit")) {
            int id = Integer.parseInt(req.getPathInfo().substring(1));
            Service service = ServiceOfProjectService.getInstance().getById(id);
            Post post = PostService.getInstance().getById(service.getPostId());
            JsonObject jsonObject = new JsonObject();
            jsonObject.addProperty("status", 200);
            jsonObject.add("service", getGson().toJsonTree(service));
            jsonObject.add("post", getGson().toJsonTree(post));
            resp.getWriter().print(jsonObject.toString());
            resp.getWriter().flush();
            return;
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String url = req.getServletPath();
        switch (url) {
            case "/api/admin/service/add":
                addService(req, resp);
                break;
            case "/api/admin/service/edit":
                editService(req, resp);
                break;
        }
    }

    private void editService(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        Map<String, String[]> map = req.getParameterMap();
        System.out.println(map.get("status")[0]);
        Service oldService = ServiceOfProjectService.getInstance().getById(Integer.parseInt(map.get("id")[0]));
        Post oldPost = PostService.getInstance().getById(oldService.getPostId());
        Service service = createService(map, oldService);
        Post post = createPost(map, oldPost);
        if (ServiceOfProjectService.getInstance().isExist(service)) {
            resp.setStatus(200);
            JsonObject jsonObject = new JsonObject();
            jsonObject.addProperty("status", 400);
            jsonObject.addProperty("message", "Dịch vụ đã tồn tại");
            resp.getWriter().print(jsonObject.toString());
            resp.getWriter().flush();
            return;
        }
        PostService.getInstance().updatePost(post);
        new ServiceLog(req, service).editLog(service);
        JsonObject jsonObject = new JsonObject();
        jsonObject.addProperty("status", 200);
        jsonObject.addProperty("message", "Cập nhật dịch vụ thành công");
        jsonObject.addProperty("redirect", "/admin/service");
        resp.setStatus(200);
        resp.getWriter().print(jsonObject.toString());
        resp.getWriter().flush();
    }

    public void addService(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        Map<String, String[]> map = req.getParameterMap();
        Post post = createPost(map, null);
        Service service = createService(map, null);
        JsonObject jsonObject = new JsonObject();
        if (ServiceOfProjectService.getInstance().isExist(service)) {
            resp.setStatus(200);
            jsonObject.addProperty("status", 400);
            jsonObject.addProperty("message", "Dịch vụ đã tồn tại");
            resp.getWriter().print(jsonObject.toString());
            resp.getWriter().flush();
            return;
        }
        int postId = PostService.getInstance().addPost(post);
        service.setPostId(postId);
        int i = ServiceOfProjectService.getInstance().add(service);
        service.setId(i);
        new ServiceLog(req, service).addLog();
        jsonObject.addProperty("status", 200);
        jsonObject.addProperty("message", "Thêm dịch vụ thành công");
        jsonObject.addProperty("redirect", "/admin/service");
        resp.setStatus(200);
        resp.getWriter().print(jsonObject.toString());
        resp.getWriter().flush();
    }

    private Post createPost(Map<String, String[]> map, Post post) {
        if (post == null) {
            post = new Post();
        }
        Post finalPost = post;
        map.keySet().forEach(key -> {
            switch (key) {
                case "content":
                    finalPost.setContent(map.get(key)[0]);
                    break;
            }
        });
        return finalPost;
    }

    private Service createService(Map<String, String[]> map, Service service) {
        if (service == null) {
            service = new Service();
        }
        Service finalService = service;
        map.keySet().forEach(key -> {
            switch (key) {
                case "id":
                    finalService.setId(Integer.parseInt(map.get(key)[0]));
                    break;
                case "name":
                    finalService.setName(map.get(key)[0]);
                    break;
                case "description":
                    finalService.setDescription(map.get(key)[0]);
                    break;
                case "avatar":
                    finalService.setAvatar(map.get(key)[0]);
                    break;
                case "status":
                    finalService.setStatus(Integer.parseInt(map.get(key)[0]));
                    break;
            }
        });
        return finalService;
    }
}