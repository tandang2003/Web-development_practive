package com.nhom44.DAO;

import org.jdbi.v3.sqlobject.customizer.Bind;
import org.jdbi.v3.sqlobject.statement.SqlUpdate;

public interface ProjectUserDAO {
    @SqlUpdate("INSERT INTO users_projects (projectId, userId) VALUES (:projectId, :userId)")
    void insert(@Bind("projectId") int projectId, @Bind("userId") int userId);
}
