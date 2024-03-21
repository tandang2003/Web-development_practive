package com.nhom44.api.admin;

import com.google.gson.Gson;
import com.nhom44.bean.Category;
import com.nhom44.bean.ResponseModel;
import com.nhom44.services.CategoryService;
import com.nhom44.validator.TitleOrNameSingleValidator;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.beanutils.converters.DateTimeConverter;
import org.apache.commons.beanutils.converters.SqlDateConverter;
import org.jdbi.v3.core.statement.UnableToExecuteStatementException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.InvocationTargetException;
import java.sql.Date;
import java.util.List;

@WebServlet(urlPatterns = "/api/admin/category")
public class CategoryController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Category> categories = CategoryService.getInstance().getAll();
        Gson gson = new Gson();
        PrintWriter printWriter = resp.getWriter();
        String json = gson.toJson(categories);
        System.out.println(json);
        printWriter.println(json);
        printWriter.flush();
        printWriter.close();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action") == null ? "#" : req.getParameter("action");
        ResponseModel responseModel;
        if (!new TitleOrNameSingleValidator().validator(req.getParameter("name"))) {
            responseModel = new ResponseModel();
            responseModel.setName("name");
            responseModel.setMessage("Tên danh mục không hợp lệ");
            Gson gson = new Gson();
            PrintWriter printWriter = resp.getWriter();
            String json = gson.toJson(responseModel);
            printWriter.println(json);
            printWriter.flush();
            printWriter.close();
            return;
        }

        Category category = new Category();
        try {
            if (action.equals("add")) {
                BeanUtils.populate(category, req.getParameterMap());
                System.out.println(category.toString());

                int status = CategoryService.getInstance().add(category);
                if (status == -1) {
                    resp.setStatus(400);
                    responseModel = new ResponseModel();
                    responseModel.setName("name");
                    responseModel.setMessage("Tên danh mục đã tồn tại");
                    Gson gson = new Gson();
                    PrintWriter printWriter = resp.getWriter();
                    String json = gson.toJson(responseModel);
                    printWriter.println(json);
                    printWriter.flush();
                    printWriter.close();
                    return;
                }
            } else if (action.equals("edit")) {
                BeanUtils.populate(category, req.getParameterMap());
                Category old = CategoryService.getInstance().getById(category.getId());
                int status = 1;
                if (!old.getName().equals(category.getName()))
                    status = CategoryService.getInstance().update(category);
                if (status == -1) {
                    resp.setStatus(400);
                    responseModel = new ResponseModel();
                    responseModel.setName("name");
                    responseModel.setMessage("Tên danh mục đã tồn tại");
                    Gson gson = new Gson();
                    PrintWriter printWriter = resp.getWriter();
                    String json = gson.toJson(responseModel);
                    printWriter.println(json);
                    printWriter.flush();
                    printWriter.close();
                    return;
                }
            }
        } catch (IllegalAccessException | UnableToExecuteStatementException | InvocationTargetException e) {
            responseModel = new ResponseModel();    resp.setStatus(200);
            responseModel.setName("sys");
            responseModel.setMessage("Hệ thống đang bận");
            Gson gson = new Gson();
            PrintWriter printWriter = resp.getWriter();
            String json = gson.toJson(responseModel);
            printWriter.flush();
            printWriter.close();
            return;
        }
        resp.setStatus(200);
        responseModel = new ResponseModel();
        responseModel.setName("success");
        responseModel.setMessage("Thêm thành công");
        responseModel.setData("/admin/category_management");
        Gson gson = new Gson();
        PrintWriter printWriter = resp.getWriter();
        String json = gson.toJson(responseModel);
        printWriter.println(json);
        printWriter.flush();
        printWriter.close();
        return;

    }
}
