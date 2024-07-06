package com.nhom44.ip2location;

import com.nhom44.db.DBProperties;

import java.io.IOException;
import java.util.Properties;

public class Ip2LocationProperties {
    private static Properties prop = new Properties();
    static {
        try {
            prop.load(DBProperties.class.getClassLoader().getResourceAsStream("ip2location.properties"));
        } catch (IOException var1) {
            var1.printStackTrace();
        }

    }

    public static String getIp2Location() {
        return prop.get("api.key").toString();
    }
}
