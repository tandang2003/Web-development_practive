package com.nhom44.bean;

import java.io.Serializable;
import java.util.Objects;

public class District implements Serializable {
    private String id;
    private String name;
    private String fullName;
    private String province_id;

    public District() {
    }

    public District(String id, String name, String fullName, String province_id) {
        this.id = id;
        this.name = name;
        this.fullName = fullName;
        this.province_id = province_id;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getProvince_id() {
        return province_id;
    }

    public void setProvince_id(String province_id) {
        this.province_id = province_id;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        District district = (District) o;
        return Objects.equals(id, district.id) && Objects.equals(name, district.name) && Objects.equals(fullName, district.fullName) && Objects.equals(province_id, district.province_id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, name, fullName, province_id);
    }

    @Override
    public String toString() {
        return "District{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", fullName='" + fullName + '\'' +
                ", province_id='" + province_id + '\'' +
                '}';
    }
}
