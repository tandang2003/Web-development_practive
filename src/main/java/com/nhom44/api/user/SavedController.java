package com.nhom44.api.user;

import com.google.api.client.json.Json;
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

@WebServlet(urlPatterns = {"/api/user/saved", "/api/user/saved/pages"})
public class SavedController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       String url = req.getServletPath();
       if(url.equals("/api/user/saved")){
           getSavedProjects(req, resp);
       }else{
              getSavedProjectsPages(req, resp);
       }
    }

    private void getSavedProjectsPages(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        User user = (User) req.getSession().getAttribute("account");
        int sizePage = ProjectService.getInstance().pageSizeProjectByUserId(user.getId());
        JsonObject jsonObject = new JsonObject();
        resp.setStatus(200);
        jsonObject.addProperty("status", 200);
        jsonObject.addProperty("data", sizePage);
            resp.getWriter().print(jsonObject);
            resp.getWriter().flush();
            resp.getWriter().close();
    }

    private void getSavedProjects(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String offset= req.getParameter("offset")==null?"0":req.getParameter("offset");
        User user= (User) req.getSession().getAttribute("account");
        if (user==null){
            resp.setStatus(200);
                resp.getWriter().print("Bạn chưa đăng nhập");resp.getWriter().flush();
                resp.getWriter().close();
            return;
        }
//        System.out.println(user.toString());
//        TODO: CHECKING RESPONSE
        System.out.println(user.toString());
        List<Project> projects= ProjectService.getInstance().getLikedProjectByUserId(user.getId() ,Integer.parseInt(offset)*16);
        Gson gson= getGson();
        System.out.println("response");
        System.out.println(projects);
        resp.getWriter().print(gson.toJson(projects));
        resp.getWriter().flush();
    }
}
