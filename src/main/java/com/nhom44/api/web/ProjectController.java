package com.nhom44.api.web;

import com.google.gson.Gson;
import com.nhom44.bean.Project;
import com.nhom44.bean.User;
import com.nhom44.services.ProjectService;
import com.nhom44.services.UserService;
import com.nhom44.util.PriceObjectHelper;
import com.nhom44.util.SearcherProjectUtil;
import com.nhom44.validator.NumberVallidator;
import com.nhom44.validator.SingleValidator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = {"/api/project/search", "/api/project/search/length"})
public class ProjectController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String url = req.getRequestURI();
        System.out.println(req.getParameterMap().keySet().toString());
        List<PriceObjectHelper> prices = SearcherProjectUtil.PRICE_SEARCHING;
        req.setAttribute("prices", prices);
        if (url.equals("/api/project")) {
//            List<Project> projects = ProjectService.getInstance().getProjetAllActive();
        } else if (url.equals("/api/project/search") || url.equals("/api/project/search/length")) {
            SingleValidator validator = new NumberVallidator();
            HttpSession session = req.getSession();
            int categoryId = validator.validator(req.getParameter("categoryId")) ? Integer.parseInt(req.getParameter("categoryId")) : 0;
            int provinceId = validator.validator(req.getParameter("provinceId")) ? Integer.parseInt(req.getParameter("provinceId")) : 0;
            int price = validator.validator(req.getParameter("price")) ? Integer.parseInt(req.getParameter("price")) : 0;
            int area = validator.validator(req.getParameter("area")) ? Integer.parseInt(req.getParameter("area")) : 0;
            int serviceId = validator.validator(req.getParameter("serviceId")) ? Integer.parseInt(req.getParameter("serviceId")) : 0;
            int offset = validator.validator(req.getParameter("offset")) ? Integer.parseInt(req.getParameter("offset")) * 16 : 0;
            System.out.println("serviceId " + serviceId);
            System.out.println("categoryId " + categoryId);
            System.out.println("provinceId " + provinceId);
            System.out.println("area " + area);
            System.out.println("ser " + serviceId);
            long minPrice = 0;
            long maxPrice = 0;
            if (price == SearcherProjectUtil.PRICE_SEARCHING.size()) {
                maxPrice = SearcherProjectUtil.PRICE_SEARCHING.get(price - 1).getAmount();
                minPrice = 0;
            } else if (price > 0) {
                maxPrice = 0;
                minPrice = SearcherProjectUtil.PRICE_SEARCHING.get(price - 1).getAmount();
            }
            int minArea = 0;
            int maxArea = 0;
            if (area == SearcherProjectUtil.ACREAGE.size()) {
                maxArea = SearcherProjectUtil.ACREAGE.get(area - 1);
                minArea = 0;
            } else if (area > 0) {
                maxArea = 0;
                minArea = SearcherProjectUtil.ACREAGE.get(area - 1);
            }
            System.out.println("serviceId " + serviceId);
            System.out.println("categoryId " + categoryId);
            System.out.println("provinceId " + provinceId);
            System.out.println("minPrice " + minPrice);
            System.out.println("maxPrice " + maxPrice);
            System.out.println("minAcreage " + minArea);
            System.out.println("maxAcreage " + maxArea);
            if (url.equals("/api/project/search")) {
                User user = (User) req.getSession().getAttribute("auth");
                int userid = user != null ? user.getId() : 0;
                List<Project> projects = ProjectService.getInstance().getProjetAllActive(offset, categoryId, serviceId, provinceId, minPrice, maxPrice, minArea, maxArea, userid);
//                for (Project project : projects) {
//                    System.out.println(project.toString());
//                }
//                System.out.println(new Gson().toJson(projects));
                resp.setStatus(200);
                resp.getWriter().print(new Gson().toJson(projects));
            } else if (url.equals("/api/project/search/length")) {
                int size = ProjectService.getInstance().getProjetAllActiveSize(offset, categoryId, serviceId, provinceId, minPrice, maxPrice, minArea, maxArea);
                System.out.println("size=" + size);
                System.out.println(size / 16);
                resp.setStatus(200);
                resp.getWriter().print(new Gson().toJson(size));
            }
            System.out.println(categoryId + " " + provinceId + " " + price + " " + area + " " + serviceId);
            resp.getWriter().flush();
            resp.getWriter().close();
            System.out.println(url);
            return;
        }
    }
}
