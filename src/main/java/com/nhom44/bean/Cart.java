package com.nhom44.bean;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

@Data
@AllArgsConstructor
public class Cart implements Serializable {
    private int id;
    private String email;
    private int categoryId;
    private Address address;
    private String addressS;
    private int addressId;
    private int representProjectId;
    private double width;
    private double height;
    private String createdAt;
    private String updatedAt;
    // 0: chưa gửi, 1: đã gửi, 2: đã kiểm tra
    private int isCheck;
    private String category;
    private List<Integer> services;
    private List<String> images;

    public Cart() {
        this.address = new Address();
        this.services = new ArrayList<>();
        this.images = new ArrayList<>();
    }
}