package com.nhom44.api.web;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.nhom44.bean.*;
import com.nhom44.services.*;
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

@WebServlet(urlPatterns = {"/api/project", "/api/project/search", "/api/project/search/length", "/api/post/project/*"})
public class ProjectController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String url = req.getServletPath();
        ResponseModel responseModel = new ResponseModel();
        if (url.equals("/api/project")) {
            List<Service> services = ServiceOfProjectService.getInstance().getAllActive();
            List<Category> categories = CategoryService.getInstance().getAllActive();
            List<Province> provinces = ProvinceService.getInstance().getAll();
            List<PriceObjectHelper> prices = SearcherProjectUtil.PRICE_SEARCHING;
            List<Integer> acreages = SearcherProjectUtil.ACREAGE;
            JsonObject jsonObject = new JsonObject();
            jsonObject.add("services", new Gson().toJsonTree(services));
            jsonObject.add("categories", new Gson().toJsonTree(categories));
            jsonObject.add("provinces", new Gson().toJsonTree(provinces));
            jsonObject.add("prices", new Gson().toJsonTree(prices));
            jsonObject.add("acreages", new Gson().toJsonTree(acreages));
            responseModel.setStatus("200");
            responseModel.setMessage("get project search data");
            responseModel.setData(jsonObject.toString());
            resp.setStatus(200);
            resp.getWriter().println(new Gson().toJson(responseModel));
            resp.getWriter().flush();
            resp.getWriter().close();
            return;
        } else if (url.equals("/api/post/project")) {
            String path = req.getPathInfo().trim().substring(1);
            String id = path.contains("/") ? path.split("/")[0] : path;
            if (id == null || !new NumberVallidator().validator(id)) {
                resp.sendRedirect("/404");
                return;
            }
            Project project = ProjectService.getInstance().getActiveById(Integer.parseInt(id));
            project.setUpdatedAt(project.getUpdatedAt().substring(0, 10));
            User user = (User) req.getSession().getAttribute("auth");
            if (user != null) {
                project.setSave(ProjectService.getInstance().isLikeByUser(user.getId(), project.getPostId()) ? true : false);
                ProjectService.getInstance().addHistory(user.getId(), project.getPostId());
            }
            responseModel.setStatus("200");
            responseModel.setMessage("get project success");
            responseModel.setData(project);
            System.out.println(path);
            if (path.contains("/")) {
                switch (path.split("/")[1].trim()) {
                    case "suggest":
                        List<Project> suggestProjects = ProjectService.getInstance().getSuggestProjects(project.getCategoryId());
                        responseModel.setData(suggestProjects);
                        break;
                    case "services":
                        List<Service> services = ServiceOfProjectService.getInstance().getServicesByProjectId(project.getId());
                        responseModel.setData(services);
                        break;
                    case "post":
                        Post post = PostService.getInstance().getById(project.getPostId());
                        responseModel.setData(post);
                        break;
                    case "gallery":
                        List<String> gallery = ImageService.getInstance().getGroupImagesByProjectId(Integer.parseInt(id));
                        for (String img :
                                gallery) {
                            System.out.println(img);
                        }
                        responseModel.setData(gallery);
                        break;
                }
            }

            resp.setStatus(200);
            resp.getWriter().println(new Gson().toJson(responseModel));
            resp.getWriter().flush();
            resp.getWriter().close();
            return;
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String url = req.getServletPath();
        System.out.println(url);
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
            if (url.equals("/api/project/search")) {
                User user = (User) req.getSession().getAttribute("auth");
                int userid = user != null ? user.getId() : 0;
                List<Project> projects = ProjectService.getInstance().getProjetAllActive(offset, categoryId, serviceId, provinceId, minPrice, maxPrice, minArea, maxArea, userid);
                System.out.println(new Gson().toJson(projects));
                resp.setStatus(200);
                resp.getWriter().print(new Gson().toJson(projects));
            } else if (url.equals("/api/project/search/length")) {
                int size = ProjectService.getInstance().getProjetAllActiveSize(offset, categoryId, serviceId, provinceId, minPrice, maxPrice, minArea, maxArea);
                resp.setStatus(200);
                resp.getWriter().print(new Gson().toJson(size));
            }
            resp.getWriter().flush();
            resp.getWriter().close();
            return;
        }
    }
}
