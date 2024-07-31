package com.nhom44.services;

import com.nhom44.DAO.LogDAO;
import com.nhom44.db.JDBIConnector;
import com.nhom44.log.model.Log;
import org.jdbi.v3.core.Jdbi;

import java.util.List;

public class LogsService {
    private static LogsService instance;
    private static Jdbi conn;

    private LogsService() {
        conn = JDBIConnector.get();
    }
    public static LogsService getInstance() {
        return instance != null ? instance : (instance = new LogsService());
    }
    public List<Log> getAllLogs() {
        return conn.withExtension(LogDAO.class, dao -> dao.getAllLogs());
    }

    public boolean deleteLogs(int[] ids) {
        boolean success = true;
        for (int id : ids) {
            int result = conn.withExtension(LogDAO.class, dao -> dao.deleteLog(id));
            if (result != 1) {
                success = false;
                break;
            }
        }
        return success;
    }
}
