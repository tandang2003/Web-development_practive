package com.nhom44.controller.admin.order;

import com.nhom44.bean.Cart;
import com.nhom44.log.util.page.AdminLogPage;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = {"/admin/cart","/admin/cart/detail/*"})
public class OrderController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        new AdminLogPage(req).log();
            String action = req.getRequestURI();
            if(action.equals("/admin/cart")){
                req.getRequestDispatcher("/views/admin/order/contact_order.jsp").forward(req,resp);
                return;
            }
            if(action.startsWith("/admin/cart/detail")){
                req.getRequestDispatcher("/views/admin/order/order_detail.jsp").forward(req,resp);
                return;
            }
    }
}
