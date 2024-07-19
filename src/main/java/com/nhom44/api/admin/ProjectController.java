package com.nhom44.api.admin;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.nhom44.bean.*;
import com.nhom44.services.*;
import com.nhom44.util.StringUtil;
import com.nhom44.util.Upload;
import com.nhom44.validator.*;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.beanutils.converters.DateTimeConverter;
import org.apache.commons.beanutils.converters.SqlDateConverter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.*;

import static com.nhom44.util.GsonUtil.getGson;

@WebServlet(urlPatterns = {"/api/admin/project", "/api/admin/project/add", "/api/admin/project/edit/*"})
public class ProjectController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String url = req.getServletPath();
        if (url.equals("/api/admin/project")) {
            List<Project> projects = ProjectService.getInstance().getAllProject();
            projects.forEach(project -> project.setUpdatedAt(project.getUpdatedAt().trim()));
            Gson gson = getGson();
            PrintWriter printWriter = resp.getWriter();
            String json = gson.toJson(projects);
            printWriter.println(json);
            printWriter.flush();
            printWriter.close();
        } else {
            JsonObject jsonObject = new JsonObject();
            JsonObject data = new JsonObject();
            String uniqueID = UUID.randomUUID().toString();
            data.addProperty("uniqueID", uniqueID);
            CategoryService categoryService = CategoryService.getInstance();
            data.add("categories", getGson().toJsonTree(categoryService.getAll()));
            ServiceOfProjectService serviceOfProjectService = ServiceOfProjectService.getInstance();
            data.add("services", getGson().toJsonTree(serviceOfProjectService.getAll()));
            ProvinceService provinceService = ProvinceService.getInstance();
            data.add("provinces", getGson().toJsonTree(provinceService.getAll()));
            if (url.equals("/api/admin/project/edit")) {
                String idS = req.getPathInfo().substring(1);
                if (idS.isEmpty()) {
                    jsonObject.addProperty("status", 404);
                    jsonObject.addProperty("message", "Không tìm thấy dự án");
                    jsonObject.addProperty("data", "/admin/project_management");
                    resp.setStatus(200);
                    PrintWriter printWriter = resp.getWriter();
                    printWriter.println(jsonObject.toString());
                    printWriter.flush();
                    return;
                }
                int id = Integer.parseInt(idS);
                Project project = ProjectService.getInstance().getById(id);
                if (project == null) {
                    jsonObject.addProperty("status", 404);
                    jsonObject.addProperty("message", "Không tìm thấy dự án");
                    jsonObject.addProperty("data", "/admin/project_management");
                    resp.setStatus(200);
                    PrintWriter printWriter = resp.getWriter();
                    printWriter.println(jsonObject.toString());
                    printWriter.flush();
                    return;
                }
                Address address = AddressService.getInstance().getAddressById(project.getAddressId());
                data.add("address", getGson().toJsonTree(address));
                data.add("project", getGson().toJsonTree(project));
                data.addProperty("isExcuting", project.getEstimatedComplete() != null && !project.getEstimatedComplete().isEmpty() && project.getSchedule() != null && !project.getSchedule().isEmpty());
                Post post = PostService.getInstance().getById(project.getPostId());
                data.add("post", getGson().toJsonTree(post));
                List<Service> services = ServiceOfProjectService.getInstance().getServicesByProjectId(id+"");

                data.add("servicesOfproject", getGson().toJsonTree(services));
                String userEmail = UserService.getInstance().getUserOwnerOfProject(project.getId()).getEmail();
                data.addProperty("userEmail", userEmail);

                List<String> groupImages = ImageService.getInstance().getGroupImagesByProjectId(id);
                data.add("groupImages", getGson().toJsonTree(groupImages));
            }
            jsonObject.addProperty("status", 200);
            jsonObject.addProperty("message", "Thành công");
            jsonObject.add("data", data);
            resp.setStatus(200);
            PrintWriter printWriter = resp.getWriter();
            printWriter.println(jsonObject.toString());
            printWriter.flush();
            printWriter.close();
            return;
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (req.getServletPath().equals("/api/admin/project/add")) {
            addProject(req, resp);
        } else if (req.getServletPath().equals("/api/admin/project/edit")) {
            editProject(req, resp);
        }
    }

    private void editProject(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        int id = Integer.parseInt(req.getPathInfo().substring(1));
        Project oldProject = ProjectService.getInstance().getById(id);
        Map<String, String[]> map = req.getParameterMap();
        System.out.println(map.keySet().toString());
        Project newProject = createProject(map, ProjectService.getInstance().getById(id));
        Address address = createAddress(map, AddressService.getInstance().getAddressById(oldProject.getAddressId()));
        Post post = createPost(map, PostService.getInstance().getById(oldProject.getPostId()));
        ProjectService.getInstance().updateProject(newProject, req.getParameter("isComplete").equals("true"));
        AddressService.getInstance().updateAddress(address);
        PostService.getInstance().updatePost(post);
        String[] services= map.get("service[]");
        if (services != null) {
            ServiceOfProjectService.getInstance().deleteServiceProject(id);
            System.out.println("services");
            for (String s : services) {
                System.out.println(s.trim());
                ServiceOfProjectService.getInstance().addServiceForProject(id+"", Integer.parseInt(s.trim()));
            }
        }
        if (newProject.getGallery().length != 0) {
            ImageService.getInstance().deleteAllImageProProject(id);
            for (String s : newProject.getGallery()) {
                int imgId = ImageService.getInstance().add(s);
                ImageService.getInstance().addImageForProject(id+"", imgId);
            }
        }
        resp.setStatus(200);
        JsonObject jsonObject = new JsonObject();
        jsonObject.addProperty("status", 200);
        jsonObject.addProperty("message", "Cập nhật dự án thành công");
        jsonObject.addProperty("redirect", "/admin/project_management");
        resp.getWriter().println(jsonObject.toString());
        resp.getWriter().flush();
    }

    private void addProject(HttpServletRequest req, HttpServletResponse resp) throws IOException {
//        int id = Integer.parseInt(req.getPathInfo().substring(1));
        Map<String, String[]> map = req.getParameterMap();
        System.out.println(map.keySet().toString());
        Project project = createProject(map, null);
        project.setId(map.get("id")[0]);
        Address address = createAddress(map, null);
        Post post = createPost(map, null);
        int addressId = AddressService.getInstance().addAddress(address);
        int postId = PostService.getInstance().addPost(post);
        project.setAddressId(addressId);
        project.setPostId(postId);
        project = ProjectService.getInstance().add(project, req.getParameter("isComplete").equals("true"));
        String[] services= map.get("service[]");
        if (services != null) {
            for (String s : services) {
                ServiceOfProjectService.getInstance().addServiceForProject(project.getId(), Integer.parseInt(s.trim()));
            }
        }
        if (project.getGallery().length != 0) {
            for (String s : project.getGallery()) {
                int imgId = ImageService.getInstance().add(s);
                ImageService.getInstance().addImageForProject(project.getId(), imgId);
            }
        }
        resp.setStatus(200);
        JsonObject jsonObject = new JsonObject();
        jsonObject.addProperty("status", 200);
        jsonObject.addProperty("message", "Thêm dự án thành công");
        jsonObject.addProperty("redirect", "/admin/project_management");
        resp.getWriter().println(jsonObject.toString());
        resp.getWriter().flush();
    }

    private Address createAddress(Map<String, String[]> map, Address address) {
        if (address == null) {
            address = new Address();
        }
        Address finalAddress = address;
        map.keySet().forEach(key -> {
            switch (key) {
                case "province":
                    finalAddress.setProvinceId(Integer.parseInt(map.get(key)[0]));
                    break;
                case "district":
                    finalAddress.setDistrictId(Integer.parseInt(map.get(key)[0]));
                    break;
                case "ward":
                    finalAddress.setWardId(Integer.parseInt(map.get(key)[0]));
                    break;
            }
        });
        return finalAddress;
    }

    private Project createProject(Map<String, String[]> map, Project project) {
        if (project == null) {
            project = new Project();
        }
        System.out.println(map.keySet());
        Project finalProject = project;
        map.keySet().forEach(key -> {
            switch (key) {
                case "title":
                    finalProject.setTitle(map.get(key)[0]);
                    break;
                case "description":
                    finalProject.setDescription(map.get(key)[0]);
                    break;
                case "categoryId":
                    finalProject.setCategoryId(Integer.parseInt(map.get(key)[0].trim()));
                    break;
                case "estimatedComplete":
                    finalProject.setEstimatedComplete(map.get(key)[0]);
                    break;
                case "acreage":
                    finalProject.setAcreage(Double.parseDouble(map.get(key)[0]));
                    break;
                case "schedule":
                    finalProject.setSchedule(map.get(key)[0]);
                    break;
                case "price":
                    finalProject.setPrice(Long.parseLong(map.get(key)[0]));
                    break;
                case "isAccepted":
                    finalProject.setIsAccepted(map.get(key)[0].equals("true") ? 1 : 0);
                    break;
                case "status":
                    finalProject.setStatus(Integer.parseInt(map.get(key)[0]));
                    break;
                case "avatar":
                    System.out.println("map.get(key)[0]");
                    System.out.println(map.get(key)[0]);
                    finalProject.setAvatar(map.get(key)[0]);
                    break;
                case "gallery":
                    System.out.println("map.get(key)[1]");
                    System.out.println(map.get(key)[0]);
                    finalProject.setGallery(map.get(key)[0].split(","));
                    break;
            }
        });
        if (!(finalProject.getIsAccepted()==1))
            finalProject.setStatus(0);
        return finalProject;
    }

    private Post createPost(Map<String, String[]> map, Post post) {
        if (post == null) {
            post = new Post();
        }
        Post finalPost = post;
        map.keySet().forEach(key -> {
            switch (key) {
                case "content":
                    finalPost.setContent(map.get(key)[0]);
                    break;
            }
        });

        return finalPost;
    }
}
