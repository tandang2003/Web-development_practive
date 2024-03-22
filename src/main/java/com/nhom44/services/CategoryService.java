package com.nhom44.services;

import com.nhom44.DAO.CategoryDAO;
import com.nhom44.bean.Category;
import com.nhom44.db.JDBIConnector;
import org.jdbi.v3.core.Jdbi;

import java.util.List;

public class CategoryService {
    private static Jdbi conn;
    private static CategoryService instance;
    private CategoryService() {
        conn = JDBIConnector.get();
    }
    public static CategoryService getInstance() {
        return instance != null ? instance : (instance = new CategoryService());
    }
    public List<Category> getAll() {
        return conn.withExtension(CategoryDAO.class, dao -> dao.getAll());

    }

    public static void main(String[] args) {
        CategoryService categoryService = CategoryService.getInstance();
        List<Category> categories = categoryService.getAll();
        System.out.println(categories);
    }

    public Category getById(int id) {
        return conn.withExtension(CategoryDAO.class, dao -> dao.getById(id));
    }

    public int add(Category category) {
        if(existCategory(category.getName())){
            return -1;
        }
        int status = conn.withExtension(CategoryDAO.class, dao -> dao.add(category));
       return status;
    }

    private boolean existCategory(String name) {
        return conn.withExtension(CategoryDAO.class, dao -> dao.existCategory(name));
    }

    public int update(Category category) {
        if(existCategory(category.getName())){
            return -1;
        }
        return conn.withExtension(CategoryDAO.class, dao -> dao.update(category));
    }

    public List<Category> getAllActive() {
        return conn.withExtension(CategoryDAO.class, dao -> dao.getAllActive());
    }
}
