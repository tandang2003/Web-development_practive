package com.nhom44.util;

import java.text.SimpleDateFormat;

public class DateUtil {
    public static final SimpleDateFormat SIMPLE_DATE_FORMAT = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

    public static String formatStringDate(String date) {
        date = date.substring(0, 10);
        String[] arr = date.split("-");
        if (arr.length == 1)
            arr = date.split("/");
        return arr[2] + "-" + arr[1] + "-" + arr[0];
    }
}
