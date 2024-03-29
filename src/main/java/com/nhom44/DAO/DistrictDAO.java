package com.nhom44.DAO;

import com.nhom44.bean.District;
import com.nhom44.bean.Ward;
import org.jdbi.v3.sqlobject.config.RegisterBeanMapper;
import org.jdbi.v3.sqlobject.customizer.Bind;
import org.jdbi.v3.sqlobject.statement.SqlQuery;

import java.util.List;

@RegisterBeanMapper(District.class)
public interface DistrictDAO {
    @SqlQuery("SELECT * FROM districts")
    List<District> getAll();

    @SqlQuery("SELECT id FROM districts where name=:name")
    String getSpecificId(@Bind("name") String name);

    List<District> getByProvinceId(int provinceId);

    List<Ward> getWardByDistrictId(int districtId);
}
