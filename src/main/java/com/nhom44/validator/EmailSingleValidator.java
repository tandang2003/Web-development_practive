package com.nhom44.validator;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class EmailSingleValidator implements SingleValidator {
    public EmailSingleValidator() {
    }

    @Override
    public boolean validator(String input) {
        if (input==null||input.isEmpty()) return false;
        String regex = "^[\\w!#$%&amp;'*+/=?`{|}~^-]+(?:\\.[\\w!#$%&amp;'*+/=?`{|}~^-]+)*@(?:[a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,6}$";
        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(input);
        System.out.println("step 1.5");
        if (matcher.matches()) {
            return true;
        }
        return false;
    }
}
