package com.nhom44.api.user;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.nhom44.bean.Project;
import com.nhom44.bean.User;
import com.nhom44.services.ProjectService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import static com.nhom44.util.GsonUtil.getGson;

@WebServlet(urlPatterns = {"/api/user/history","/api/user/history/length"})
public class HistoryController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    String url= req.getServletPath();
    if(url.equals("/api/user/history")){
        getHistory(req,resp);
    }else if(url.equals("/api/user/history/length")){
        getLength(req,resp);
    }
    }
    private void getLength(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        User user= (User) req.getSession().getAttribute("account");
        int sizePage= ProjectService.getInstance().pageSizeHistoryProjectByUserId(user.getId());
        JsonObject jsonObject= new JsonObject();
        jsonObject.addProperty("status",200);
        jsonObject.addProperty("data",sizePage);
        resp.getWriter().print(jsonObject.toString());
        resp.getWriter().flush();
    }
    private void getHistory(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String offset= req.getParameter("offset")==null?"0":req.getParameter("offset");
        User user= (User) req.getSession().getAttribute("account");
        List<Project> projects= ProjectService.getInstance().getHistoryUserProject(user.getId() ,Integer.parseInt(offset)*16);
        System.out.println(123);
        projects.forEach(System.out::println);
        Gson gson= getGson();
        resp.getWriter().print(gson.toJson(projects));
        resp.getWriter().flush();
    }
}
