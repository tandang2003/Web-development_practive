package com.nhom44.validator;


import com.nhom44.bean.ResponseModel;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateValidator implements SingleValidator {
    @Override
    public boolean validator(String input) {
        Date birthday = null;
        if (input != null || !input.trim().isEmpty()) {
            SimpleDateFormat dmy = new SimpleDateFormat("yyyy-MM-dd");
            dmy.setLenient(false);
            try {
                birthday = dmy.parse(input);
                return true;
            } catch (Exception e) {
                return false;
            }
        }
        return true;
    }
}
