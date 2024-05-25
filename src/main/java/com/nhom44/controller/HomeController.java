package com.nhom44.controller;

import com.nhom44.bean.Category;
import com.nhom44.bean.Province;
import com.nhom44.bean.Service;
import com.nhom44.bean.Slider;
import com.nhom44.log.model.Log;
import com.nhom44.log.model.LogContext;
import com.nhom44.log.util.web.page.HomeLog;
import com.nhom44.services.*;
import com.nhom44.util.LoadSession;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/home")
public class HomeController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        List<Slider> sliders = SliderService.getInstance().getAllActive();
//        req.setAttribute("sliders", sliders);
//        LoadSession.loadSession(req);
       new HomeLog().log(req);
        RequestDispatcher rd = req.getRequestDispatcher("/views/public/home.jsp");
        rd.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
