package com.nhom44.bean;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class SaveItem {
    private int id;
    private int postId;
    private int userId;
    private int status;
    private String createdAt;
    private String updatedAt;

}
