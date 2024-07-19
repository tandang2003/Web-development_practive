package com.nhom44.services;

import com.nhom44.DAO.ProjectDAO;
import com.nhom44.DAO.ServiceAccessCountDAO;
import com.nhom44.bean.ServiceAccessCount;
import com.nhom44.db.JDBIConnector;
import org.jdbi.v3.core.Jdbi;

import java.util.List;

public class ServiceAccessCountService {
    private static ServiceAccessCountService instance;
    private static Jdbi conn;

    private ServiceAccessCountService() {
        conn = JDBIConnector.get();
    }

    public static ServiceAccessCountService getInstance() {
        return instance != null ? instance : (instance = new ServiceAccessCountService());
    }

    public List<ServiceAccessCount> getServiceAccessCount() {
        return conn.withExtension(ServiceAccessCountDAO.class, dao -> dao.getServiceAccessCount());
    }

}
