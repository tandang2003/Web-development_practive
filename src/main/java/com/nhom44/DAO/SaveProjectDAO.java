package com.nhom44.DAO;

import com.nhom44.bean.SaveItem;
import org.jdbi.v3.sqlobject.config.RegisterBeanMapper;
import org.jdbi.v3.sqlobject.customizer.Bind;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.SqlUpdate;
@RegisterBeanMapper(SaveItem.class)
public interface SaveProjectDAO {
    @SqlUpdate("INSERT INTO saved_projects(postId, userId) VALUES(:projectId, :userId)")
    Boolean saveProject(@Bind("projectId") int projectId, @Bind("userId") int userId);

    @SqlUpdate("DELETE FROM saved_projects WHERE postId=:projectId AND userId=:userId")
    Boolean deleteSaveProject(@Bind("projectId") int projectId, @Bind("userId") int id);

    @SqlQuery("Select EXISTS(SELECT * FROM saved_projects WHERE postId=:projectId AND userId=:userId)")
    Boolean isSaveProject(@Bind("projectId") int projectId, @Bind("userId") int id);

    @SqlQuery("Select * FROM saved_projects WHERE updatedAt=:updatedAt")
    SaveItem getSavedProject(@Bind("updatedAt") String updatedAt);
}
