package com.nhom44.bean;

import java.io.Serializable;
import java.util.Objects;

public class Ward implements Serializable {
    private String id;
    private String name;
    private String district_id;

    public Ward() {
    }

    public Ward(String id, String name, String district_id) {
        this.id = id;
        this.name = name;
        this.district_id = district_id;
    }

    public String getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getDistrict_id() {
        return district_id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setDistrict_id(String district_id) {
        this.district_id = district_id;
    }

    @Override
    public String toString() {
        return "Ward{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", district_id='" + district_id + '\'' +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Ward ward = (Ward) o;
        return id.equals(ward.id) && name.equals(ward.name) && district_id.equals(ward.district_id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, name, district_id);
    }
}
