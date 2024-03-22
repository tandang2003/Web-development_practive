package com.nhom44.validator;

public class NumberVallidator implements SingleValidator {
    @Override
    public boolean validator(String input) {
        if (input==null||input.trim().isEmpty()) return false;
        try {
            double num = Double.parseDouble(input);
            return true;
        } catch (NumberFormatException e) {
            return false;
        }
    }
}
