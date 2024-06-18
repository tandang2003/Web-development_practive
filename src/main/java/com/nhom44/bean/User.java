package com.nhom44.bean;

import com.nhom44.util.StringUtil;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;

import java.beans.ConstructorProperties;
import java.io.Serializable;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.Objects;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class User implements Serializable {
    // status 0-> disable, 1-> enable, 2-> block, 3-> not create
    private int id;
    private String fullName;
    private String email;
    private String password;
    private String phone;
    private Date birthday;
    private int gender;
    private int status;
    private Timestamp createdAt;
    private Timestamp updatedAt;
    private int addressId;
    private String province;
    private int role;
}