package com.nhom44.util;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

public class Upload {
    public static final String UPLOAD_DIR = "D:\\User\\Project JSP\\RealEstateWeb\\src\\main\\webapp\\template\\img";
    public static final String UPLOAD_SILDER = "slide";
    public static final String UPLOAD_USER_AVATAR = "user";
    public static final String UPLOAD_PROJECT = "projects";
    public static final String UPLOAD_AVATAR_SERVICE = "service";
    public static final String UPLOAD_CART = "post";

    public static List<String> uploadFile(String place, String partName, HttpServletRequest req) throws ServletException, IOException {
        Collection<Part> parts = req.getParts();
        List<String> fileNames = new ArrayList<>();
        for (Part part : parts) {
            if (part.getName().equalsIgnoreCase(partName)) {
                String fileName = extractFileName(part);
                if (fileName == null || fileName.equals("")) {
                    continue;
                }
                String applicationPath = req.getServletContext().getRealPath("");
                String basePath = applicationPath + File.separator + "template\\img" + File.separator + place;
                String realPath = UPLOAD_DIR + File.separator + place;
                File projectFolder = new File(realPath);
                File targetFolder = new File(basePath);
                if (!projectFolder.exists()) {
                    projectFolder.mkdirs();
                }
                if (!targetFolder.exists()) {
                    targetFolder.mkdirs();
                }
                String name = targetFolder.getAbsolutePath() + "\\" + (fileName);
                part.write(name);
                String destination = projectFolder.getAbsolutePath() + "\\" + fileName;
                Files.copy(new File(name).toPath(), new File(destination).toPath(), StandardCopyOption.REPLACE_EXISTING);
                fileNames.add("/template/img/" + place + "/" + fileName);
            }
        }
        return fileNames;
    }


    /**
     * Extracts file name from HTTP header content-disposition
     */
    private static String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=\"") + 2, s.length() - 1).trim();
            }
        }
        return null;
    }

}
