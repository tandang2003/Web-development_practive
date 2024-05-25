package com.nhom44.bean;


import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;

import java.io.Serializable;
import java.util.Objects;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Verify implements Serializable {
    private int id;
    private int userId;
    private String code;
    private String exprire;
}
