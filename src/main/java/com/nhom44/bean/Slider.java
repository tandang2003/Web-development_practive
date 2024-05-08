package com.nhom44.bean;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;

import java.io.Serializable;
import java.util.Objects;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Slider implements Serializable {
    private int id;
    private String avatar;
    private String title;
    private int sequence;
    private int status;
}