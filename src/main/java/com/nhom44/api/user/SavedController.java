package com.nhom44.api.user;

import com.google.gson.Gson;
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

@WebServlet(urlPatterns = "/api/user/saved")
public class SavedController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("user saved");
        String offset= req.getParameter("offset")==null?"0":req.getParameter("offset");
        User user= (User) req.getSession().getAttribute("auth");
//        System.out.println(user.toString());
//        TODO: CHECKING RESPONSE
        System.out.println(user.toString());
        List<Project> projects= ProjectService.getInstance().getLikedProjectByUserId(user.getId() ,Integer.parseInt(offset)*16);
        Gson gson= new Gson();
        System.out.println("response");
        System.out.println(projects);
        resp.getWriter().print(gson.toJson(projects));
        resp.getWriter().flush();
    }
}
