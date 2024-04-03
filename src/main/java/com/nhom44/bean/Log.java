package com.nhom44.bean;

import java.io.Serializable;
import java.util.Objects;

public class Log implements Serializable {
    private int id;
    private String ip;
    private String national;
    private int level;
    private String address;
    private String afterValue;
    private String preValue;
    private String description;
    private String createdAt;
    private String updatedAt;

    public Log() {
    }

    public Log(int id, String ip, String national, int level, String address, String afterValue, String preValue, String description, String createdAt, String updatedAt) {
        this.id = id;
        this.ip = ip;
        this.national = national;
        this.level = level;
        this.address = address;
        this.afterValue = afterValue;
        this.preValue = preValue;
        this.description = description;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
    }

    @Override
    public String toString() {
        return "Log{" +
                "id=" + id +
                ", ip='" + ip + '\'' +
                ", national='" + national + '\'' +
                ", level=" + level +
                ", address='" + address + '\'' +
                ", afterValue='" + afterValue + '\'' +
                ", preValue='" + preValue + '\'' +
                ", description='" + description + '\'' +
                ", createdAt='" + createdAt + '\'' +
                ", updatedAt='" + updatedAt + '\'' +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Log log = (Log) o;
        return id == log.id && level == log.level && Objects.equals(ip, log.ip) && Objects.equals(national, log.national) && Objects.equals(address, log.address) && Objects.equals(afterValue, log.afterValue) && Objects.equals(preValue, log.preValue) && Objects.equals(description, log.description) && Objects.equals(createdAt, log.createdAt) && Objects.equals(updatedAt, log.updatedAt);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, ip, national, level, address, afterValue, preValue, description, createdAt, updatedAt);
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    public String getNational() {
        return national;
    }

    public void setNational(String national) {
        this.national = national;
    }

    public int getLevel() {
        return level;
    }

    public void setLevel(int level) {
        this.level = level;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }


    public void setAfterValue(String afterValue) {
        this.afterValue = afterValue;
    }


    public void setPreValue(String preValue) {
        this.preValue = preValue;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
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
    public String getPreValue() {
        return this.preValue;
    }

    public String getAfterValue() {
        return this.afterValue;
    }
}