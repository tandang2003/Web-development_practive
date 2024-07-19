package com.nhom44.bean;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;

import java.io.Serializable;
import java.util.Objects;

@Data
@AllArgsConstructor
@Builder
public class Contact implements Serializable {
    private int id;
    private String fullName;
    private String email;
    private String phone;
    private Address address;
    private String addressS;
    private int addressId;
    private String content;
    private String createdAt;
    private String updatedAt;
    public Contact(){
        this.address=new Address();
    }
}