package com.nhom44.controller.user;

import com.nhom44.bean.User;
import com.nhom44.log.util.page.LogPage;
import com.nhom44.services.ProjectService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = {"/user/history"})
public class HistoryController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        new LogPage(req).log();
        req.setAttribute("page", "account");
        User user= (User) req.getSession().getAttribute("account");
        int sizePage= ProjectService.getInstance().pageSizeHistoryProjectByUserId(user.getId());
        req.setAttribute("sizePage",sizePage);
        req.getRequestDispatcher("/views/user/history.jsp").forward(req, resp);
    }
}
