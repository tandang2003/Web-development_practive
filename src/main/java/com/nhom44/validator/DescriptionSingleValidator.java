package com.nhom44.validator;

public class DescriptionSingleValidator implements SingleValidator {
    @Override
    public boolean validator(String input) {
        if (input == null || input.trim().isEmpty() || input.length() < 100) {
            return false;
        }
        return true;
    }
}
