package com.nhom44.log.util.function;

import com.google.gson.Gson;
import com.nhom44.bean.User;
import com.nhom44.services.UserService;

import javax.servlet.http.HttpServletRequest;

import static com.nhom44.util.GsonUtil.getGson;

public class SignupLog extends LogFunction{
    private User user;
    public SignupLog(HttpServletRequest request, User user) {
        super(request);
        this.user=user;
    }

    @Override
    protected String getValue() {
        User user = UserService.getInstance().getUserById(this.user.getId());
        return getGson().toJson(user);
    }
    public void createLog(){
        resetDescription(request.getRemoteAddr() + " signup " + user.getId());
        this.setPostValue();
        this.setLevel(1);
        this.log();
    }
    public void failLog(){
        resetDescription(request.getRemoteAddr() + " fail signup " );
        this.setLevel(2);
        this.log();
    }
}
