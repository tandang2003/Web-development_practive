package com.nhom44.controller.admin.user;

import com.nhom44.bean.Province;
import com.nhom44.bean.User;
import com.nhom44.services.ProvinceService;
import com.nhom44.services.UserService;
import com.nhom44.validator.EmailSingleValidator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = {"/admin/user_management", "/admin/add_user", "/admin/edit_user/*"})
public class UserManagementController extends HttpServlet {
    private final UserService userService = UserService.getInstance();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String url = req.getServletPath();
        if(url.equals("/admin/user_management")){
            req.getRequestDispatcher("/views/admin/user/user_manage.jsp").forward(req, resp);
        } else if (url.equalsIgnoreCase("/admin/add_user")) {
            req.getRequestDispatcher("/views/admin/user/add_user.jsp").forward(req, resp);
        } else if (url.equalsIgnoreCase("/admin/edit_user")) {
            String param= req.getPathInfo();
            System.out.println("param "+ param);
//            String email = req.getParameter("useremail");
//            if(!new EmailSingleValidator().validator(email)){
//           resp.sendRedirect("/404");
//            }
//            User user = userService.getUserByEmail(email);
//            if(user==null){
//                resp.sendRedirect("/404");
//            }
//            System.out.println(user.toString());
//            req.setAttribute("user", user);
            req.getRequestDispatcher("/views/admin/user/update_user.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
