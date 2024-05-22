package com.nhom44.bean;


import lombok.*;

import java.io.Serializable;
import java.util.Objects;
@Data
@NoArgsConstructor
@AllArgsConstructor

public class Project extends AbsModel implements Serializable {
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

    public Project() {
    }

    public Project(int id, String title, String description, String avatar, long price, double acreage, int status, int postId, int isAccepted, String createdAt, String updatedAt, String schedule, String estimatedComplete, String address, String category, int addressId, int categoryId, int numSave, int numVisit, boolean isSave, int saveBy) {
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
        this.schedule = schedule;
        this.estimatedComplete = estimatedComplete;
        this.address = address;
        this.category = category;
        this.addressId = addressId;
        this.categoryId = categoryId;
        this.numSave = numSave;
        this.numVisit = numVisit;
        this.isSave = isSave;
        this.saveBy = saveBy;
    }

    @Override
    public void setPreValue(AbsModel model) {
        if (model != null && ((Project) model).id != 0) {
            this.preValue = model;
        }

    }

    @Override
    public void setAfterValue(AbsModel model) {
        if (model != null && ((Project) model).id != 0) {
            this.afterValue = model;
        }
    }
}