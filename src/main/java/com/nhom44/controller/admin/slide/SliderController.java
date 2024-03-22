package com.nhom44.controller.admin.slide;

import com.nhom44.services.SliderService;
import com.nhom44.validator.NumberVallidator;
import com.nhom44.validator.SingleValidator;
import com.nhom44.validator.TitleOrNameSingleValidator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.validation.Validator;
import java.io.IOException;

@WebServlet(urlPatterns = {"/admin/slide", "/admin/slide/add", "/admin/slide/edit", "/admin/slide/delete"})
public class SliderController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String url = req.getRequestURI();
        System.out.println(url);
        if (url.startsWith("/admin/slide/add")) {
            req.getRequestDispatcher("/views/admin/slide/slide_add.jsp").forward(req, resp);
            return;
        } else if (url.startsWith("/admin/slide/edit")) {
            System.out.println(req.getParameter("id"));
            SingleValidator validator = new NumberVallidator();
            if (!validator.validator(req.getParameter("id"))) {
                //error

                resp.sendRedirect("/404");
                return;
            }
            req.setAttribute("slider", SliderService.getInstance().getById(Integer.parseInt(req.getParameter("id"))));
            req.getRequestDispatcher("/views/admin/slide/slide_edit.jsp").forward(req, resp);
            return;
        } else if (url.startsWith("/admin/slide/delete")) {
            System.out.println(req.getParameter("id"));
            SingleValidator validator = new NumberVallidator();
            if (!validator.validator(req.getParameter("id"))) {
                //error

                resp.sendRedirect("/404");
                return;
            }
            SliderService.getInstance().delete(Integer.parseInt(req.getParameter("id")));
            resp.sendRedirect("/admin/slide");
            return;
        }
        req.setAttribute("sliders", SliderService.getInstance().getAll());
        req.getRequestDispatcher("/views/admin/slide/slide_manage.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
