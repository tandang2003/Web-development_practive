package com.nhom44.controller.user;

import com.nhom44.bean.Project;
import com.nhom44.bean.User;
import com.nhom44.services.ProjectService;
import com.nhom44.services.UserService;
import com.nhom44.util.LoadSession;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/user/save-list")
public class SaveListController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        LoadSession.loadSession(req);
        System.out.println("user saved nto api");
        req.setAttribute("page","account");
        User user= (User) req.getSession().getAttribute("auth");
       int sizePage= ProjectService.getInstance().pageSizeProjectByUserId(user.getId());
        System.out.println("size page: "+sizePage);
        req.setAttribute("sizePage",sizePage);
        req.getRequestDispatcher("/views/user/savedList.jsp").forward(req,resp);
    }
}
