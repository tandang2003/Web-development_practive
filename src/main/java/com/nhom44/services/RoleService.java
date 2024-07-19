package com.nhom44.services;

import com.nhom44.DAO.RoleDAO;
import com.nhom44.bean.Role;
import com.nhom44.db.JDBIConnector;
import org.jdbi.v3.core.Jdbi;

import java.io.Serializable;
import java.util.List;

public class RoleService implements Serializable {
    private static RoleService instance;
    private Jdbi conn;

    private RoleService() {
        conn = JDBIConnector.get();
    }

    public static RoleService getInstance() {
        return instance != null ? instance : (instance = new RoleService());
    }
    public List<Role> getAllRole() {
        return conn.withExtension(RoleDAO.class, dao -> dao.getAll());
    }
    public List<Role> getNotAdmin() {
        return conn.withExtension(RoleDAO.class, dao -> dao.getNotAdmin());
    }
}
