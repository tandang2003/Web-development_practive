package com.nhom44.bean;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class SaveItem {
    private int id;
    private int projectId;
    private int userId;
    private String createdAt;
    private String updatedAt;

}
