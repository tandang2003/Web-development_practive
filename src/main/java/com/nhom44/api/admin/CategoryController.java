package com.nhom44.api.admin;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
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
import java.util.Map;

import static com.nhom44.util.GsonUtil.getGson;

@WebServlet(urlPatterns = {"/api/admin/category", "/api/admin/category/add", "/api/admin/category/edit/*"})
public class CategoryController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (req.getServletPath().equals("/api/admin/category")) {
            List<Category> categories = CategoryService.getInstance().getAll();
            Gson gson = getGson();
            PrintWriter printWriter = resp.getWriter();
            String json = gson.toJson(categories);
            printWriter.println(json);
            printWriter.flush();
            printWriter.close();
        } else if (req.getServletPath().equals("/api/admin/category/edit")) {
            JsonObject jsonObject = new JsonObject();
            resp.setStatus(200);
            if (req.getPathInfo().substring(1) == null) {
                jsonObject.addProperty("status", 404);
                jsonObject.addProperty("message", "Không tìm thấy loại dự án");
                jsonObject.addProperty("data", "/admin/category_management");
                resp.getWriter().print(jsonObject.toString());
                resp.getWriter().flush();
                return;
            }
            int id = Integer.parseInt(req.getPathInfo().substring(1));
            Category category = CategoryService.getInstance().getById(id);
            if (category == null) {
                jsonObject.addProperty("status", 404);
                jsonObject.addProperty("message", "Không tìm thấy loại dự án");
                jsonObject.addProperty("data", "/admin/category_management");
                resp.getWriter().print(jsonObject.toString());
                resp.getWriter().flush();
                return;
            }
            Gson gson = getGson();
            PrintWriter printWriter = resp.getWriter();
            String json = gson.toJson(category);
            printWriter.println(json);
            printWriter.flush();
            printWriter.close();
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String url = req.getServletPath();
        JsonObject jsonObject = new JsonObject();
        resp.setStatus(200);
        if (!validate(req, resp)) {
            return;
        }

        if (url.equals("/api/admin/category/add")) {
            Category category = createCategory(req.getParameterMap(), null);
            CategoryService.getInstance().add(category);
            jsonObject.addProperty("message", "Loại dự án mới đã được thêm thành công vui lòng kiểm tra");
        } else if (url.equals("/api/admin/category/edit")) {
            int id = Integer.parseInt(req.getPathInfo().substring(1));
            Category old = CategoryService.getInstance().getById(id);
            Category category = createCategory(req.getParameterMap(), null);
            if (!old.getName().equals(category.getName())) {
                category.setId(id);
                CategoryService.getInstance().update(category);
            }
            jsonObject.addProperty("message", "Loại dự án đã được cập nhật thành công vui lòng kiểm tra");
        }
        jsonObject.addProperty("status", 200);
        jsonObject.addProperty("data","/admin/category_management");
        Gson gson = getGson();
        PrintWriter printWriter = resp.getWriter();
        printWriter.println(jsonObject.toString());
        printWriter.flush();
        printWriter.close();
        return;
    }

    private boolean validate(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        JsonObject jsonObject = new JsonObject();
        if (!new TitleOrNameSingleValidator().validator(req.getParameter("name"))) {
            jsonObject.addProperty("message", "Tên danh mục không hợp lệ");
            jsonObject.addProperty("status", 400);
            PrintWriter printWriter = resp.getWriter();
            printWriter.println(jsonObject.toString());
            printWriter.flush();
            printWriter.close();
            return false;
        }
        if (CategoryService.getInstance().existCategory(req.getParameter("name"))) {
            jsonObject.addProperty("message", "Tên danh mục đã tồn tại");
            jsonObject.addProperty("status", 400);
            PrintWriter printWriter = resp.getWriter();
            printWriter.println(jsonObject.toString());
            printWriter.flush();
            printWriter.close();
            return false;
        }
        return true;
    }

    private Category createCategory(Map<String, String[]> map, Category category) {
        if (category == null) {
            category = new Category();
        }
        Category finalCategory = category;
        map.keySet().forEach(key -> {
            switch (key) {
                case "name":
                    finalCategory.setName(map.get(key)[0]);
                    break;
                case "status":
                    finalCategory.setStatus(Integer.parseInt(map.get(key)[0]));
                    break;
            }
        });
        return category;
    }
}
