package com.nhom44.log.util.function;

import com.google.gson.Gson;
import com.nhom44.bean.SaveItem;
import com.nhom44.services.SaveProjectService;

import javax.servlet.http.HttpServletRequest;

import static com.nhom44.util.GsonUtil.getGson;

public class LikeLog extends LogFunction{
    private SaveItem saveItem;
    public LikeLog(HttpServletRequest request) {
        super(request);
    }

    @Override
    protected String getValue() {
        SaveItem saveItem = SaveProjectService
                .getInstance()
                .getSavedProject(this.saveItem.getPostId(),this.saveItem.getUserId() );
        resetDescription(request.getRemoteAddr()+ " like project "+saveItem.getPostId());
        return getGson().toJson(saveItem);
    }
    public void setValue(SaveItem saveItem){
        this.saveItem= saveItem;
    }
    protected void setAddress(HttpServletRequest request) {
        log.setAddress(request.getServletPath() + request.getPathInfo());
    }

}
