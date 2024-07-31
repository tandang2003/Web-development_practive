package com.nhom44.api.web;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.nhom44.bean.*;
import com.nhom44.services.CategoryService;
import com.nhom44.services.ContactService;
import com.nhom44.services.ProjectService;
import com.nhom44.services.SliderService;
import com.nhom44.validator.EmailSingleValidator;
import com.nhom44.validator.NumberVallidator;
import com.nhom44.validator.SingleValidator;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.validation.Validator;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.InvocationTargetException;
import java.util.List;

import static com.nhom44.util.GsonUtil.getGson;

@WebServlet(urlPatterns = {"/api/home", "/api/home/data", "/api/home/projects/*", "/api/home/slides", "/api/home/categories", "/api/home/contact"})
public class HomeController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String url = req.getServletPath();
        User user = (User) req.getSession().getAttribute("account");
        ResponseModel responseModel = new ResponseModel();
        switch (url) {
            case "/api/home/data":
                JsonObject jsonObject = new JsonObject();
                List<Slider> sliders = SliderService.getInstance().getAllActive();
                List<Category> categories = CategoryService.getInstance().getAllActive();
                int firstCategoryId = categories.get(0).getId();
                List<Project> loadProjects = ProjectService.getInstance().get8ActiveProjectHighestView(firstCategoryId, user == null ? 0 : user.getId());
                loadProjects.forEach(project -> {
                    System.out.println(project);
                });
                jsonObject.add("sliders", getGson().toJsonTree(sliders));
                jsonObject.add("categories", getGson().toJsonTree(categories));
                jsonObject.add("projects", getGson().toJsonTree(loadProjects));
                resp.setStatus(200);
                resp.getWriter().println(jsonObject.toString());
                resp.getWriter().flush();
                resp.getWriter().close();
                break;
            case "/api/home/projects":
                int categoryId;
                if (req.getPathInfo().substring(1) == "undefined")
                    categoryId = (int) req.getSession().getAttribute("HomeFindingcategoryId");
                else {
                    categoryId = Integer.parseInt((req.getPathInfo().substring(1)));
                    req.getSession().setAttribute("HomeFindingcategoryId", categoryId);
                }
                List<Project> projects = ProjectService.getInstance().get8ActiveProjectHighestView(categoryId, user == null ? 0 : user.getId());
                responseModel.setName("success");
                responseModel.setData(projects);
                resp.setStatus(200);
                break;
//            case "/api/home/slides":
//                List<Slider> sliders = SliderService.getInstance().getAllActive();
//                responseModel.setName("success");
//                responseModel.setData(sliders);
//                resp.setStatus(200);
//                break;
//            case "/api/home/categories":
//                List<Category> categories = CategoryService.getInstance().getAllActive();
//                responseModel.setName("success");
//                responseModel.setData(categories);
//                break;

            default:
                responseModel.setName("error");
                responseModel.setData("url not found");
                break;
        }
        PrintWriter printWriter = resp.getWriter();
        printWriter.print(getGson().toJson(responseModel));
        printWriter.flush();
        printWriter.close();
        return;
    }
}