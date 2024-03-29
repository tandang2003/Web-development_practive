package com.nhom44.bean;

import java.io.Serializable;
import java.util.Objects;

public class District implements Serializable {
    private String id;
    private String name;
    private String province_id;

    public District() {
    }

    public District(String id, String name, String province_id) {
        this.id = id;
        this.name = name;
        this.province_id = province_id;
    }

    public String getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getProvince_id() {
        return province_id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setProvince_id(String province_id) {
        this.province_id = province_id;
    }

    @Override
    public String toString() {
        return "District{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", province_id='" + province_id + '\'' +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        District district = (District) o;
        return id.equals(district.id) && name.equals(district.name) && province_id.equals(district.province_id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, name, province_id);
    }

}
