package com.nhom44.bean;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;

import java.io.Serializable;
import java.util.Objects;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class District implements Serializable {
    private String id;
    private String name;
    private String fullName;
    private String province_id;
}