package com.nhom44.controller.cart;

import com.nhom44.bean.*;
import com.nhom44.services.CategoryService;
import com.nhom44.services.ProvinceService;
import com.nhom44.services.ServiceOfProjectService;
import com.nhom44.validator.EmailSingleValidator;
import com.nhom44.validator.NumberVallidator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(urlPatterns = "/session/cart")
public class CartSessionController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Cart cart = null;
        if(session.getAttribute("cart") != null) {
            cart = (Cart) session.getAttribute("cart");}
        else {
            cart = new Cart();
        }
        String name = req.getParameter("name");
        System.out.println("name: " + name);
        String value = req.getParameter("value");
        System.out.println("value: " + value);
        switch (name) {
            case "email": {
                System.out.println("email: " + value);
                if (new EmailSingleValidator().validator(value)) cart.setEmail(value);
                break;
            }
            case "category": {
                System.out.println("categoryId: " + value);
                if (new NumberVallidator().validator(value)) cart.setCategoryId(Integer.parseInt(value));
                break;
            }
            case "address": {
                System.out.println("provinceId: " + value);
                if (new NumberVallidator().validator(value)) cart.setProvinceId(Integer.parseInt(value));
                break;
            }
            case "representProjectId": {
                System.out.println("representProjectId: " + value);
                if (new NumberVallidator().validator(value)) cart.setRepresentProjectId(Integer.parseInt(value));
                break;
            }
            case "width": {
                System.out.println("width: " + value);
                if (new NumberVallidator().validator(value)) cart.setWidth(Double.parseDouble(value));
                break;
            }
            case "height": {
                System.out.println("height: " + value);
                if (new NumberVallidator().validator(value))  cart.setHeight(Double.parseDouble(value));
                break;
            }
            case "services": {
                System.out.println("services: " + value);
                List<Integer> services = new ArrayList<>();
                String[] serviceIds = value.split(",");
                for (String serviceId : serviceIds) {
                    if (new NumberVallidator().validator(serviceId)) services.add(Integer.parseInt(serviceId));
                }
                cart.setServices(services);
                break;
            }
        }
        System.out.println(cart.toString());
        session.setAttribute("cart", cart);
    }
}
