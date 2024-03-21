package com.nhom44.bean;

import java.io.Serializable;
import java.util.Objects;

public class Service implements Serializable {
    private int id;
    private String name;
    private String description;
    private String avatar;
    private int status;
    private int postId;
    private String createdAt;
    private String updatedAt;
    private int numberOfProject;
    private int numberOfView;

    public Service() {
    }

    @Override
    public String toString() {
        return "Service{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", description='" + description + '\'' +
                ", avatar='" + avatar + '\'' +
                ", status=" + status +
                ", postId=" + postId +
                ", createdAt='" + createdAt + '\'' +
                ", updatedAt='" + updatedAt + '\'' +
                ", numberOfProject=" + numberOfProject +
                ", numberOfView=" + numberOfView +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Service service = (Service) o;
        return id == service.id && status == service.status && postId == service.postId && numberOfProject == service.numberOfProject && numberOfView == service.numberOfView && Objects.equals(name, service.name) && Objects.equals(description, service.description) && Objects.equals(avatar, service.avatar) && Objects.equals(createdAt, service.createdAt) && Objects.equals(updatedAt, service.updatedAt);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, name, description, avatar, status, postId, createdAt, updatedAt, numberOfProject, numberOfView);
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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getPostId() {
        return postId;
    }

    public void setPostId(int postId) {
        this.postId = postId;
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

    public int getNumberOfProject() {
        return numberOfProject;
    }

    public void setNumberOfProject(int numberOfProject) {
        this.numberOfProject = numberOfProject;
    }

    public int getNumberOfView() {
        return numberOfView;
    }

    public void setNumberOfView(int numberOfView) {
        this.numberOfView = numberOfView;
    }

    public Service(int id, String name, String description, String avatar, int status, int postId, String createdAt, String updatedAt, int numberOfProject, int numberOfView) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.avatar = avatar;
        this.status = status;
        this.postId = postId;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
        this.numberOfProject = numberOfProject;
        this.numberOfView = numberOfView;
    }
}