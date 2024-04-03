package com.nhom44.bean;

import java.io.Serializable;
import java.util.Objects;

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
    private String province;
    private String category;
    private int addressId;
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
                ", estimatedComplete='" + estimatedComplete + '\'' +
                ", province='" + province + '\'' +
                ", category='" + category + '\'' +
                ", addressId=" + addressId +
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
        return id == project.id && price == project.price && Double.compare(project.acreage, acreage) == 0 && status == project.status && postId == project.postId && isAccepted == project.isAccepted && addressId == project.addressId && categoryId == project.categoryId && numSave == project.numSave && numVisit == project.numVisit && isSave == project.isSave && saveBy == project.saveBy && Objects.equals(title, project.title) && Objects.equals(description, project.description) && Objects.equals(avatar, project.avatar) && Objects.equals(createdAt, project.createdAt) && Objects.equals(updatedAt, project.updatedAt) && Objects.equals(schedule, project.schedule) && Objects.equals(estimatedComplete, project.estimatedComplete) && Objects.equals(province, project.province) && Objects.equals(category, project.category);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, title, description, avatar, price, acreage, status, postId, isAccepted, createdAt, updatedAt, schedule, estimatedComplete, province, category, addressId, categoryId, numSave, numVisit, isSave, saveBy);
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

    public String getEstimatedComplete() {
        return estimatedComplete;
    }

    public void setEstimatedComplete(String estimatedComplete) {
        this.estimatedComplete = estimatedComplete;
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

    public int getAddressId() {
        return addressId;
    }

    public void setAddressId(int addressId) {
        this.addressId = addressId;
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
        super();
    }

    public Project(int id, String title, String description, String avatar, long price, double acreage, int status, int postId, int isAccepted, String createdAt, String updatedAt, String schedule, String estimatedComplete, String province, String category, int addressId, int categoryId, int numSave, int numVisit, boolean isSave, int saveBy) {
        super();
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
        this.province = province;
        this.category = category;
        this.addressId = addressId;
        this.categoryId = categoryId;
        this.numSave = numSave;
        this.numVisit = numVisit;
        this.isSave = isSave;
        this.saveBy = saveBy;
    }

    @Override
    public AbsModel getPreValue() {
        return null;
    }

    @Override
    public AbsModel getAfterValue() {
        return null;
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
