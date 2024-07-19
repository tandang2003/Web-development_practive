package com.nhom44.ip2location;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.nhom44.db.DBProperties;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Properties;
import java.util.Scanner;

import static com.nhom44.util.GsonUtil.getGson;

public class Ip2Location {
    private static Properties prop = new Properties();
    public static final String Default_URL = "https://api.ip2location.io/?key=";

    public Ip2Location() {
    }

    static {
        try {
            prop.load(DBProperties.class.getClassLoader().getResourceAsStream("ip2location.properties"));
        } catch (IOException var1) {
            var1.printStackTrace();
        }

    }

    public static String getNationality(String ip) {
        String url = Default_URL + Ip2Location.getIp2Location() + "&ip=" + ip;
        try {
            URL urlObj = new URL(url);
            HttpURLConnection connection = null;

            connection = (HttpURLConnection) urlObj.openConnection();
            connection.setRequestMethod("GET");
            int responseCode = connection.getResponseCode();
            if (responseCode == HttpURLConnection.HTTP_OK) {
                Scanner scanner = new Scanner(connection.getInputStream());
                StringBuilder jsonResponse = new StringBuilder();

                while (scanner.hasNextLine()) {
                    jsonResponse.append(scanner.nextLine());
                }

                scanner.close();
                String geolocationInfo = jsonResponse.toString();
                JsonObject jsonObject = getGson().fromJson(geolocationInfo, JsonObject.class);
                geolocationInfo = jsonObject.get("city_name").getAsString() + ", " + jsonObject.get("country_name").getAsString();
                return geolocationInfo;
            }
            return "IP undefined";
        } catch (IOException e) {
            return "IP undefined";
        }
    }

    private static String getIp2Location() {
        return prop.get("api.key").toString();
    }

}
