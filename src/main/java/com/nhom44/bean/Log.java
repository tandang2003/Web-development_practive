package com.nhom44.bean;

import java.io.Serializable;
import java.util.Objects;

public class Log extends AbsModel implements Serializable {
    private int id;
    private String ip;
    private String national;
    private String level;
    private String address;
    private String prevalue;
    private String value;
    private L
    public Log() {
    }

    public Log(int id, String ip, String national, String level, String address, String prevalue, String value) {
        this.id = id;
        this.ip = ip;
        this.national = national;
        this.level = level;
        this.address = address;
        this.prevalue = prevalue;
        this.value = value;
    }

    @Override
    public String toString() {
        return "Log{" +
                "id=" + id +
                ", ip='" + ip + '\'' +
                ", national='" + national + '\'' +
                ", level='" + level + '\'' +
                ", address='" + address + '\'' +
                ", prevalue='" + prevalue + '\'' +
                ", value='" + value + '\'' +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Log log = (Log) o;
        return id == log.id && Objects.equals(ip, log.ip) && Objects.equals(national, log.national) && Objects.equals(level, log.level) && Objects.equals(address, log.address) && Objects.equals(prevalue, log.prevalue) && Objects.equals(value, log.value);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, ip, national, level, address, prevalue, value);
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

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPrevalue() {
        return prevalue;
    }

    public void setPrevalue(String prevalue) {
        this.prevalue = prevalue;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    @Override
    protected void insert() {

    }

    @Override
    protected void update(int id) {

    }

    @Override
    protected void delete(int id) {

    }
}
