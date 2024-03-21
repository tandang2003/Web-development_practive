package com.nhom44.validator;

public class TitleOrNameSingleValidator implements SingleValidator {

    @Override
    public boolean validator(String input) {
        if (input == null || input.trim().isEmpty() || input.length() < 6) {
          return false;
        }
        return true;
    }
}
