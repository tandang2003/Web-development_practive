package com.nhom44.ip2location;

import java.io.IOException;
import java.util.Properties;

public class ip2LocationProperties {
    private static Properties prop = new Properties();

    public ip2LocationProperties() {
    }
    static {
        try {
            prop.load(ip2LocationProperties.class.getClassLoader().getResourceAsStream("ip2location.properties"));
        } catch (IOException var1) {
            var1.printStackTrace();
        }

    }
    public static String getIp2Location() {
        return prop.get("api.key").toString();
    }

    public static void main(String[] args) {
        System.out.println(getIp2Location());
    }
}
