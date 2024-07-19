package com.nhom44.log.util.function.admin;

import com.nhom44.bean.User;
import com.nhom44.log.util.function.LogFunction;
import com.nhom44.services.UserService;

import javax.servlet.http.HttpServletRequest;

import static com.nhom44.util.GsonUtil.getGson;

public class UserLog extends LogFunction {
    private User user;
    public UserLog(HttpServletRequest request, User user) {
        super(request);
        this.user=user;
    }

    @Override
    protected String getValue() {
        User user= UserService.getInstance().getUserById(this.user.getId());
        return getGson().toJson(user);
    }
    public void addUser(){
        resetDescription(request.getRemoteAddr() + " add user " + user.getId());
        this.setPostValue();
        this.setLevel(2);
        this.log();
    }
    public void editUser(User user){
        this.user=user;
        this.setPreValue();
        UserService.getInstance().update(user);
        this.setPostValue();
        resetDescription(request.getRemoteAddr() + " edit user " + user.getId());
        this.setLevel(3);
        this.log();
    }
}
