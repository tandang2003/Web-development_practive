package com.nhom44.services;

import com.nhom44.bean.Log;
import com.nhom44.db.JDBIConnector;
import org.jdbi.v3.core.Jdbi;

public class LogServices {
    private static LogServices instance;
    private static Jdbi conn;
    private LogServices() {
        conn= JDBIConnector.get();
    }
    public static LogServices getInstance() {
        return instance != null ? instance : (instance = new LogServices());
    }
    public void insert(Log log) {
        conn.withExtension(com.nhom44.DAO.LogDAO.class, dao -> dao.insert(log));
    }
}
