package com.nhom44.validator;

import java.util.Arrays;

public class ServiceSelectValidator implements MuitipleValidator{
    @Override
    public boolean validator(String[] input) {
        System.out.println("input: "+ Arrays.toString(input));
        return input != null && input.length != 0;
    }
}
