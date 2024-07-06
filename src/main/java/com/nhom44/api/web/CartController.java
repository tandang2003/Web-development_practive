package com.nhom44.api.web;

import com.google.gson.Gson;
import com.nhom44.bean.*;
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
import java.util.List;
import java.util.Map;

@WebServlet(urlPatterns = {"/api/cart", "/api/cart/update"})
@MultipartConfig(
        maxFileSize = 1024 * 1024 * 10,
        maxRequestSize = 1024 * 1024 * 10 * 5,
        fileSizeThreshold = 1024 * 1024 * 10)
public class CartController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        System.out.println(req.getParameter("serviceValue"));

        req.getParameterMap().keySet().forEach(key -> {
            System.out.println(key + ": " + req.getParameter(key));
        });
        System.out.println("--------------------------");


//        HttpSession session = req.getSession();
//        Cart cart = null;
//        List<ResponseModel> listResp = new ArrayList<>();
//        ResponseModel responseModel = null;
//        SingleValidator singleValidator = new EmailSingleValidator();
//        if (session.getAttribute("cart") != null) {
//            cart = (Cart) session.getAttribute("cart");
//            if (ProjectService.getInstance().getById(cart.getRepresentProjectId()) == null) {
//                resp.setStatus(400);
//                responseModel = new ResponseModel();
//                responseModel.setMessage("dự án mẫu không tồn tại");
//                responseModel.setData(null);
//                responseModel.setName("representProjectId");
//                listResp.add(responseModel);
//            }
//
//        } else
//        {
//
//            cart = new Cart();
//            String email = req.getParameter("email");
//            if (!singleValidator.validator(email)) {
//                resp.setStatus(400);
//                responseModel = new ResponseModel();
//                responseModel.setMessage("vui lòng nhập email");
//                responseModel.setData(null);
//                responseModel.setName("email");
//                listResp.add(responseModel);
//            } else {
//                cart.setEmail(email);
//            }
//            singleValidator = new NumberVallidator();
//            String categoryId = req.getParameter("category");
//            if (!singleValidator.validator(categoryId)) {
//                resp.setStatus(400);
//                responseModel = new ResponseModel();
//                responseModel.setMessage("vui lòng chọn loại hình dự án");
//                responseModel.setData(null);
//                responseModel.setName("category");
//                listResp.add(responseModel);
//            } else {
//                cart.setCategoryId(Integer.parseInt(categoryId));
//            }
//            String provinceId = req.getParameter("address");
//            if (!singleValidator.validator(provinceId)) {
//                resp.setStatus(400);
//                responseModel = new ResponseModel();
//                responseModel.setMessage("vui lòng chọn tỉnh thành");
//                responseModel.setData(null);
//                responseModel.setName("address");
//                listResp.add(responseModel);
//            } else {
//                cart.setProvinceId(Integer.parseInt(provinceId));
//            }
//            String representProjectId = req.getParameter("representProjectId");
//            Project project;
//            if (!singleValidator.validator(representProjectId)) {
//                resp.setStatus(400);
//                responseModel = new ResponseModel();
//                responseModel.setMessage("vui lòng chọn dự án mẫu");
//                responseModel.setData(null);
//                responseModel.setName("itProject");
//                listResp.add(responseModel);
//            } else if ((project = ProjectService.getInstance().getById(Integer.parseInt(representProjectId))) == null) {
//                System.out.println(project);
//                resp.setStatus(400);
//                responseModel = new ResponseModel();
//                responseModel.setMessage("dự án mẫu không tồn tại");
//                responseModel.setData(null);
//                responseModel.setName("itProject");
//                listResp.add(responseModel);
//            } else {
//                System.out.println(project);
//                cart.setRepresentProjectId(Integer.parseInt(representProjectId));
//
//            }
//            String width = req.getParameter("width");
//            if (!singleValidator.validator(width)) {
//                resp.setStatus(400);
//                responseModel = new ResponseModel();
//                responseModel.setMessage("vui lòng nhập chiều rộng");
//                responseModel.setData(null);
//                responseModel.setName("width");
//                listResp.add(responseModel);
//            } else {
//                cart.setWidth(Double.parseDouble(width));
//            }
//            String height = req.getParameter("height");
//            if (!singleValidator.validator(height)) {
//                resp.setStatus(400);
//                responseModel = new ResponseModel();
//                responseModel.setMessage("vui lòng nhập chiều dài");
//                responseModel.setData(null);
//                responseModel.setName("height");
//                listResp.add(responseModel);
//            } else {
//                cart.setHeight(Double.parseDouble(height));
//            }
//            String services = req.getParameter("services");
//
//            if (services == null || services.isEmpty()) {
//                resp.setStatus(400);
//                responseModel = new ResponseModel();
//                responseModel.setMessage("vui lòng chọn dịch vụ");
//                responseModel.setData(null);
//                responseModel.setName("services");
//                listResp.add(responseModel);
//            } else {
//                String[] arrservices = services.split(",");
//                List<Integer> serviceIds = new ArrayList<>();
//                singleValidator = new NumberVallidator();
//                for (String serviceId : arrservices) {
//                    System.out.println("serviceId: "+serviceId);
//                    if (singleValidator.validator(serviceId)) serviceIds.add(Integer.parseInt(serviceId));
//                }
//                cart.setServices(serviceIds);
//            }
//        }
//        if (!listResp.isEmpty()) {
//            String json = new Gson().toJson(listResp);
//            resp.setStatus(400);
//            PrintWriter writer = resp.getWriter();
//            writer.println(json);
//            writer.flush();
//            writer.close();
//            return;
//        }
//        cart = CartService.getInstance().add(cart);
//        System.out.println(cart.getServices().toString());
//        for (int serviceId : cart.getServices()) {
//            CartService.getInstance().addService(cart.getId(), serviceId);
//        }
//        System.out.println(cart);
//        List<String> image = Upload.uploadFile(Upload.UPLOAD_CART + "\\" + cart.getId() + "_" + cart.getEmail(), "image", req);
//        cart.setImages(image);
//        for (String s : image
//        ) {
//            Image img = StringUtil.getImage(s);
//            int imageId = ImageService.getInstance().add(img);
//            CartService.getInstance().addImage(cart.getId(), imageId);
//        }
//        //gửi mail xác nhận
//        resp.setStatus(200);
//
//        responseModel = new ResponseModel();
//        responseModel.setMessage("Yêu cầu của bạn đã gửi thành công vui đợi kiểm tra email và xác nhận yêu cầu");
//        responseModel.setName("success");
//        listResp.add(responseModel);
//        VerifyService.getInstance().insertVerifyCart(StringUtil.hashPassword(cart.getId() + cart.getEmail()), cart.getId());
//        MailService.getInstance().sendMailToNotiFyCart(req.getServerName(), StringUtil.hashPassword(cart.getId() + cart.getEmail()), cart);
//        session.setAttribute("cart", null);
//        String json = new Gson().toJson(listResp);
//        PrintWriter writer = resp.getWriter();
//        writer.println(json);
//        writer.flush();
//        writer.close();
    }

    private Cart createOrder(Map<String, String[]> map) {
        Cart result = null;
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
                    result.setProvinceId(Integer.parseInt(value[0]));
                    break;
                }
                case "project": {
                    result.setRepresentProjectId(Integer.parseInt(value[0]));
                    break;
                }
                case "width": {
                    result.setWidth(Double.parseDouble(value[0]));
                    break;
                }
                case "height": {
                    result.setHeight(Double.parseDouble(value[0]));
                    break;
                }
                case "serviceValue": {
                    List<Integer> services = new ArrayList<>();
                    String[] serviceIds = value[0].split(",");
                    for (String serviceId : serviceIds) {
                        services.add(Integer.parseInt(serviceId));
                    }
                    result.setServices(services);
                    break;
                }
                case "uploadImg": {
                    if(value[0].equals("")) return;
                    String[] img = value[0].split(",");
                    for (String s : img) {
                        Image i = StringUtil.getImage(s);
                        int imageId = ImageService.getInstance().add(i);
                        CartService.getInstance().addImage(result.getId(), imageId);
                    }
                    break;
                }
            }
        });

        return result;
    }
}
