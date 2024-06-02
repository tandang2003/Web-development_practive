package com.nhom44.log.util.function;

import com.google.gson.Gson;
import com.nhom44.bean.SaveItem;
import com.nhom44.services.SaveProjectService;

import javax.servlet.http.HttpServletRequest;

public class LikeLog extends LogFunction{
    private SaveItem saveItem;
    public LikeLog() {
        super();
    }

    @Override
    protected String getValue() {
        SaveItem saveItem = SaveProjectService.getInstance().getSavedProject(this.saveItem.getPostId(),this.saveItem.getUserId() );
        return new Gson().toJson(saveItem);
    }
    public void getValue(SaveItem saveItem){
        this.saveItem= saveItem;
    }
    protected void setAddress(HttpServletRequest request) {
        log.setAddress(request.getServletPath() + request.getPathInfo());
    }
}
