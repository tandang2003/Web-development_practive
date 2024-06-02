package com.nhom44.services;

import com.google.gson.Gson;
import com.nhom44.DAO.ProjectDAO;
import com.nhom44.DAO.SaveProjectDAO;
import com.nhom44.bean.SaveItem;
import com.nhom44.db.JDBIConnector;
import org.jdbi.v3.core.Jdbi;

import java.sql.Timestamp;
import java.time.Instant;

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
    public boolean saveProject(SaveItem saveItem) {
        return conn.withExtension(SaveProjectDAO.class, dao -> dao.saveProject(saveItem));
    }

    public boolean deleteSaveProject(SaveItem saveItem) {
        return conn.withExtension(SaveProjectDAO.class, dao -> dao.deleteSaveProject(saveItem));
    }

    public boolean isSaveProject(int projectId, int id) {
        return conn.withExtension(SaveProjectDAO.class, dao -> {
            return dao.isSaveProject(projectId, id);
        });
    }
    public SaveItem getSavedProject(int postId, int userId) {
        return conn.withExtension(SaveProjectDAO.class, dao -> {
            return dao.getSavedProject(postId, userId);
        });
    }

    public static void main(String[] args) {
        System.out.println(getInstance().isSaveProject(119,1));
    }
}
