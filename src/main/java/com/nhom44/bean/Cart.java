package com.nhom44.bean;

import java.io.Serializable;
import java.util.List;
import java.util.Objects;

public class Cart implements Serializable {
    private int id;
    private String email;
    private int categoryId;
    private int provinceId;
    private int representProjectId;
    private double width;
    private double height;
    private String createdAt;
    private String updatedAt;
    private int isCheck;
    private String province;
    private String category;
    private List<Integer> services;
    private List<String> images;

    @Override
    public String toString() {
        return "Cart{" +
                "id=" + id +
                ", email='" + email + '\'' +
                ", categoryId=" + categoryId +
                ", provinceId=" + provinceId +
                ", representProjectId=" + representProjectId +
                ", width=" + width +
                ", height=" + height +
                ", createdAt='" + createdAt + '\'' +
                ", updatedAt='" + updatedAt + '\'' +
                ", isCheck=" + isCheck +
                ", province='" + province + '\'' +
                ", category='" + category + '\'' +
                ", services=" + services +
                ", images=" + images +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Cart cart = (Cart) o;
        return id == cart.id && categoryId == cart.categoryId && provinceId == cart.provinceId && representProjectId == cart.representProjectId && Double.compare(width, cart.width) == 0 && Double.compare(height, cart.height) == 0 && isCheck == cart.isCheck && Objects.equals(email, cart.email) && Objects.equals(createdAt, cart.createdAt) && Objects.equals(updatedAt, cart.updatedAt) && Objects.equals(province, cart.province) && Objects.equals(category, cart.category) && Objects.equals(services, cart.services) && Objects.equals(images, cart.images);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, email, categoryId, provinceId, representProjectId, width, height, createdAt, updatedAt, isCheck, province, category, services, images);
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public int getProvinceId() {
        return provinceId;
    }

    public void setProvinceId(int provinceId) {
        this.provinceId = provinceId;
    }

    public int getRepresentProjectId() {
        return representProjectId;
    }

    public void setRepresentProjectId(int representProjectId) {
        this.representProjectId = representProjectId;
    }

    public double getWidth() {
        return width;
    }

    public void setWidth(double width) {
        this.width = width;
    }

    public double getHeight() {
        return height;
    }

    public void setHeight(double height) {
        this.height = height;
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

    public int getIsCheck() {
        return isCheck;
    }

    public void setIsCheck(int isCheck) {
        this.isCheck = isCheck;
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

    public List<Integer> getServices() {
        return services;
    }

    public void setServices(List<Integer> services) {
        this.services = services;
    }

    public List<String> getImages() {
        return images;
    }

    public void setImages(List<String> images) {
        this.images = images;
    }

    public Cart() {
    }

    public Cart(int id, String email, int categoryId, int provinceId, int representProjectId, double width, double height, String createdAt, String updatedAt, int isCheck, String province, String category, List<Integer> services, List<String> images) {
        this.id = id;
        this.email = email;
        this.categoryId = categoryId;
        this.provinceId = provinceId;
        this.representProjectId = representProjectId;
        this.width = width;
        this.height = height;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
        this.isCheck = isCheck;
        this.province = province;
        this.category = category;
        this.services = services;
        this.images = images;
    }
}