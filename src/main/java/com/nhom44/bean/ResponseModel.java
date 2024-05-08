package com.nhom44.bean;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ResponseModel<T> {
    private String message;
    private String name;
    private String status;
    private T data;
}
