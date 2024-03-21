package com.nhom44.bean;

import java.io.Serializable;
import java.util.Objects;

public class Slider implements Serializable {
    private int id;
    private String avatar;
    private String title;
    private int sequence;
    private int status;
    @Override
    public String toString() {
        return "Slider{" +
                "id=" + id +
                ", avatar='" + avatar + '\'' +
                ", title='" + title + '\'' +
                ", sequence=" + sequence +
                ", status=" + status +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Slider slider = (Slider) o;
        return id == slider.id && sequence == slider.sequence && status == slider.status && Objects.equals(avatar, slider.avatar) && Objects.equals(title, slider.title);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, avatar, title, sequence, status);
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getSequence() {
        return sequence;
    }

    public void setSequence(int sequence) {
        this.sequence = sequence;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Slider() {
    }

    public Slider(int id, String avatar, String title, int sequence, int status) {
        this.id = id;
        this.avatar = avatar;
        this.title = title;
        this.sequence = sequence;
        this.status = status;
    }
}