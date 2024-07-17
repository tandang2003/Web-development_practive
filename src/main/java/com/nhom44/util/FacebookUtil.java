package com.nhom44.util;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.nhom44.bean.FacebookAccount;
import com.nhom44.facebook.FacebookProperties;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

public class FacebookUtil {
    public static String getAccessToken(String code) throws IOException {
        String url = "https://graph.facebook.com/v11.0/oauth/access_token?" +
                "client_id=" + FacebookProperties.getAppId() +
                "&redirect_uri=" + FacebookProperties.getRedirectUri() +
                "&client_secret=" + FacebookProperties.getAppSecret() +
                "&code=" + code;

        HttpURLConnection connection = (HttpURLConnection) new URL(url).openConnection();
        connection.setRequestMethod("GET");

        InputStream responseStream = connection.getInputStream();
        JsonObject responseJson = JsonParser.parseReader(new InputStreamReader(responseStream)).getAsJsonObject();

        return responseJson.get("access_token").getAsString();
    }

    public static FacebookAccount getUserInfo(String accessToken) throws IOException {
        String url = "https://graph.facebook.com/me?fields=id,name,email&access_token=" + accessToken;

        HttpURLConnection connection = (HttpURLConnection) new URL(url).openConnection();
        connection.setRequestMethod("GET");

        InputStream responseStream = connection.getInputStream();
        JsonObject responseJson = JsonParser.parseReader(new InputStreamReader(responseStream)).getAsJsonObject();

        FacebookAccount facebookAccount = new FacebookAccount();
        facebookAccount.setId(responseJson.get("id").getAsString());
        facebookAccount.setName(responseJson.get("name").getAsString());
        facebookAccount.setEmail(responseJson.get("email").getAsString());

        return facebookAccount;
    }
}

