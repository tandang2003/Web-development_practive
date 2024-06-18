package com.nhom44.log.util.function;

import com.google.gson.Gson;
import com.nhom44.bean.Contact;
import com.nhom44.services.ContactService;

public class FeedBackLog extends LogFunction{
    private Contact contact;
    public FeedBackLog() {
        super();
    }
    @Override
    protected String getValue() {
        Contact contact = ContactService.getInstance().getContact(this.contact);
        return new Gson().toJson(contact);
    }
    public void setContact(Contact contact){
        this.contact= contact;
    }
}
