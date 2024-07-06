package com.nhom44.api.web;

import com.google.gson.Gson;
import com.nhom44.bean.*;
import com.nhom44.services.ImageService;
import com.nhom44.services.PostService;
import com.nhom44.services.ProjectService;
import com.nhom44.services.ServiceOfProjectService;
import com.nhom44.util.LoadSession;
import com.nhom44.validator.NumberVallidator;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import java.util.List;
@WebServlet(urlPatterns = {"/api/services", "/api/post/services/*"})
public class ServiceController extends HttpServlet {
    @Override
    protected void doGet(javax.servlet.http.HttpServletRequest req, javax.servlet.http.HttpServletResponse resp) throws javax.servlet.ServletException, java.io.IOException {
        String url = req.getServletPath();
        ResponseModel responseModel = new ResponseModel();
        switch (url) {
            case "/api/services":
                List<Service> services = ServiceOfProjectService.getInstance().getAllActive();
                responseModel.setStatus("200");
                responseModel.setMessage("Success");
                responseModel.setData(services);
                resp.setStatus(200);
                resp.getWriter().println(new Gson().toJson(responseModel));
                resp.getWriter().flush();
                resp.getWriter().close();
                break;
            case "/api/post/services":
                String path = req.getPathInfo().trim().substring(1);
                String id = path.contains("/") ? path.split("/")[0] : path;
                if (id == null || !new NumberVallidator().validator(id)) {
                    resp.sendRedirect("/404");
                    return;
                }
                Service service = ServiceOfProjectService.getInstance().getActiveById(Integer.parseInt(id));
                service.setName("DỊCH VỤ " + service.getName().toUpperCase());
                service.setUpdatedAt(service.getUpdatedAt().substring(0, 10));
                User user = (User) req.getSession().getAttribute("auth");
                if (user != null) {
                    ProjectService.getInstance().addHistory(user.getId(), service.getPostId());
                }
                responseModel.setStatus("200");
                responseModel.setMessage("get post success");
                responseModel.setData(service);
                if (path.contains("/")) {
                    switch (path.split("/")[1].trim()) {
                        case "suggest":
                            List<Service> suggestServices = ServiceOfProjectService.getInstance().getSuggestServices();
                            responseModel.setMessage("get suggest services success");
                            responseModel.setData(suggestServices);
                            break;
                        case "post":
                            Post post = PostService.getInstance().getById(service.getPostId());
                            responseModel.setMessage("get post success");
                            responseModel.setData(post);
                            break;
                    }
                }

                resp.setStatus(200);
                resp.getWriter().println(new Gson().toJson(responseModel));
                resp.getWriter().flush();
                resp.getWriter().close();
                break;
        }
    }
}
