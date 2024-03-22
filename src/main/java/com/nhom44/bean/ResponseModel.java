package com.nhom44.bean;

public class ResponseModel<T> {
    private String message;
    private String name;
    private String status;
    private T data;
    public ResponseModel() {
    }

    public ResponseModel(String name,String message, String status, T data) {
        this.name= name;
        this.message = message;
        this.status = status;
        this.data = data;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Object getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }
}
