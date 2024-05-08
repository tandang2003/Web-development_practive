package com.nhom44.bean;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;

import java.io.Serializable;
import java.util.Objects;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Service implements Serializable {
    private int id;
    private String name;
    private String description;
    private String avatar;
    private int status;
    private int postId;
    private String createdAt;
    private String updatedAt;
    private int numberOfProject;
    private int numberOfView;
}