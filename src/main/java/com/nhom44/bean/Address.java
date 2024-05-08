package com.nhom44.bean;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Objects;

public class Address implements Serializable {
    private int id;
    private int provinceId;
    private int districtId;
    private int wardId;
    private Timestamp createdAt;
    private Timestamp updatedAt;

    public Address() {
    }

    @Override
    public String toString() {
        return "Address{" +
                "id=" + id +
                ", provinceId=" + provinceId +
                ", districtId=" + districtId +
                ", wardId=" + wardId +
                ", created_at=" + createdAt +
                ", updated_at=" + updatedAt +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Address address = (Address) o;
        return id == address.id && provinceId == address.provinceId && districtId == address.districtId && wardId == address.wardId && Objects.equals(createdAt, address.createdAt) && Objects.equals(updatedAt, address.updatedAt);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, provinceId, districtId, wardId, createdAt, updatedAt);
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getProvinceId() {
        return provinceId;
    }

    public void setProvinceId(int provinceId) {
        this.provinceId = provinceId;
    }

    public int getDistrictId() {
        return districtId;
    }

    public void setDistrictId(int districtId) {
        this.districtId = districtId;
    }

    public int getWardId() {
        return wardId;
    }

    public void setWardId(int wardId) {
        this.wardId = wardId;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }

    public Timestamp getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(Timestamp updatedAt) {
        this.updatedAt = updatedAt;
    }

    public Address(int id, int provinceId, int districtId, int wardId, Timestamp created_at, Timestamp updated_at) {
        this.id = id;
        this.provinceId = provinceId;
        this.districtId = districtId;
        this.wardId = wardId;
        this.createdAt = created_at;
        this.updatedAt = updated_at;
    }
}