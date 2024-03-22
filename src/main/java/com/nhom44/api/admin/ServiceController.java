package com.nhom44.api.admin;

import com.google.gson.Gson;
import com.nhom44.bean.ResponseModel;
import com.nhom44.bean.Service;
import com.nhom44.services.ServiceOfProjectService;
import com.nhom44.util.Upload;
import com.nhom44.validator.DescriptionSingleValidator;
import com.nhom44.validator.SingleValidator;
import com.nhom44.validator.TitleOrNameSingleValidator;
import org.apache.commons.beanutils.BeanUtils;
import org.jdbi.v3.core.statement.UnableToExecuteStatementException;

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

@WebServlet(urlPatterns = "/api/admin/service")
@MultipartConfig(
        maxFileSize = 1024 * 1024 * 10,
        maxRequestSize = 1024 * 1024 * 10 * 5,
        fileSizeThreshold = 1024 * 1024 * 10)
public class ServiceController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action") != null ? req.getParameter("action") : "#";
        System.out.println(req.getParameterMap().keySet().toString());
        SingleValidator validator = new TitleOrNameSingleValidator();
        List<ResponseModel> errList = new ArrayList<>();
        ResponseModel errModel;
        boolean isErr = false;
        if (!validator.validator(req.getParameter("name"))) {
            resp.setStatus(400);
            errModel = new ResponseModel();
            errModel.setName("name");
            errModel.setMessage("Tên dịch vụ không hợp lệ");
            errList.add(errModel);
            isErr = true;
        }
        validator = new DescriptionSingleValidator();
        if (!validator.validator(req.getParameter("description"))) {
            resp.setStatus(400);
            errModel = new ResponseModel();
            errModel.setName("description");
            errModel.setMessage("Mô tả không hợp lệ");
            errList.add(errModel);
            isErr = true;
        }
        if (isErr) {
            resp.setStatus(400);
            resp.getWriter().print(new Gson().toJson(errList));
            resp.getWriter().flush();
            return;
        }

        Service service = new Service();
        try {
            BeanUtils.populate(service, req.getParameterMap());
            System.out.println(service.toString());
            if (action.equalsIgnoreCase("add")) {
                List<String> images = Upload.uploadFile(Upload.UPLOAD_AVATAR_SERVICE, "avatar", req);
                if (images.size() > 0) {
                    service.setAvatar(images.get(0));
                } else {
                    resp.setStatus(400);
                    errModel = new ResponseModel();
                    errModel.setName("avatar");
                    errModel.setMessage("Vui lòng chọn ảnh cho dịch vụ");
                    errList.add(errModel);
                    resp.getWriter().print(new Gson().toJson(errList));
                    resp.getWriter().flush();
                }
                int i = ServiceOfProjectService.getInstance().add(service);
                if (i == -1) {
                    resp.setStatus(400);
                    errModel = new ResponseModel();
                    errModel.setName("name");
                    errModel.setMessage("dịch vụ đã tồn tại");
                    errList.add(errModel);
                    resp.getWriter().print(new Gson().toJson(errList));
                    resp.getWriter().flush();
                    return;
                }
            } else if (action.equals("edit")) {
                if (req.getParameter("notHave") == null) {
                    List<String> images = Upload.uploadFile(Upload.UPLOAD_AVATAR_SERVICE, "avatar", req);
                    if (images.size() != 0) {
                        service.setAvatar(images.get(0));
                    } else {
                        //error
                    }
                }else{
                    service.setAvatar(ServiceOfProjectService.getInstance().getById(service.getId()).getAvatar());
                }
                int i = ServiceOfProjectService.getInstance().update(service);

//            } else if (action.equals("delete")) {
//                int id = Integer.parseInt(req.getParameter("id"));
//                ServiceOfProjectService.getInstance().delete(id);
            }
        } catch (IllegalAccessException | UnableToExecuteStatementException | InvocationTargetException e) {
            resp.setStatus(200);
            errModel = new ResponseModel();
            errModel.setName("sys");
            errModel.setMessage("Lỗi hệ thống");
            errList.add(errModel);
            resp.getWriter().print(new Gson().toJson(errList));
            resp.getWriter().flush();
            return;
        }
        resp.setStatus(200);
        errModel = new ResponseModel();
        errModel.setName("success");
        errModel.setMessage("Thành công");
        errModel.setData("/admin/service");
        resp.getWriter().print(new Gson().toJson(errModel));
        resp.getWriter().flush();
    }
}