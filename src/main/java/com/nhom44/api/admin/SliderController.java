package com.nhom44.api.admin;

import com.google.gson.Gson;
import com.nhom44.bean.ResponseModel;
import com.nhom44.bean.Slider;
import com.nhom44.services.SliderService;
import com.nhom44.util.Upload;
import com.nhom44.validator.NumberVallidator;
import com.nhom44.validator.SingleValidator;
import com.nhom44.validator.TitleOrNameSingleValidator;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(urlPatterns = {"/api/admin/slider", "/api/admin/slider/add", "/api/admin/slider/edit", "/api/admin/slider/delete"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, maxFileSize = 1024 * 1024 * 50, maxRequestSize = 1024 * 1024 * 50)
public class SliderController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println(req.getParameterMap().keySet());
        System.out.println(req.getRequestURI());
        SingleValidator validator = new TitleOrNameSingleValidator();
        ResponseModel responseModel;
        List<ResponseModel> errors = new ArrayList<>();
        Slider slider = new Slider();
        if (!validator.validator(req.getParameter("title"))) {
            responseModel = new ResponseModel("title", "Vui lòng nhập tên", "400", null);
            errors.add(responseModel);
        }
        validator = new NumberVallidator();
        if (!validator.validator(req.getParameter("sequence"))) {
            responseModel = new ResponseModel("sequence", "Vui lòng nhập số thứ tự", "400", null);
            errors.add(responseModel);
        }
        try {
            BeanUtils.populate(slider, req.getParameterMap());

        } catch (IllegalAccessException | InvocationTargetException e) {
            resp.getWriter().println(new Gson().toJson(new ResponseModel("sys", "Lỗi hệ thống", "500", null)));
        }
        if (req.getParameter("notHave") == null) {
            List<String> uploadFiles = Upload.uploadFile(Upload.UPLOAD_SILDER, "avatar", req);

            if (!uploadFiles.isEmpty()) {
                slider.setAvatar(uploadFiles.get(0));
            } else {
                responseModel = new ResponseModel("avatar", "Vui lòng chọn ảnh", "400", null);
                errors.add(responseModel);
            }
        }else{
          slider.setAvatar( SliderService.getInstance().getById(slider.getId()).getAvatar());
        }
        if (!errors.isEmpty()) {
            resp.setStatus(400);
            resp.getWriter().println(new Gson().toJson(errors));
            return;
        }
        System.out.println(slider.toString());
        int i = Integer.MIN_VALUE;
        if (req.getRequestURI().startsWith("/api/admin/slider/add")) {

            i = SliderService.getInstance().add(slider);
        } else if (req.getRequestURI().startsWith("/api/admin/slider/edit")) {
            System.out.println(slider);
            i = SliderService.getInstance().update(slider);
        }
        System.out.println(i);

        resp.setStatus(200);
        resp.getWriter().println(new Gson().toJson(new ResponseModel("success", "Thành công", "200", "/admin/slide")));
    }
}
