package com.nhom44.log.util.function;

import com.google.gson.Gson;
import com.nhom44.bean.Contact;
import com.nhom44.services.ContactService;

import javax.servlet.http.HttpServletRequest;

import static com.nhom44.util.GsonUtil.getGson;

public class FeedBackLog extends LogFunction {
    private Contact contact;

    public FeedBackLog(HttpServletRequest request) {
        super(request);
    }

    @Override
    protected String getValue() {
        Contact contact = ContactService.getInstance().getById(this.contact.getId());
        resetDescription(request.getRemoteAddr() + " feedback " + contact.getId());
        return getGson().toJson(contact);
    }

    public void successLog(Contact contact) {
        this.contact = contact;
        this.setPostValue();
        this.setLevel(2);
        this.log();
    }
    public void failLog(Contact contact) {
        this.contact = contact;
        this.setLevel(3);
        this.log();
    }
}
