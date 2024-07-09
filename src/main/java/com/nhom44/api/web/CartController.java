package com.nhom44.api.web;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.nhom44.bean.*;
import com.nhom44.log.util.function.OrderLog;
import com.nhom44.services.*;
import com.nhom44.util.StringUtil;
import com.nhom44.util.Upload;
import com.nhom44.validator.EmailSingleValidator;
import com.nhom44.validator.NumberVallidator;
import com.nhom44.validator.SingleValidator;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

@WebServlet(urlPatterns = {"/api/cart/data", "/api/cart/update", "/api/cart/submit"})
public class CartController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setStatus(200);
        System.out.println(req.getSession().getAttribute("cart"));
        System.out.println(req.getSession().getAttribute("cart"));
        if (req.getSession().getAttribute("cart") != null) {
            int id = (int) req.getSession().getAttribute("cart");
            Cart cart = CartService.getInstance().getById(id);
            System.out.println(cart.toString());
            if (cart != null) {
                cart.getAddress().setId(cart.getAddressId());
                AddressService.getInstance().getData(cart.getAddress());
                cart.setImages(CartService.getInstance().getImageNames(cart.getId()));
                JsonObject jsonObject = new JsonObject();
                jsonObject.addProperty("data", new Gson().toJson(cart));
                jsonObject.addProperty("status", 200);
                PrintWriter writer = resp.getWriter();
                writer.println(jsonObject.toString());
                writer.flush();
                writer.close();
            }
        } else {
            PrintWriter writer = resp.getWriter();
            JsonObject jsonObject = new JsonObject();
            jsonObject.addProperty("data", "Không tồn tại dữ liệu có sẵn");
            jsonObject.addProperty("status", 400);
            writer.println(jsonObject.toString());
            writer.flush();
            writer.close();
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        System.out.println(req.getParameter("serviceValue"));
        String url = req.getServletPath();
        switch (url) {
            case "/api/cart/update":
                String email = req.getParameter("email");
                SingleValidator validator = new EmailSingleValidator();
                int id = CartService.getInstance().checkingUnSent(email);
                Cart order = null;
                if (id != 0) {
                    order = createOrder(req.getParameterMap(), CartService.getInstance().getById(id));
                    Object orderCase = req.getSession().getAttribute("cart");
                    if (orderCase != null && (int) orderCase != id) {
                        OrderLog orderLog = new OrderLog(req, order);
                        orderLog.deleteLog();
                        CartService.getInstance().delete(Integer.parseInt((String) orderCase));
                    }
                    OrderLog orderLog = new OrderLog(req, order);
                    orderLog.setPreValue();
                    CartService.getInstance().update(order);
                    orderLog.setPostValue();
                    orderLog.updateLog();
                } else {
                    order = createOrder(req.getParameterMap(), null);
                    id = CartService.getInstance().add(order);
                    order.setId(id);
                    OrderLog orderLog = new OrderLog(req, order);
                    orderLog.createLog();
                }
                req.getSession().setAttribute("cart", id);
                break;
            case "/api/cart/submit": {
                String email1 = req.getParameter("email");
                SingleValidator validator1 = new EmailSingleValidator();
                if (!validator1.validator(email1)) {
                    OrderLog orderLog = new OrderLog(req, null);
                    orderLog.failLog();
                    JsonObject jsonObject = new JsonObject();
                    jsonObject.addProperty("status", 400);
                    jsonObject.addProperty("message", "Vui lòng nhập email");
                    PrintWriter writer = resp.getWriter();
                    writer.println(jsonObject.toString());
                    writer.flush();
                    writer.close();
                    return;
                }
                int id1 = req.getSession().getAttribute("cart") == null ? 0 : (int) req.getSession().getAttribute("cart");
                if (id1 == 0) {
                    OrderLog orderLog = new OrderLog(req, null);
                    orderLog.failLog();
                    JsonObject jsonObject = new JsonObject();
                    jsonObject.addProperty("status", 400);
                    jsonObject.addProperty("message", "Vui lòng nhập thông tin đơn hàng");
                    PrintWriter writer = resp.getWriter();
                    writer.println(jsonObject.toString());
                    writer.flush();
                    writer.close();
                    return;
                }
                Cart order1 = CartService.getInstance().getById(id1);
                order1 = createOrder(req.getParameterMap(), order1);
                OrderLog orderLog = new OrderLog(req, order1);
                orderLog.setPreValue();
                CartService.getInstance().update(order1);
                orderLog.setPostValue();
                orderLog.successLog();
                //gửi mail xác nhận
                resp.setStatus(200);
                VerifyService.getInstance().insertVerifyCart(StringUtil.hashPassword(order1.getId() + order1.getEmail()), order1.getId());
                CartService.getInstance().setCheckingIsSend(order1.getId());
                AddressService.getInstance().getAddressFullName(order1.getAddress());
                MailService.getInstance().sendMailToNotiFyCart(req.getServerName(), StringUtil.hashPassword(order1.getId() + order1.getEmail()), order1);
                req.getSession().removeAttribute("cart");
                JsonObject jsonObject = new JsonObject();
                jsonObject.addProperty("status", 200);
                jsonObject.addProperty("message", "Yêu cầu của bạn đã gửi thành công vui đợi kiểm tra email và xác nhận yêu cầu");
                PrintWriter writer = resp.getWriter();
                writer.println(jsonObject.toString());
                writer.flush();
                writer.close();
                break;
            }
        }

    }

    private Cart createOrder(Map<String, String[]> map, Cart order) {
        if (order == null) order = new Cart();
        Cart result = order;
        map.entrySet().forEach(entry -> {
            String key = entry.getKey();
            String[] value = entry.getValue();
            switch (key) {
                case "email": {
                    result.setEmail(value[0]);
                    break;
                }
                case "category": {
                    result.setCategoryId(Integer.parseInt(value[0]));
                    break;
                }
                case "province": {
                    result.getAddress().setProvinceId(Integer.parseInt(value[0]));
                    break;
                }
                case "district": {
                    result.getAddress().setDistrictId(Integer.parseInt(value[0]));
                    break;
                }
                case "ward": {
                    result.getAddress().setWardId(Integer.parseInt(value[0]));
                    break;
                }
                case "project": {
                    if (value[0].isEmpty()) return;
                    result.setRepresentProjectId(Integer.parseInt(value[0]));
                    break;
                }
                case "width": {
                    if (value[0].isEmpty()) return;
                    result.setWidth(Double.parseDouble(value[0]));
                    break;
                }
                case "height": {
                    if (value[0].isEmpty()) return;
                    result.setHeight(Double.parseDouble(value[0]));
                    break;
                }
                case "serviceValue": {
                    List<Integer> services = new ArrayList<>();
                    if (value[0].isEmpty()) return;
                    String[] serviceIds = value[0].split(",");
                    for (String serviceId : serviceIds) {
                        services.add(Integer.parseInt(serviceId.trim()));
                    }
                    result.setServices(services);
                    break;
                }
                case "uploadImg": {
                    if (value[0].equals("")) return;
                    String[] img = value[0].split(",");
                    List<String> images = new ArrayList<>();
                    for (String s : img) {
                        images.add(s);
                    }
                    result.setImages(images);
                    break;
                }
            }
        });

        return result;
    }
}
