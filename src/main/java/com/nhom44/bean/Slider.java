package com.nhom44.bean;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;

import java.io.Serializable;
import java.util.Objects;
@Data
@RequiredArgsConstructor
@NoArgsConstructor
public class Slider implements Serializable {
    private int id;
    private String avatar;
    private String title;
    private int sequence;
    private int status;
}