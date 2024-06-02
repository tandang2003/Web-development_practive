package com.nhom44.log.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Log implements Serializable {
    private int id;
    private String ip;
    private String national;
    private int level;
    private String address;
//    private String placeRequest;
    private String afterValue;
    private String preValue;
    private String description;
    private String createdAt;
    private String updatedAt;
}