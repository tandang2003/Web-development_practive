package com.nhom44.api.admin;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.nhom44.bean.Category;
import com.nhom44.bean.History;
import com.nhom44.bean.Post;
import com.nhom44.bean.Project;
import com.nhom44.services.CategoryService;
import com.nhom44.services.PostService;
import com.nhom44.services.ProjectService;
import com.nhom44.services.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = {"/api/dashboard", "/api/dashboard/project", "/api/dashboard/contact", "/api/dashboard/count"})
public class dashboard extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (req.getRequestURI().startsWith("/api/dashboard/project")) {
            int numberProject = ProjectService.getInstance().getAllProject().size();
            List<Project> projects = ProjectService.getInstance().getAllProject();
            int numberCategory = CategoryService.getInstance().getAll().size();
            List<Category> categories = CategoryService.getInstance().getAll();
            int numberUser = UserService.getInstance().getAllUser().size();
            List<History> histories = ProjectService.getInstance().getAllHistory();
            List<Post> posts = PostService.getInstance().getAllPost();

            JsonObject jsonObject = new JsonObject();
            JsonArray jsonArray = new JsonArray();
            for (History history : histories) {
                JsonObject historyObject = new JsonObject();
                historyObject.addProperty("id", history.getId());
                historyObject.addProperty("postId", history.getPostId());
                historyObject.addProperty("userId", history.getUserId());
                historyObject.addProperty("createdAt", history.getCreatedAt());
                historyObject.addProperty("updatedAt", history.getUpdatedAt());
                jsonArray.add(historyObject);
            }
            jsonObject.add("histories", jsonArray);

            jsonArray = new JsonArray();
            for (Post post : posts) {
                JsonObject postObject = new JsonObject();
                postObject.addProperty("id", post.getId());
                postObject.addProperty("createdAt", post.getCreatedAt());
                postObject.addProperty("updatedAt", post.getUpdatedAt());
                jsonArray.add(postObject);
            }
            jsonObject.add("posts", jsonArray);
            jsonObject.addProperty("numberProject", numberProject);
            jsonObject.addProperty("numberCategory", numberCategory);
            jsonObject.addProperty("numberUser", numberUser);

//            projects and categories
            jsonArray = new JsonArray();
            for (Project project : projects) {
                JsonObject projectObject = new JsonObject();
                projectObject.addProperty("id", project.getId());
                projectObject.addProperty("status", project.getStatus());
                projectObject.addProperty("createdAt", project.getCreatedAt());
                projectObject.addProperty("updatedAt", project.getUpdatedAt());
                jsonArray.add(projectObject);
            }
            jsonObject.add("projects", jsonArray);

            jsonArray = new JsonArray();
            for (Category category : categories) {
                JsonObject categoryObject = new JsonObject();
                categoryObject.addProperty("id", category.getId());
                categoryObject.addProperty("name", category.getName());
                categoryObject.addProperty("createdAt", category.getCreatedAt());
                categoryObject.addProperty("updatedAt", category.getUpdatedAt());
                jsonArray.add(categoryObject);
            }
            jsonObject.add("categories", jsonArray);

            resp.setContentType("application/json");
            resp.getWriter().write(jsonObject.toString());
            resp.getWriter().flush();
            resp.getWriter().close();
        } else if (req.getRequestURI().startsWith("/api/dashboard/contact")) {
            // Handle contact endpoint if necessary
        }
    }
}
