package com.nhom44.DAO;

import com.nhom44.bean.District;
import com.nhom44.bean.Province;
import org.jdbi.v3.sqlobject.config.RegisterBeanMapper;
import org.jdbi.v3.sqlobject.config.RegisterFieldMapper;
import org.jdbi.v3.sqlobject.customizer.Bind;
import org.jdbi.v3.sqlobject.statement.SqlQuery;

import java.util.List;

@RegisterBeanMapper(Province.class)
public interface ProvinceDAO {
    @SqlQuery("SELECT id, name, fullName FROM provinces")
    List<Province> getAll();

//    @SqlQuery("SELECT id FROM addresses where id=:addressId")
//    String getSpecificId(@Bind("addressId") String addressId);
//    String getIdProvinceWithName(String province);
}
