package com.nhom44.controller.admin.order;

import com.nhom44.bean.Cart;

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
//        if(action != null && action.equals("detail")){
//            req.getRequestDispatcher("/views/admin/order/order_detail.jsp").forward(req,resp);
//            return;
//        }
//        req.getRequestDispatcher("/views/admin/order/contact_order.jsp").forward(req,resp);
            String action = req.getRequestURI();
            if(action.equals("/admin/cart")){
                req.getRequestDispatcher("/views/admin/order/contact_order.jsp").forward(req,resp);
                return;
            }
            if(action.startsWith("/admin/cart/detail")){
                String id = action.substring(action.lastIndexOf("/")+1);
                System.out.println(id);
                if (id == null || id.isEmpty()) {
                    resp.sendRedirect("/admin/cart");
                    return;
                }
                Cart cart = com.nhom44.services.CartService.getInstance().getById(Integer.parseInt(id));
                cart.setServices(com.nhom44.services.CartService.getInstance().getServices(cart.getId()));
                cart.setImages(com.nhom44.services.CartService.getInstance().getImages(cart.getId()));

                req.setAttribute("cart",cart);
                req.getRequestDispatcher("/views/admin/order/order_detail.jsp").forward(req,resp);
                return;
            }
    }
}
