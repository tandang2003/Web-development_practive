package com.nhom44.DAO;

import com.nhom44.bean.SaveItem;
import org.jdbi.v3.sqlobject.config.RegisterBeanMapper;
import org.jdbi.v3.sqlobject.customizer.Bind;
import org.jdbi.v3.sqlobject.customizer.BindBean;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.SqlUpdate;
@RegisterBeanMapper(SaveItem.class)
public interface SaveProjectDAO {
    @SqlUpdate("INSERT INTO saved_projects(postId, userId, createdAt, updatedAt) VALUES(:postId, :userId,Now(),Now()) ")
    Boolean saveProject(@BindBean SaveItem saveItem);

    @SqlUpdate("DELETE FROM saved_projects WHERE postId=:postId AND userId=:userId")
    Boolean deleteSaveProject(@BindBean SaveItem saveItem);

    @SqlQuery("Select EXISTS(SELECT * FROM saved_projects WHERE postId=:postId AND userId=:userId)")
    Boolean isSaveProject(@Bind("postId") int postId, @Bind("userId") int id);

    @SqlQuery("Select * FROM saved_projects WHERE postId=:postId AND userId=:userId")
    SaveItem getSavedProject(@Bind("postId") int postId, @Bind("userId") int id);
}
