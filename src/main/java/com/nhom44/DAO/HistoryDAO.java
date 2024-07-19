package com.nhom44.DAO;

import com.nhom44.bean.History;
import com.nhom44.bean.Project;
import org.jdbi.v3.sqlobject.config.RegisterBeanMapper;
import org.jdbi.v3.sqlobject.statement.SqlQuery;

import java.util.List;

@RegisterBeanMapper(com.nhom44.bean.History.class)
public interface HistoryDAO {
    @SqlQuery("SELECT id, postId, userId, createdAt, updatedAt FROM histories")
    List<History> getAllHistory();
}
