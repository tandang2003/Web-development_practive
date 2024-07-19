package com.nhom44.api.admin;

import com.google.gson.Gson;
import com.nhom44.log.model.Log;
import com.nhom44.services.LogsService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(urlPatterns = {"/api/admin/logs", "/api/admin/logs/delete"})
public class LogsController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String path = req.getServletPath();
        if (path.equals("/api/admin/logs")) {
            LogsService logsService = LogsService.getInstance();
            List<Log> logs = logsService.getAllLogs();
            PrintWriter printWriter = resp.getWriter();
            Gson gson = new Gson();
            String json = gson.toJson(logs);
            printWriter.println(json);
            printWriter.flush();
            printWriter.close();
        }
    }
}
