package com.nhom44.util;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class GsonUtil {
    public static Gson getGson() {
        return new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
    }

}
