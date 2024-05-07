package com.nhom44.bean;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;

import java.io.Serializable;
import java.util.Objects;
@Data
@RequiredArgsConstructor
@NoArgsConstructor
public class Category implements Serializable {
    private int id;
    private String name;
    private int status;
    private String createdAt;
    private String updatedAt;
    private int numberOfProject;
}