package com.nhom44.bean;

import lombok.*;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Objects;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class Address implements Serializable {
    private int id;
    private int provinceId;
    private int districtId;
    private int wardId;
    private Timestamp createdAt;
    private Timestamp updatedAt;
}