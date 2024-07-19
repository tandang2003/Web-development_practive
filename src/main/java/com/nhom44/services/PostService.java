package com.nhom44.services;

import com.nhom44.DAO.PostDAO;
import com.nhom44.DAO.ProjectDAO;
import com.nhom44.bean.Post;
import com.nhom44.bean.Project;
import com.nhom44.db.JDBIConnector;
import com.nhom44.util.DateUtil;
import org.jdbi.v3.core.Jdbi;

import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.Calendar;
import java.util.Collections;
import java.util.List;


public class PostService {
    private Jdbi conn;
    private static PostService instance;

    private PostService() {
        conn = JDBIConnector.get();
    }

    public static PostService getInstance() {
        return instance == null ? (instance = new PostService()) : instance;
    }

    public int addPost(Post post) {
        int status = conn.withExtension(PostDAO.class, dao -> {
            return dao.addPost(post);
        });
        return status;
    }

    public static void main(String[] args) {
        System.out.println(getInstance().getById(1).toString());
    }

    public Post getByObject(Post post) {
        return conn.withExtension(PostDAO.class, dao -> dao.getByObject(post));
    }

    public Post updatePost(Post post) {
        int status = conn.withExtension(PostDAO.class, dao -> {
            return dao.updatePost(post);
        });
        return status == 1 ?   getById(post.getId()) : null;
    }

    public Post getById(int postId) {
        return conn.withExtension(PostDAO.class, dao -> dao.getById(postId));
    }

    public List<Post> getAllPost() {
        return conn.withExtension(PostDAO.class, PostDAO::getAllPost);
    }
}
