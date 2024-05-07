package com.nhom44.bean;


import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;

import java.io.Serializable;
import java.util.Objects;
@Data
@RequiredArgsConstructor
@NoArgsConstructor
public class Verify implements Serializable {
    private int id;
    private int userId;
    private String code;
    private String exprire;
}
