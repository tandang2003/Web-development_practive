package com.nhom44.util;


import com.nhom44.bean.Image;
import com.nhom44.bean.Project;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.List;

public class StringUtil {
    public static String projectFolder(int id) {
        String folder = id + "";
        while (folder.length() < 4) {
            folder = "0" + folder;
        }
        return folder;
    }
    public static Image getImage(String path) {
        Image image = new Image();
        image.setPath(path.substring(0,path.lastIndexOf("/")));
        image.setName(path.substring(path.lastIndexOf("/") + 1));
        return image;
    }
    public static String hashPassword(String password) {
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            md.update(password.getBytes());
            byte[] bytes = md.digest();

            StringBuilder sb = new StringBuilder();
            for (byte aByte : bytes) {
                sb.append(Integer.toString((aByte & 0xff) + 0x100, 16).substring(1));
            }
            return sb.toString();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            return null;
        }
    }
    public static String buildJsonUserProject(List<Project> projects,List<String> emails) {
        StringBuilder builder = new StringBuilder();
        builder.append("[");
        for (int i = 0; i < projects.size(); i++) {
            builder.append("{");
            builder.append("\"id\":").append(i).append(",");
            builder.append("\"title\":\"").append(projects.get(i).getTitle()).append("\",");
            builder.append("\"status\":").append(projects.get(i).getStatus()).append(",");
            builder.append("\"email\":\"").append(emails.get(i)).append("\"");
            builder.append("}");
            if (i < projects.size() - 1) {
                builder.append(",");
            }
        }
        builder.append("]");
        return builder.toString();
    }
}
