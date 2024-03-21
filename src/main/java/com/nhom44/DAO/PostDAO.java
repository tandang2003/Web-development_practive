package com.nhom44.DAO;

import com.nhom44.bean.Post;
import org.jdbi.v3.sqlobject.config.RegisterBeanMapper;
import org.jdbi.v3.sqlobject.config.RegisterFieldMapper;
import org.jdbi.v3.sqlobject.customizer.Bind;
import org.jdbi.v3.sqlobject.customizer.BindBean;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.SqlUpdate;

@RegisterBeanMapper(Post.class)
public interface PostDAO{

@SqlUpdate("insert into posts(content,createdAt,updatedAt) values(:content,:createdAt,:updatedAt)")
    int addPost(@BindBean Post post);
@SqlQuery("select * from posts where content=:content and createdAt=:createdAt and updatedAt=:updatedAt")
    Post getByObject(@BindBean Post post);
@SqlUpdate("update posts set content=:content,updatedAt=:updatedAt where id=:id")
    Integer updatePost(@BindBean Post post);
@SqlQuery("select * from posts where id=:postId")
    Post getById(@Bind("postId") int postId);
}
