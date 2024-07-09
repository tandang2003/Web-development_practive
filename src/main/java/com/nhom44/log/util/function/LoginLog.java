package com.nhom44.log.util.function;

import com.google.gson.Gson;
import com.nhom44.bean.User;
import com.nhom44.services.UserService;

import javax.servlet.http.HttpServletRequest;

public class LoginLog extends LogFunction{
    private User user;
    public LoginLog(HttpServletRequest request, User user) {
        super(request);
        this.user=user;
    }

    @Override
    protected String getValue() {
        User user = UserService.getInstance().getUserById(this.user.getId());
        return new Gson().toJson(user);
    }
    public void successLog(){
        resetDescription(request.getRemoteAddr() + " login  success " + user.getId());
        this.setPostValue();
        this.setLevel(1);
        this.log();
    }
    public void failLog(){
        resetDescription(request.getRemoteAddr() + " fail login " );
        this.setLevel(4);
        this.log();
    }
}
