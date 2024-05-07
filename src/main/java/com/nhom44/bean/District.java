package com.nhom44.bean;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;

import java.io.Serializable;
import java.util.Objects;

@Data
@RequiredArgsConstructor
@NoArgsConstructor
public class District implements Serializable {
    private String id;
    private String name;
    private String fullName;
    private String province_id;
}
