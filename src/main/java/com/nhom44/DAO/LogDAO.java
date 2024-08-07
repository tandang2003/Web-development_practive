package com.nhom44.DAO;

import com.nhom44.log.model.Log;
import org.jdbi.v3.sqlobject.config.RegisterBeanMapper;
import org.jdbi.v3.sqlobject.customizer.BindBean;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.SqlUpdate;

import java.util.List;

@RegisterBeanMapper(Log.class)
public interface LogDAO {
    @SqlUpdate("INSERT INTO logs (ip, national, level,address,description, preValue, afterValue ) VALUES (:ip, :national, :level,:address,:description, :preValue, :afterValue )")
    Boolean insert(@BindBean Log log);

    @SqlUpdate("UPDATE logs SET preValue = :prevalue, afterValue = :afterValue WHERE id = :id")
    Integer update(@BindBean Log log);

    @SqlUpdate("DELETE FROM logs WHERE id = :id")
    Integer delete(@BindBean Log log);
    void login();

    void logout();

    void Access();
    @SqlQuery("SELECT id,level,ip,address,description, updatedAt, createdAt FROM logs")
    List<Log> getAllLogs();
}
