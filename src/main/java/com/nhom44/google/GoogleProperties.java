package com.nhom44.google;

import com.nhom44.db.DBProperties;

import java.io.IOException;
import java.util.Properties;

public class GoogleProperties {
    private static Properties prop = new Properties();

    public GoogleProperties() {
    }
    static {
        try {
            prop.load(DBProperties.class.getClassLoader().getResourceAsStream("gg.properties"));
        } catch (IOException var1) {
            var1.printStackTrace();
        }

    }
    public static String getClientId() {
        return prop.get("google.client.id").toString();
    }

    public static String getClientSecret() {
        return prop.get("google.client.secret").toString();
    }

    public static String getRedirectUri() {
        return prop.get("google.redirect.uri").toString();
    }

    public static String getLinkGetToken() {
        return prop.get("google.link.get.token").toString();
    }

    public static String getLinkGetUserInfo() {
        return prop.get("google.link.get.user_info").toString();
    }

    public static String getGrantType() {
        return prop.get("google.grant.type").toString();
    }

    public static void main(String[] args) {
        System.out.println(getClientId());
        System.out.println(getClientSecret());
        System.out.println(getRedirectUri());
        System.out.println(getLinkGetToken());
        System.out.println(getLinkGetUserInfo());
        System.out.println(getGrantType());
    }
}
