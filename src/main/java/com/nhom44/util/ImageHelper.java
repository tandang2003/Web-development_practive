package com.nhom44.util;

import java.io.File;

public class ImageHelper {
    public static boolean deleteAvatar(String path){
        File file= new File(path);
        return file.delete();
    }
}
