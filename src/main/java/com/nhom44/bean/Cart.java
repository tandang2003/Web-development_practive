package com.nhom44.bean;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;

import java.io.Serializable;
import java.util.List;

@Data
@RequiredArgsConstructor
@NoArgsConstructor
public class Cart implements Serializable {
    private int id;
    private String email;
    private int categoryId;
    private int provinceId;
    private int representProjectId;
    private double width;
    private double height;
    private String createdAt;
    private String updatedAt;
    private int isCheck;
    private String province;
    private String category;
    private List<Integer> services;
    private List<String> images;

}