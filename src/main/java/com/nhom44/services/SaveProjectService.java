package com.nhom44.services;

import com.google.gson.Gson;
import com.nhom44.DAO.ProjectDAO;
import com.nhom44.DAO.SaveProjectDAO;
import com.nhom44.bean.SaveItem;
import com.nhom44.db.JDBIConnector;
import org.jdbi.v3.core.Jdbi;

public class SaveProjectService {
    private static SaveProjectService instance;
private Jdbi conn;
    private SaveProjectService() {
        conn = JDBIConnector.get();
    }

    public static SaveProjectService getInstance() {
        if (instance == null) {
            instance = new SaveProjectService();
        }

        return instance;
    }
    public boolean saveProject(int projectId, int userId) {
        return conn.withExtension(SaveProjectDAO.class, dao -> dao.saveProject(projectId, userId));
    }

    public boolean deleteSaveProject(int projectId, int id) {
        return conn.withExtension(SaveProjectDAO.class, dao -> dao.deleteSaveProject(projectId, id));
    }

    public boolean isSaveProject(int projectId, int id) {
        return conn.withExtension(SaveProjectDAO.class, dao -> {
            return dao.isSaveProject(projectId, id);
        });
    }
    public SaveItem getSavedProject(String updatedAt) {
        return conn.withExtension(SaveProjectDAO.class, dao -> {
            return dao.getSavedProject(updatedAt);
        });
    }

    public static void main(String[] args) {
        System.out.println(new Gson().toJson(SaveProjectService.getInstance().getSavedProject("2024-01-26 13:10:26.000")));
    }
}
