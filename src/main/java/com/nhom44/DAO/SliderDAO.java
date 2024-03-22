package com.nhom44.DAO;

import com.nhom44.bean.Slider;
import org.jdbi.v3.sqlobject.config.RegisterBeanMapper;
import org.jdbi.v3.sqlobject.customizer.Bind;
import org.jdbi.v3.sqlobject.customizer.BindBean;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.SqlUpdate;

import java.util.List;

@RegisterBeanMapper(Slider.class)
public interface SliderDAO {
    @SqlQuery("SELECT * FROM sliders")
    List<Slider> getAll();
    @SqlUpdate("INSERT INTO sliders(title, avatar, sequence,status) VALUES (:title, :avatar, :sequence,:status)")
    Integer add(@BindBean Slider slider);
    @SqlUpdate("UPDATE sliders SET title =:title, avatar =:avatar, sequence =:sequence, status=:status, updatedAt=now() WHERE id =:id")
    Integer update(@BindBean Slider slider);
    @SqlQuery("SELECT EXISTS(SELECT id FROM sliders WHERE avatar =:avatar)")
    Boolean isExist(@BindBean Slider slider);
    @SqlQuery("SELECT * FROM sliders WHERE id = :id")
    Slider getById(@Bind("id") int id);
    @SqlQuery("SELECT * FROM sliders WHERE status = 1")
    List<Slider> getAllActive();
    @SqlUpdate("DELETE FROM sliders WHERE id = :id")
    Integer delete(@Bind("id") int id);

}
