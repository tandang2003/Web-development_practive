package com.nhom44.log.util.web.function;

import com.google.gson.Gson;
import com.nhom44.bean.SaveItem;
import com.nhom44.services.SaveProjectService;

public class LikeLog extends LogFunction{

    @Override
    protected String getValue(String updatedAt) {
        SaveItem item = SaveProjectService.getInstance().getSavedProject(updatedAt);
        return new Gson().toJson(item);
    }
}
