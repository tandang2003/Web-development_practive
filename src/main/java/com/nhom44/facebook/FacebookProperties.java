package com.nhom44.facebook;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.nhom44.util.FacebookUtil;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Properties;

public class FacebookProperties {
    private static final String PROPS_FILE = "fb.properties";
    private static Properties props = new Properties();

    static {
        try (InputStream inputStream = FacebookUtil.class.getClassLoader().getResourceAsStream(PROPS_FILE)) {
            if (inputStream != null) {
                props.load(inputStream);
            } else {
                throw new IOException("Properties file not found");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static String getAppId() {
        return props.getProperty("facebook.app.id");
    }

    public static String getAppSecret() {
        return props.getProperty("facebook.app.secret");
    }

    public static String getRedirectUri() {
        return props.getProperty("facebook.redirect.uri");
    }

    public static String getOAuthUrl() {
        return "https://www.facebook.com/v11.0/dialog/oauth?client_id=" + getAppId() +
                "&redirect_uri=" + getRedirectUri() +
                "&scope=email,public_profile";
    }

}
