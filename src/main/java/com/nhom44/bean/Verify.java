package com.nhom44.bean;


import java.io.Serializable;
import java.util.Objects;

public class Verify implements Serializable {
    private int id;
    private int userId;
    private String code;
    private String exprire;

    public String toString() {
        return "Verify{id=" + this.id + ", userId=" + this.userId + ", code='" + this.code + "', exprire='" + this.exprire + "'}";
    }

    public boolean equals(Object o) {
        if (this == o) {
            return true;
        } else if (o != null && this.getClass() == o.getClass()) {
            Verify verify = (Verify)o;
            return this.id == verify.id && this.userId == verify.userId && Objects.equals(this.code, verify.code) && Objects.equals(this.exprire, verify.exprire);
        } else {
            return false;
        }
    }

    public int hashCode() {
        return Objects.hash(new Object[]{this.id, this.userId, this.code, this.exprire});
    }

    public int getId() {
        return this.id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return this.userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getCode() {
        return this.code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getExprire() {
        return this.exprire;
    }

    public void setExprire(String exprire) {
        this.exprire = exprire;
    }

    public Verify() {
    }

    public Verify(int id, int userId, String code, String exprire) {
        this.id = id;
        this.userId = userId;
        this.code = code;
        this.exprire = exprire;
    }
}
