package com.nhom44.services;

import com.nhom44.DAO.SliderDAO;
import com.nhom44.bean.Slider;
import com.nhom44.db.JDBIConnector;
import org.jdbi.v3.core.Jdbi;

import java.util.List;

public class SliderService {
    private static SliderService instance;
    private Jdbi conn;
    private SliderService() {
        conn = JDBIConnector.get();
    }
    public static SliderService getInstance() {
        if (instance == null) {
            instance = new SliderService();
        }
        return instance;
    }
    public List<Slider> getAll() {
        return conn.withExtension(SliderDAO.class, dao -> dao.getAll());
    }

    public static void main(String[] args) {
        List<Slider> sliders = SliderService.getInstance().getAll();
        System.out.println(sliders);
    }

    public int add(Slider slider) {
        return conn.withExtension(SliderDAO.class, dao -> dao.add(slider));
    }
    public int update(Slider slider) {
        return conn.withExtension(SliderDAO.class, dao -> dao.update(slider));
    }

    public Slider getById(int id) {
        return conn.withExtension(SliderDAO.class, dao -> dao.getById(id));
    }

    public List<Slider> getAllActive() {
        return conn.withExtension(SliderDAO.class, dao -> dao.getAllActive());
    }

    public void delete(int id) {
        conn.withExtension(SliderDAO.class, dao -> dao.delete(id));
    }
}
