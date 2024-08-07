package com.nhom44.log.util.function;

import com.google.gson.Gson;
import com.nhom44.bean.User;
import com.nhom44.services.UserService;

import javax.servlet.http.HttpServletRequest;

import static com.nhom44.util.GsonUtil.getGson;

public class ForgetPasswordLog extends LogFunction {
    private User user;

    public ForgetPasswordLog(HttpServletRequest request, User user) {
        super(request);
        this.user = user;
    }

    @Override
    protected String getValue() {
        User user = UserService.getInstance().getUserById(this.user.getId());
        return getGson().toJson(user);
    }

    public void successLog() {
        resetDescription(request.getRemoteAddr() + " forget password " + user.getId());
        this.setPostValue();
        this.setLevel(1);
        this.log();
    }
    public void failLog(){

        this.setLevel(2);
        this.log();
    }

}
