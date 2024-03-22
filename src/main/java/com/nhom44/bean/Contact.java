package com.nhom44.bean;

import java.io.Serializable;
import java.util.Objects;

public class Contact implements Serializable {
    private int id;
    private String fullName;
    private String email;
    private String phone;
    private String address;
    private String content;
    private String createdAt;
    private String updatedAt;

    @Override
    public String toString() {
        return "Contact{" +
                "id=" + id +
                ", fullName='" + fullName + '\'' +
                ", email='" + email + '\'' +
                ", phone='" + phone + '\'' +
                ", address='" + address + '\'' +
                ", content='" + content + '\'' +
                ", createdAt='" + createdAt + '\'' +
                ", updatedAt='" + updatedAt + '\'' +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Contact contact = (Contact) o;
        return id == contact.id && Objects.equals(fullName, contact.fullName) && Objects.equals(email, contact.email) && Objects.equals(phone, contact.phone) && Objects.equals(address, contact.address) && Objects.equals(content, contact.content) && Objects.equals(createdAt, contact.createdAt) && Objects.equals(updatedAt, contact.updatedAt);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, fullName, email, phone, address, content, createdAt, updatedAt);
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
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

    public Contact() {
    }

    public Contact(int id, String fullName, String email, String phone, String address, String content, String createdAt, String updatedAt) {
        this.id = id;
        this.fullName = fullName;
        this.email = email;
        this.phone = phone;
        this.address = address;
        this.content = content;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
    }
}