package com.nhom44.DAO;

import com.nhom44.bean.Ward;
import org.jdbi.v3.sqlobject.config.RegisterBeanMapper;
import org.jdbi.v3.sqlobject.customizer.Bind;
import org.jdbi.v3.sqlobject.statement.SqlQuery;

import java.util.List;

@RegisterBeanMapper(Ward.class)
public interface WardDAO {
    @SqlQuery("SELECT * FROM wards")
    List<Ward> getAll();

    @SqlQuery("SELECT id FROM wards where name=:name")
    String getSpecificId(@Bind("name") String name);
    @SqlQuery("SELECT id, name, fullName, districtId FROM wards WHERE districtId = :districtId")
    List<Ward> getWardByDistrictId(@Bind("districtId") int districtId);
}
