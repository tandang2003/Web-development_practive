package com.nhom44.controller.auth;

import com.nhom44.log.util.function.OrderLog;
import com.nhom44.services.CartService;
import com.nhom44.services.UserService;
import com.nhom44.services.VerifyService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = {"/verify","/verify/cart"})
public class VerifyController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String token = req.getParameter("code");
        String url = req.getRequestURI();
        if(token!=null){
            if (url.equals("/verify/cart")){
                int cartId = VerifyService.getInstance().getCartsIdByCode(token);
                if(cartId!=0&&CartService.getInstance().updateSuccessVerifyCart(cartId)==1){
                    OrderLog orderLog = new OrderLog(req,CartService.getInstance().getById(cartId));
                    orderLog.verifyLog();
                    resp.sendRedirect(req.getContextPath()+"/home");
                    return;
                }else{
                    resp.sendRedirect(req.getContextPath()+"/404");
                    return;
                }
            }
            if (url.equals("/verify")){
            int userId = VerifyService.getInstance().getUserIdByCode(token);
            System.out.println(userId);
            UserService.getInstance().updateSuccessVerify(userId);
            resp.sendRedirect(req.getContextPath()+"/login");
        }}

    }
}
