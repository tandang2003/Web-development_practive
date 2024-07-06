package com.nhom44.bean;

import lombok.*;
import java.io.Serializable;
import java.util.Objects;
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Project implements Serializable {
    private int id;
    private String title;
    private String description;
    private String avatar;
    private long price;
    private double acreage;
    private int status;
    private int postId;
    private int isAccepted;
    private String createdAt;
    private String updatedAt;
    private String schedule;
    private String estimatedComplete;
    private String address;
    private String category;
    private int addressId;
    private int categoryId;
    private int numSave;
    private int numVisit;
    private boolean isSave;
    private int saveBy;


    public Project(int id, String title, String description, String avatar, long price, double acreage, int status, int postId, int isAccepted, String createdAt, String updatedAt, int addressId, int categoryId) {
        this.id = id;
        this.title = title;
        this.description = description;
        this.avatar = avatar;
        this.price = price;
        this.acreage = acreage;
        this.status = status;
        this.postId = postId;
        this.isAccepted = isAccepted;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
        this.addressId = addressId;
        this.categoryId = categoryId;
    }
}