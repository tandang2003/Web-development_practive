package com.nhom44.validator;

public class PhoneValidator implements SingleValidator{
    @Override
    public boolean validator(String input) {
        if (input==null||input.trim().isEmpty()) return false;
        if (input.length()<10||input.length()>11) return false;
        try {
            double num = Double.parseDouble(input);
            return true;
        } catch (NumberFormatException e) {
            return false;
        }
    }
}
