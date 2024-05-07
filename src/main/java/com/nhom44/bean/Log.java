package com.nhom44.bean;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;

import java.io.Serializable;
import java.util.Objects;
@Data
@RequiredArgsConstructor
@NoArgsConstructor
public class                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    Log implements Serializable {
    private int id;
    private String ip;
    private String national;
    private int level;
    private String address;
    private String afterValue;
    private String preValue;
    private String description;
    private String createdAt;
    private String updatedAt;
}