package com.nhom44.api.admin;

import com.google.gson.Gson;
import com.nhom44.bean.Contact;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(urlPatterns = {"/api/admin/contact"})
public class ContactController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Contact> contacts = com.nhom44.services.ContactService.getInstance().getAll();
        String json = new Gson().toJson(contacts);
        System.out.println(json);
        PrintWriter printWriter = resp.getWriter();
        printWriter.print(json);
        printWriter.flush();
        printWriter.close();
    }
}
