package com.nhom44.DAO;

import com.nhom44.bean.Role;
import org.jdbi.v3.sqlobject.config.RegisterBeanMapper;
import org.jdbi.v3.sqlobject.statement.SqlQuery;

import java.util.List;

@RegisterBeanMapper(Role.class)
public interface RoleDAO {
    @SqlQuery("SELECT * FROM roles")
    List<Role> getAll();
@SqlQuery("SELECT * FROM roles WHERE name != 'admin'")
    List<Role> getNotAdmin();
}
