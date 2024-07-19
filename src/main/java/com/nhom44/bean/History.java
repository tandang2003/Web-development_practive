package com.nhom44.bean;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class History {
    int id;
    int postId;
    int userId;
    String createdAt;
    String updatedAt;
}
