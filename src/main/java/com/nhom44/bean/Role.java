package com.nhom44.bean;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Role implements Serializable {
    private int id;
    private int name;
    private String createdAt;
    private String updatedAt;


}
