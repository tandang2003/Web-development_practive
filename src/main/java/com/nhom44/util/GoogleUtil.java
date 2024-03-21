package com.nhom44.util;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.nhom44.bean.GoogleAccount;
import com.nhom44.google.GoogleProperties;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Form;
import org.apache.http.client.fluent.Request;

import java.io.IOException;

public class GoogleUtil {
    public static String getToken(String code) throws ClientProtocolException, IOException {
        // call api to get token
        String response = Request.Post(GoogleProperties.getLinkGetToken())
                .bodyForm(Form.form().add("client_id",GoogleProperties.getClientId())
                        .add("client_secret", GoogleProperties.getClientSecret())
                        .add("redirect_uri",GoogleProperties.getRedirectUri()).add("code", code)
                        .add("grant_type", GoogleProperties.getGrantType()).build())
                .execute().returnContent().asString();

        JsonObject jobj = new Gson().fromJson(response, JsonObject.class);
        String accessToken = jobj.get("access_token").toString().replaceAll("\"", "");
        return accessToken;
    }

    public static GoogleAccount getUserInfo(final String accessToken) throws ClientProtocolException, IOException {
        String link = GoogleProperties.getLinkGetUserInfo() + accessToken;
        String response = Request.Get(link).execute().returnContent().asString();

        GoogleAccount googlePojo = new Gson().fromJson(response, GoogleAccount.class);

        return googlePojo;
    }
}
