package com.nhom44.api.admin;

import com.google.gson.Gson;
import com.nhom44.log.model.Log;
import com.nhom44.services.LogsService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.stream.Collectors;

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

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String path = req.getServletPath();
        if (path.equals("/api/admin/logs/delete")) {
            LogsService logsService = LogsService.getInstance();

            // Read the request body to get the list of IDs to delete
            BufferedReader reader = req.getReader();
            String requestBody = reader.lines().collect(Collectors.joining());
            Gson gson = new Gson();
            int[] ids = gson.fromJson(requestBody, int[].class);

            boolean success = logsService.deleteLogs(ids);

            resp.setContentType("application/json");
            PrintWriter printWriter = resp.getWriter();

            if (success) {
                printWriter.println("{\"status\": \"success\"}");
            } else {
                resp.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                printWriter.println("{\"status\": \"error\", \"message\": \"Failed to delete logs.\"}");
            }

            printWriter.flush();
            printWriter.close();
        }
    }
}
