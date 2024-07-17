package com.nhom44.bean;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class FacebookAccount {
    private String id;
    private String name;
    private String email;
    private String picture;
}
