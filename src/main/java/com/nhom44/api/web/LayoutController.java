package com.nhom44.api.web;

import com.google.gson.Gson;
import com.nhom44.bean.Category;
import com.nhom44.bean.Service;
import com.nhom44.services.CategoryService;
import com.nhom44.services.ServiceOfProjectService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(urlPatterns = "/api/layout")
public class LayoutController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Category> categories = CategoryService.getInstance().getAllActive();
        List<Service> services = ServiceOfProjectService.getInstance().getAllActive();
        Map<String, List> map = new HashMap<>();
        map.put("categories", categories);
        map.put("services", services);
        resp.setStatus(200);
        resp.getWriter().println(new Gson().toJson(map));
        resp.getWriter().flush();
        resp.getWriter().close();

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
