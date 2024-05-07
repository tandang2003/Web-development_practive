package com.nhom44.bean;

import java.io.Serializable;
import java.util.Objects;

public class Province implements Serializable {
    private int id;
    private String name;
    private String fullName;

    public Province() {
    }

    public Province(int id, String name, String fullName) {
        this.id = id;
        this.name = name;
        this.fullName = fullName;
    }
    public int getId() {
        return id;
    }

    public void setId(int id) {
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

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Province province = (Province) o;
        return id == province.id && Objects.equals(name, province.name) && Objects.equals(fullName, province.fullName);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, name, fullName);
    }
}
