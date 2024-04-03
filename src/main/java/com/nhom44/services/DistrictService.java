package com.nhom44.services;

import com.nhom44.DAO.DistrictDAO;
import com.nhom44.bean.District;
import com.nhom44.bean.Ward;
import com.nhom44.db.JDBIConnector;
import org.jdbi.v3.core.Jdbi;

import java.util.List;

public class DistrictService {
    private Jdbi conn;
    private static DistrictService instance;

    private DistrictService() {
        conn = JDBIConnector.get();
    }

    public static DistrictService getInstance() {
        return instance != null ? instance : (instance = new DistrictService());
    }

    public List<District> getAll() {
        return conn.withExtension(DistrictDAO.class, DistrictDAO::getAll);
    }

    public String getSpecificId(String District) {
        return conn.withExtension(DistrictDAO.class, dao -> dao.getSpecificId(District));
    }

    public List<District> getDistrictByProvinceId(int provinceId) {
        return conn.withExtension(DistrictDAO.class, dao -> dao.getDistrictsByProvinceId(provinceId));
    }
}
