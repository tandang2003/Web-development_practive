package com.nhom44.bean;

import lombok.*;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Objects;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Address implements Serializable {
    private int id;
    private int provinceId;
    private int districtId;
    private int wardId;
    private String fullName;
    private String createdAt;
    private String updatedAt;
}