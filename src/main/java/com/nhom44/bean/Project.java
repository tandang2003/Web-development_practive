package com.nhom44.bean;

import org.jdbi.v3.core.mapper.reflect.ColumnName;

import java.io.Serializable;
import java.util.Objects;

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
    private String estimated_complete;
    private String province;
    private String category;
    private int provinceId;
    private int categoryId;
    private int numSave;
    private int numVisit;
    private boolean isSave;
    private int saveBy;

    @Override
    public String toString() {
        return "Project{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", description='" + description + '\'' +
                ", avatar='" + avatar + '\'' +
                ", price=" + price +
                ", acreage=" + acreage +
                ", status=" + status +
                ", postId=" + postId +
                ", isAccepted=" + isAccepted +
                ", createdAt='" + createdAt + '\'' +
                ", updatedAt='" + updatedAt + '\'' +
                ", schedule='" + schedule + '\'' +
                ", estimated_complete='" + estimated_complete + '\'' +
                ", province='" + province + '\'' +
                ", category='" + category + '\'' +
                ", provinceId=" + provinceId +
                ", categoryId=" + categoryId +
                ", numSave=" + numSave +
                ", numVisit=" + numVisit +
                ", isSave=" + isSave +
                ", saveBy=" + saveBy +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Project project = (Project) o;
        return id == project.id && price == project.price && Double.compare(acreage, project.acreage) == 0 && status == project.status && postId == project.postId && isAccepted == project.isAccepted && provinceId == project.provinceId && categoryId == project.categoryId && numSave == project.numSave && numVisit == project.numVisit && isSave == project.isSave && saveBy == project.saveBy && Objects.equals(title, project.title) && Objects.equals(description, project.description) && Objects.equals(avatar, project.avatar) && Objects.equals(createdAt, project.createdAt) && Objects.equals(updatedAt, project.updatedAt) && Objects.equals(schedule, project.schedule) && Objects.equals(estimated_complete, project.estimated_complete) && Objects.equals(province, project.province) && Objects.equals(category, project.category);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, title, description, avatar, price, acreage, status, postId, isAccepted, createdAt, updatedAt, schedule, estimated_complete, province, category, provinceId, categoryId, numSave, numVisit, isSave, saveBy);
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public long getPrice() {
        return price;
    }

    public void setPrice(long price) {
        this.price = price;
    }

    public double getAcreage() {
        return acreage;
    }

    public void setAcreage(double acreage) {
        this.acreage = acreage;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getPostId() {
        return postId;
    }

    public void setPostId(int postId) {
        this.postId = postId;
    }

    public int getIsAccepted() {
        return isAccepted;
    }

    public void setIsAccepted(int isAccepted) {
        this.isAccepted = isAccepted;
    }

    public String getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(String createdAt) {
        this.createdAt = createdAt;
    }

    public String getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(String updatedAt) {
        this.updatedAt = updatedAt;
    }

    public String getSchedule() {
        return schedule;
    }

    public void setSchedule(String schedule) {
        this.schedule = schedule;
    }

    public String getEstimated_complete() {
        return estimated_complete;
    }

    public void setEstimated_complete(String estimated_complete) {
        this.estimated_complete = estimated_complete;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public int getProvinceId() {
        return provinceId;
    }

    public void setProvinceId(int provinceId) {
        this.provinceId = provinceId;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public int getNumSave() {
        return numSave;
    }

    public void setNumSave(int numSave) {
        this.numSave = numSave;
    }

    public int getNumVisit() {
        return numVisit;
    }

    public void setNumVisit(int numVisit) {
        this.numVisit = numVisit;
    }

    public boolean isSave() {
        return isSave;
    }

    public void setSave(boolean save) {
        isSave = save;
    }

    public int getSaveBy() {
        return saveBy;
    }

    public void setSaveBy(int saveBy) {
        this.saveBy = saveBy;
    }

    public Project() {
    }

    public Project(int id, String title, String description, String avatar, long price, double acreage, int status, int postId, int isAccepted, String createdAt, String updatedAt, String schedule, String estimated_complete, String province, String category, int provinceId, int categoryId, int numSave, int numVisit, boolean isSave, int saveBy) {
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
        this.estimated_complete = estimated_complete;
        this.province = province;
        this.category = category;
        this.provinceId = provinceId;
        this.categoryId = categoryId;
        this.numSave = numSave;
        this.numVisit = numVisit;
        this.isSave = isSave;
        this.saveBy = saveBy;
    }
}
