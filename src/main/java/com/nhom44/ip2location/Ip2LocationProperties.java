package com.nhom44.ip2location;

import java.io.IOException;
import java.util.Properties;

public class Ip2LocationProperties {
    private static Properties prop = new Properties();

    public Ip2LocationProperties() {
    }
    static {
        try {
            prop.load(Ip2LocationProperties.class.getClassLoader().getResourceAsStream("ip2location.properties"));
        } catch (IOException var1) {
            var1.printStackTrace();
        }

    }
    public static String getIp2Location() {
        return prop.get("api.key").toString();
    }

}
