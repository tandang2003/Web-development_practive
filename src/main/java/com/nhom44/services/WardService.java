package com.nhom44.services;

import com.nhom44.DAO.WardDAO;
import com.nhom44.bean.Ward;
import com.nhom44.db.JDBIConnector;
import org.jdbi.v3.core.Jdbi;

import java.util.List;

public class WardService {
    private Jdbi conn;
    private static WardService instance;

    private WardService() {
        conn = JDBIConnector.get();
    }

    public static WardService getInstance() {
        return instance != null ? instance : (instance = new WardService());
    }

    public List<Ward> getAll() {
        return conn.withExtension(WardDAO.class, dao -> dao.getAll());
    }
    public String getSpecificId(String Ward){
        return conn.withExtension(WardDAO.class,dao->dao.getSpecificId(Ward));
    }

    public List<Ward> getWardByDistrictId(int district) {
        return conn.withExtension(WardDAO.class, dao -> dao.getWardByDistrictId(district));
    }
}
