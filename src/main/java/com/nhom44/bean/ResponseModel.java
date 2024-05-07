package com.nhom44.bean;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;

@Data
@RequiredArgsConstructor
@NoArgsConstructor
public class ResponseModel<T> {
    private String message;
    private String name;
    private String status;
    private T data;
}
