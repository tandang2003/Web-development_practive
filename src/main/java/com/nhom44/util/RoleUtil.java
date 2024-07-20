package com.nhom44.util;

public class RoleUtil {
    public static final String ADMIN = "admin";
    public static final String WATCHER= "watcher";
    public static final String EDITOR = "editor";
    public static final String USER = "user";

    public static boolean isAdmin(String role){
        return role.equals(ADMIN);
    }
    public static boolean isWatcher(String role){
        return role.equals(WATCHER);
    }
    public static boolean isEditor(String role){
        return role.equals(EDITOR);
    }
    public static boolean isUser(String role){
        return role.equals(USER);
    }
    public static String getRole(int role){
        if(role==1){
            return ADMIN;
        }
        if(role==2){
            return WATCHER;
        }
        if(role==3){
            return EDITOR;
        }
        if(role==4){
            return USER;
        }
        return null;
    }
}
