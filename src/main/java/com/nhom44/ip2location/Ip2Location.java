package com.nhom44.ip2location;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import javax.script.ScriptContext;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.net.URL;
import java.util.Scanner;

public class Ip2Location {
    public static final String Default_URL = "https://api.ip2location.io/?key=";

    public static String getNationality(String ip) throws IOException {
        String url = Default_URL + ip2LocationProperties.getIp2Location() + "&ip=" + ip;
        URL urlObj = new URL(url);
        HttpURLConnection connection = (HttpURLConnection) urlObj.openConnection();
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
            JsonObject jsonObject = new Gson().fromJson(geolocationInfo, JsonObject.class);
            geolocationInfo = jsonObject.get("city_name").getAsString()+", "+jsonObject.get("country_name").getAsString();
            return geolocationInfo;
        }
        return "Ip undefined";
    }

    public static void main(String[] args) throws IOException {
        System.out.println(getNationality("38.134.243.196"));
    }

}
