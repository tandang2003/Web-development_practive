package com.nhom44.services;

import com.nhom44.DAO.PostDAO;
import com.nhom44.bean.Post;
import com.nhom44.db.JDBIConnector;
import com.nhom44.util.DateUtil;
import org.jdbi.v3.core.Jdbi;

import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.Calendar;


public class PostService {
    private Jdbi conn;
    private static PostService instance;

    private PostService() {
        conn = JDBIConnector.get();
    }

    public static PostService getInstance() {
        return instance == null ? (instance = new PostService()) : instance;
    }

    public Post addPost(Post post) {
        LocalDateTime now = LocalDateTime.now();
        post.setCreatedAt(DateUtil.SIMPLE_DATE_FORMAT.format(Timestamp.valueOf(now)));
        post.setUpdatedAt(DateUtil.SIMPLE_DATE_FORMAT.format(Timestamp.valueOf(now)));
        int status = conn.withExtension(PostDAO.class, dao -> {
            return dao.addPost(post);
        });
        return status == 1 ? getByObject(post) : null;
    }

    public static void main(String[] args) {
//       Post post = new Post();
//         post.setContent("title");
//         Post rpost=getInstance().addPost(post);
//        System.out.println(rpost);
    }

    public Post getByObject(Post post) {
        return conn.withExtension(PostDAO.class, dao -> dao.getByObject(post));
    }

    public Post updatePost(Post post) {
        int status = conn.withExtension(PostDAO.class, dao -> {
            return dao.updatePost(post);
        });
        return status == 1 ? getById(post.getId()) : null;
    }

    public Post getById(int postId) {
        return conn.withExtension(PostDAO.class, dao -> dao.getById(postId));
    }
}
