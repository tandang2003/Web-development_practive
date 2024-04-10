package com.nhom44.bean;

import java.io.Serializable;
import java.util.Objects;

public class Address implements Serializable {
    private int id;
    private int provinceId;
    private int districtId;
    private int wardId;
    private String created_at;
    private String updated_at;

    public Address() {
    }

    public Address(int id, int provinceId, int districtId, int wardId, String created_at, String updated_at) {
        this.id = id;
        this.provinceId = provinceId;
        this.districtId = districtId;
        this.wardId = wardId;
        this.created_at = created_at;
        this.updated_at = updated_at;
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

    public String getCreated_at() {
        return created_at;
    }

    public void setCreated_at(String created_at) {
        this.created_at = created_at;
    }

    public String getUpdated_at() {
        return updated_at;
    }

    public void setUpdated_at(String updated_at) {
        this.updated_at = updated_at;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Address address = (Address) o;
        return id == address.id && provinceId == address.provinceId && districtId == address.districtId && wardId == address.wardId && Objects.equals(created_at, address.created_at) && Objects.equals(updated_at, address.updated_at);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, provinceId, districtId, wardId, created_at, updated_at);
    }

    @Override
    public String toString() {
        return "Address{" +
                "id=" + id +
                ", provinceId=" + provinceId +
                ", districtId=" + districtId +
                ", wardId=" + wardId +
                ", created_at='" + created_at + '\'' +
                ", updated_at='" + updated_at + '\'' +
                '}';
    }
}
