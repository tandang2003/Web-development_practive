package com.nhom44.log.util.function;

import com.google.gson.Gson;
import com.nhom44.bean.Cart;
import com.nhom44.services.CartService;

import javax.servlet.http.HttpServletRequest;

import static com.nhom44.util.GsonUtil.getGson;

public class OrderLog extends LogFunction{
    private Cart cart;

    public OrderLog(HttpServletRequest request, Cart cart) {
        super(request);
        this.cart = cart;
    }

    @Override
    protected String getValue() {
        Cart cart = CartService.getInstance().getById(this.cart.getId());
        return getGson().toJson(cart);
    }
    public void createLog(){
        resetDescription(request.getRemoteAddr() + " order " + cart.getId());
        this.setPostValue();
        this.setLevel(1);
        this.log();
    }
    public void updateLog(){
        resetDescription(request.getRemoteAddr() + " update order " + cart.getId());
        this.setLevel(2);
        this.log();
    }
    public void deleteLog(){
        resetDescription(request.getRemoteAddr() + " delete order " + cart.getId());
        this.setPreValue();
        this.setLevel(3);
        this.log();
    }
    public void successLog(){
        resetDescription(request.getRemoteAddr() + " success submit order " + cart.getId());
        this.setLevel(4);
        this.log();
    }
    public void failLog(){
        resetDescription(request.getRemoteAddr() + " fail order " );
//        this.setPostValue();
        this.setLevel(2);
        this.log();
    }
    public void verifyLog(){
        resetDescription(request.getRemoteAddr() + " verify order " + cart.getId());
        this.setPreValue();
        this.setPostValue();
        this.setLevel(1);
        this.log();
    }
}
