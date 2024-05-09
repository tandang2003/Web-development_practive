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
