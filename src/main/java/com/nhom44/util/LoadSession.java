package com.nhom44.util;

import com.nhom44.bean.Category;
import com.nhom44.bean.Province;
import com.nhom44.bean.Service;
import com.nhom44.services.CategoryService;
import com.nhom44.services.ProvinceService;
import com.nhom44.services.ServiceOfProjectService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashSet;
import java.util.List;

public class LoadSession {
    public static void loadSession(HttpServletRequest req) {
        HttpSession session = req.getSession();
        if (session.getAttribute("services") == null) {
            List<Service> services = ServiceOfProjectService.getInstance().getAllActive();
            session.setAttribute("services", services);
        } else {
            List<Service> services = (List<Service>) session.getAttribute("services");
            List<Service> services1 = ServiceOfProjectService.getInstance().getAllActive();
            if (!new HashSet<>(services1).containsAll(services)) {
                session.setAttribute("services", services1);
            }
        }
        if (session.getAttribute("categories") == null) {
            List<Category> categories = CategoryService.getInstance().getAllActive();
            session.setAttribute("categories", categories);
        } else {
            List<Category> categories = (List<Category>) session.getAttribute("categories");
            List<Category> categories1 = CategoryService.getInstance().getAllActive();
            if (!new HashSet<>(categories1).containsAll(categories)) {
                session.setAttribute("categories", categories1);
            }
        }
        if (session.getAttribute("provinces") == null) {
            List<Province> provinces = ProvinceService.getInstance().getAll();
            session.setAttribute("provinces", provinces);
        } else {
            List<Province> provinces = (List<Province>) session.getAttribute("provinces");
            List<Province> provinces1 = ProvinceService.getInstance().getAll();
            if (!new HashSet<>(provinces1).containsAll(provinces)) {
                session.setAttribute("provinces", provinces1);
            }
        }
    }
}
