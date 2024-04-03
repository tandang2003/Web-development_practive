package com.nhom44.api.web;

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

@WebServlet(urlPatterns = {"/api/province", "/api/ward/*", "/api/district/*"})
public class AddressLocateData extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String path = req.getRequestURI();
        System.out.println(path);
        if (path.startsWith("/api/province")) {
            List<Province> provinces = ProvinceService.getInstance().getAll();
            resp.getWriter().println(new Gson().toJson(provinces));
            resp.setStatus(200);
        } else if (path.startsWith("/api/district/")) {
            String[] parts = path.split("/");
            if (parts.length >= 4) {
                String provinceId = parts[3];
                List<District> districts = DistrictService.getInstance().getDistrictByProvinceId(Integer.parseInt(provinceId));
                resp.getWriter().println(new Gson().toJson(districts));
                resp.setStatus(200);
            } else {
                resp.setStatus(400);
                resp.getWriter().println(new Gson().toJson(new ResponseModel()));
            }
        } else if (path.startsWith("/api/ward")) {
            String[] parts = path.split("/");
            if (parts.length >= 4) {
                String districtId = parts[3];
                List<Ward> wards = WardService.getInstance().getWardByDistrictId(Integer.parseInt(districtId));
                resp.getWriter().println(new Gson().toJson(wards));
                resp.setStatus(200);
            } else {
                resp.setStatus(400);
                resp.getWriter().println(new Gson().toJson(new ResponseModel()));
            }
        } else {
            resp.setStatus(404);
            resp.getWriter().println(new Gson().toJson(new ResponseModel()));
        }
        resp.getWriter().flush();
        resp.getWriter().close();
    }

}
