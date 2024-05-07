package com.nhom44.bean;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;

import java.io.Serializable;
import java.util.Objects;

@Data
@RequiredArgsConstructor
@NoArgsConstructor
public class Contact implements Serializable {
    private int id;
    private String fullName;
    private String email;
    private String phone;
    private String address;
    private String content;
    private String createdAt;
    private String updatedAt;
}