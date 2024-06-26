package com.nhom44.bean;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;

import java.io.Serializable;
import java.sql.Date;
import java.time.LocalDateTime;
import java.util.Objects;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Image implements Serializable {
    private int id;
    private String name;
    private String path;
    private String createdAt;
    private String updatedAt;
}