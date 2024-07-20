package com.nhom44.api.admin;

import com.google.api.client.json.Json;
import com.google.gson.JsonObject;
import com.nhom44.bean.*;
import com.nhom44.services.CartService;
import com.nhom44.services.CategoryService;
import com.nhom44.services.ServiceOfProjectService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import static com.nhom44.util.GsonUtil.getGson;

@WebServlet(urlPatterns = {"/api/admin/cart", "/api/admin/cart/detail/*"})
public class CartController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String url = req.getServletPath();
        if(url.equals("/api/admin/cart/detail")) {
            String id = req.getPathInfo().trim().substring(1);
            if (id == null) {
                resp.sendRedirect("/404");
                return;
            }
            JsonObject jsonObject = new JsonObject();
            jsonObject.addProperty("status", 200);
            Cart cart = CartService.getInstance().getById(Integer.parseInt(id));
            jsonObject.add("cart", getGson().toJsonTree(cart));
            List<Service> services = ServiceOfProjectService.getInstance().getAll();
            jsonObject.add("services", getGson().toJsonTree(services));
            List<Category> categories = CategoryService.getInstance().getAll();
            List<Integer>selectedService= CartService.getInstance().getServices(cart.getId());
            jsonObject.add("selectedService", getGson().toJsonTree(selectedService));
            jsonObject.add("categories", getGson().toJsonTree(categories));
            Address address = com.nhom44.services.AddressService.getInstance().getAddressById(cart.getAddressId());
            jsonObject.add("address", getGson().toJsonTree(address));
            List<String> image=CartService.getInstance().getImageNames(cart.getId());
            jsonObject.add("images", getGson().toJsonTree(image));
            resp.getWriter().println(jsonObject.toString());
            resp.getWriter().flush();
            return;
        }
        List<Cart> carts = CartService.getInstance().getAll();
        String json = new com.google.gson.Gson().toJson(carts);
        System.out.println(json);
        java.io.PrintWriter printWriter = resp.getWriter();
        printWriter.print(json);
        printWriter.flush();
        printWriter.close();
    }
}
