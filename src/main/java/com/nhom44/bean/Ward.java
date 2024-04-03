package com.nhom44.bean;

import java.io.Serializable;
import java.util.Objects;

public class Ward implements Serializable {
    private String id;
    private String name;
    private String fullName;
    private String district_id;

    public Ward() {
    }

    public Ward(String id, String name, String fullName, String district_id) {
        this.id = id;
        this.name = name;
        this.fullName = fullName;
        this.district_id = district_id;
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

    public String getDistrict_id() {
        return district_id;
    }

    public void setDistrict_id(String district_id) {
        this.district_id = district_id;
    }

    @Override
    public String toString() {
        return "Ward{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", fullName='" + fullName + '\'' +
                ", district_id='" + district_id + '\'' +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Ward ward = (Ward) o;
        return Objects.equals(id, ward.id) && Objects.equals(name, ward.name) && Objects.equals(fullName, ward.fullName) && Objects.equals(district_id, ward.district_id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, name, fullName, district_id);
    }
}
