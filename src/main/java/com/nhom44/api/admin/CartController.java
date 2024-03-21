package com.nhom44.api.admin;

import com.nhom44.bean.Cart;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = {"/api/admin/cart"})
public class CartController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Cart> carts = com.nhom44.services.CartService.getInstance().getAll();
        String json = new com.google.gson.Gson().toJson(carts);
        System.out.println(json);
        java.io.PrintWriter printWriter = resp.getWriter();
        printWriter.print(json);
        printWriter.flush();
        printWriter.close();
    }
}
