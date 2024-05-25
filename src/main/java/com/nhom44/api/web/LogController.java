package com.nhom44.api.web;

import com.nhom44.bean.Log;
import com.nhom44.bean.User;
import com.nhom44.ip2location.Ip2Location;
import com.nhom44.services.LogServices;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Enumeration;

@WebServlet(urlPatterns = "/api/log")
public class LogController extends HttpServlet {
    private Log log;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String place = req.getParameter("place") == null || req.getParameter("place").equals("") ? "undefined" : req.getParameter("place");
        String ip = req.getRemoteAddr();
        log = new Log();
        log.setIp(ip);
        log.setNational(Ip2Location.getNationality(ip));
        if ((req.getSession().getAttribute("Admin").equals("true"))) {
            adminPageLog(req, place);
        } else {
            if (!place.equals("undefined"))
                logWeb(req, place);
            else {
                like(req);
            }
        }
        System.out.println(log.toString());
//        JDBIConnector.get().withExtension(LogDAO.class, dao -> dao.insert(log));
//        LogServices.getInstance().insert(log);
    }

    private void logWeb(HttpServletRequest req, String place) {
        String id;
        switch (place) {
            case "home":
                log.setLevel(1);
                log.setAddress("/home");
                log.setDescription("User visit home");
                break;
            case "intro":
                log.setLevel(1);
                log.setDescription("User visit intro");
                log.setAddress("/intro");
                break;
            case "contact":
                log.setLevel(1);
                log.setDescription("User visit contact");
                log.setAddress("/contact");
                break;
            case "project":
                log.setLevel(2);
                log.setDescription("User visit projects");
                log.setAddress("/project");
                break;
            case "service":
                log.setLevel(3);
                log.setDescription("User visit services");
                log.setAddress("/service");
                break;
            case "detail-service":
                id = req.getParameter("id").equals("") || req.getParameter("id") == null ? "undefined" : req.getParameter("id");
                if (id.equals("undefined")) {
                    log.setLevel(3);
                    log.setDescription("User visit non exist service id " + id);
                } else {
                    log.setLevel(1);
                    log.setDescription("User visit service id " + id);
                }
                log.setAddress("/service/" + id);
                break;
            case "detail-project":
                System.out.println("detail-project");
                id = req.getParameter("id").equals("") || req.getParameter("id") == null ? "undefined" : req.getParameter("id");
                System.out.println(id);
                if (id.equals("undefined")) {
                    log.setLevel(3);
                    log.setDescription("User visit non exist project id " + id);
                } else {
                    log.setLevel(1);
                    log.setDescription("User visit project id " + id);
                }
                log.setAddress("/project/" + id);
                break;
        }
    }

    private void popularProject(HttpServletRequest req) {
        String id = req.getParameter("id").equals("") || req.getParameter("id") == null ? "undefined" : req.getParameter("id");
        if (id.equals("undefined")) {
            log.setLevel(3);
            log.setDescription("User finding popular project with category but category id: " + id + " not exist");
        } else {
            log.setLevel(1);
            log.setDescription("User finding popular project with category id: " + id);
        }
        log.setAddress("/home/projects/" + id);
    }

    //    private void searching(HttpServletRequest req){
//        String key = req.getParameter("key").equals("") || req.getParameter("key") == null ? "undefined" : req.getParameter("key");
//        if (key.equals("undefined")) {
//            log.setLevel(3);
//            log.setDescription("User searching with key but key: " + key+" not exist");
//        } else {
//            log.setLevel(1);
//            log.setDescription("User searching with key: " + key);
//        }
//        log.setAddress("/home/search/" + key);
//    }
    private void like(HttpServletRequest req) {
        String error = req.getParameter("error") == null || req.getParameter("error").equals("true") ? "undefined" : req.getParameter("error");
        if (error.equals("undefined")) {
            log.setLevel(3);
            log.setDescription("User like project but id none exists or user is not login");
        } else {
            String id = req.getParameter("id") == null || req.getParameter("id").equals("") ? "undefined" : req.getParameter("id");
            String isLike = req.getParameter("isLike") == null || req.getParameter("isLike").equals("") ? "undefined" : req.getParameter("isLike");
            if (id.equals("undefined") || isLike.equals("undefined")) {
                log.setLevel(3);
                log.setDescription("User like project not have enough data");
            } else {
                if (isLike.equals("true")) {
                    log.setLevel(2);
                    log.setDescription("User like project id: " + id);
                } else {
                    log.setLevel(2);
                    log.setDescription("User dislike project id: " + id);
                }
            }
        }
        log.setAddress("/save_project/" + req.getParameter("id"));
    }

    private void adminPageLog(HttpServletRequest req, String place) {
        String id;
        switch (place) {
            case "dashboard":
                log.setLevel(1);
                log.setAddress("/home");
                log.setDescription("User visit home");
                break;
            case "user":
                log.setLevel(1);
                log.setDescription("User visit intro");
                log.setAddress("/intro");
                break;
            case "contact":
                log.setLevel(1);
                log.setDescription("User visit contact");
                log.setAddress("/contact");
                break;
            case "project":
                log.setLevel(2);
                log.setDescription("User visit projects");
                log.setAddress("/project");
                break;
            case "service":
                log.setLevel(3);
                log.setDescription("User visit services");
                log.setAddress("/service");
                break;
            case "detail-service":
                id = req.getParameter("id").equals("") || req.getParameter("id") == null ? "undefined" : req.getParameter("id");
                if (id.equals("undefined")) {
                    log.setLevel(3);
                    log.setDescription("User visit non exist service id " + id);
                } else {
                    log.setLevel(1);
                    log.setDescription("User visit service id " + id);
                }
                log.setAddress("/service/" + id);
                break;
            case "detail-project":
                System.out.println("detail-project");
                id = req.getParameter("id").equals("") || req.getParameter("id") == null ? "undefined" : req.getParameter("id");
                System.out.println(id);
                if (id.equals("undefined")) {
                    log.setLevel(3);
                    log.setDescription("User visit non exist project id " + id);
                } else {
                    log.setLevel(1);
                    log.setDescription("User visit project id " + id);
                }
                log.setAddress("/project/" + id);
                break;
        }
    }
}
