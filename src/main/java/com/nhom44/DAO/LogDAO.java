package com.nhom44.DAO;

import com.nhom44.log.model.Log;
import org.jdbi.v3.sqlobject.config.RegisterBeanMapper;
import org.jdbi.v3.sqlobject.customizer.BindBean;
import org.jdbi.v3.sqlobject.statement.SqlUpdate;

@RegisterBeanMapper(Log.class)
public interface LogDAO {
    @SqlUpdate("INSERT INTO logs (ip, national, level,address, preValue, afterValue ) VALUES (:ip, :national, :level,:address, :preValue, :afterValue )")
    Boolean insert(@BindBean Log log);

    @SqlUpdate("UPDATE logs SET preValue = :prevalue, afterValue = :afterValue WHERE id = :id")
    Integer update(@BindBean Log log);

    @SqlUpdate("DELETE FROM logs WHERE id = :id")
    Integer delete(@BindBean Log log);
    void login();

    void logout();

    void Access();
}
