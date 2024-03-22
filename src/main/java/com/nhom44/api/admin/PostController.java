package com.nhom44.api.admin;

import com.google.gson.Gson;
import com.nhom44.bean.Post;
import com.nhom44.bean.ResponseModel;
import com.nhom44.services.PostService;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.InvocationTargetException;

@WebServlet(urlPatterns = "/api/admin/post")
public class PostController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        String action = req.getParameter("action") == null ? "#" : req.getParameter("action"System.out.println();
        String action = req.getParameter("action") == null ? "#" : req.getParameter("action");
        Post post = new Post();
        ResponseModel responseModel;
        PrintWriter printWriter = resp.getWriter();
        try {
            BeanUtils.populate(post, req.getParameterMap());

        } catch (IllegalAccessException | InvocationTargetException e) {
            responseModel = new ResponseModel();
            e.printStackTrace();
            responseModel.setMessage("Lỗi không xác định");
            responseModel.setData(null);
            responseModel.setName("sys");
            printWriter.println(new Gson().toJson(responseModel));
            printWriter.flush();
            printWriter.close();
            return;
        }
        if (action.equalsIgnoreCase("add")) {
            post = PostService.getInstance().addPost(post);
            System.out.println(post.toString());
        } else if (action.equalsIgnoreCase("edit")) {
            post = PostService.getInstance().updatePost(post);
        }
        if (post == null) {
            resp.setStatus(200);
            responseModel = new ResponseModel();
            responseModel.setMessage("Lỗi hệ thống");
            responseModel.setData(null);
            responseModel.setName("sys");

        } else {
            resp.setStatus(200);
            responseModel = new ResponseModel();
            responseModel.setMessage("Thêm thành công");
            responseModel.setData(post);
            responseModel.setName("success");
        }
        printWriter.println(new Gson().toJson(responseModel));
        printWriter.flush();
        printWriter.close();
        System.out.println(42354);
        return;

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }
}
