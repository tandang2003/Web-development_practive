package com.nhom44.api.web;

import com.nhom44.bean.Log;
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
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        Enumeration e = req.getHeaderNames();
//        while (e.hasMoreElements()) {
//            String headerName = (String) e.nextElement();
//            String headerValue = req.getHeader(headerName);
//            System.out.print("<b>"+headerName + "</b>: ");
//            System.out.println(headerValue + "<br>");
//        }
        String id;
        String place = req.getParameter("place").equals("") || req.getParameter("place") == null ? "undefined" : req.getParameter("place");
        System.out.println(place);
        String ip = req.getRemoteAddr();
        Log log = new Log();
        log.setIp(ip);
        log.setNational(Ip2Location.getNationality(ip));
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
        System.out.println(log.toString());
//        JDBIConnector.get().withExtension(LogDAO.class, dao -> dao.insert(log));
        LogServices.getInstance().insert(log);
    }
}
