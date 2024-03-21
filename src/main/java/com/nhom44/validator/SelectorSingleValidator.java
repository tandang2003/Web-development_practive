package com.nhom44.validator;

public class SelectorSingleValidator implements SingleValidator {
    @Override
    public boolean validator(String input) {
        return input != null && !input.trim().isEmpty();
    }
}
