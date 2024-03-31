package com.nhom44.api.auth;

import com.google.gson.Gson;
import com.nhom44.bean.District;
import com.nhom44.bean.Province;
import com.nhom44.bean.ResponseModel;
import com.nhom44.bean.Ward;
import com.nhom44.services.DistrictService;
import com.nhom44.services.ProvinceService;
import com.nhom44.services.WardService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = {"/api/province/", "/api/ward/*", "/api/district/*"})
public class LoginDataSetUp extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String path =  req.getRequestURI().substring(req.getContextPath().length());
        String info = req.getPathInfo();

        switch (path) {
            case "/province/":
                List<Province> provinces = ProvinceService.getInstance().getAll();
                resp.getWriter().println(new Gson().toJson(provinces));
                resp.getWriter().flush();
                resp.getWriter().close();
                break;
            case "/provinces/district/":
                List<District> district = DistrictService.getInstance().getAll();
                if (req.getParameter("province_id") != null) {
                    int province_id = Integer.parseInt(req.getParameter("province_id"));
                    district = DistrictService.getInstance().getByProvinceId(province_id);
                }
                resp.getWriter().println(new Gson().toJson(district));
                resp.getWriter().flush();
                resp.getWriter().close();
                break;
            case "/provinces/district/ward/":
                List<Ward> ward = WardService.getInstance().getAll();
                if (req.getParameter("district_id") != null) {
                    int district_id = Integer.parseInt(req.getParameter("district_id"));
                    ward = DistrictService.getInstance().getWardByDistrictId(district_id);
                }
                resp.getWriter().println(new Gson().toJson(ward));
                resp.getWriter().flush();
                resp.getWriter().close();
                break;
            default:
                resp.setStatus(404);
                resp.getWriter().println(new Gson().toJson(new ResponseModel()));
                resp.getWriter().flush();
                resp.getWriter().close();
                break;
        }
//        System.out.println("province");
//        if (req.getRequestURI().startsWith("/api/province")) {
//            System.out.println("province");
//            resp.getWriter().println(new Gson().toJson(ProjectService.getInstance().getAllProject()));
//            resp.getWriter().flush();
//            resp.getWriter().close();
//            return;
//        }
//        if (req.getRequestURI().startsWith("/api/province/.../ward")) {
//
//            System.out.println("ward");
//            resp.getWriter().println(new Gson().toJson(ProjectService.getInstance().getAllProject()));
//            resp.getWriter().flush();
//            resp.getWriter().close();
//            return;
//        }
//        if (req.getRequestURI().startsWith("/api/district")) {
//            System.out.println("district");
//            resp.getWriter().println(new Gson().toJson(ProjectService.getInstance().getAllProject()));
//            resp.getWriter().flush();
//            resp.getWriter().close();
//            return;
//        }
    }
}
