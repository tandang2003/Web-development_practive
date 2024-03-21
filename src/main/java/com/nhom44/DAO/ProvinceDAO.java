package com.nhom44.DAO;

import com.nhom44.bean.Province;
import org.jdbi.v3.sqlobject.config.RegisterBeanMapper;
import org.jdbi.v3.sqlobject.config.RegisterFieldMapper;
import org.jdbi.v3.sqlobject.customizer.Bind;
import org.jdbi.v3.sqlobject.statement.SqlQuery;

import java.util.List;

@RegisterBeanMapper(Province.class)
public interface ProvinceDAO {
    @SqlQuery("SELECT * FROM provinces")
    List<Province> getAll();

    @SqlQuery("SELECT id FROM provinces where name=:name")
    String getSpecificId(@Bind("name") String name);

    String getIdProvinceWithName(String province);
}
