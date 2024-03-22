package com.nhom44.DAO;

import com.nhom44.bean.Log;
import org.jdbi.v3.sqlobject.config.RegisterBeanMapper;
import org.jdbi.v3.sqlobject.customizer.BindBean;
import org.jdbi.v3.sqlobject.statement.SqlUpdate;

@RegisterBeanMapper(Log.class)
public interface LogDAO {
    @SqlUpdate("INSERT INTO log (ip, national, level,address, prevalue, value ) VALUES (:ip, :national, :level,:address, :prevalue, :value )")
    Boolean insert(@BindBean Log log);

    void update();

    void delete();
    void login();

    void logout();

    void Access();
}
