package com.nhom44.DAO;

import com.nhom44.bean.Address;
import org.jdbi.v3.sqlobject.config.RegisterBeanMapper;
import org.jdbi.v3.sqlobject.customizer.Bind;
import org.jdbi.v3.sqlobject.customizer.BindBean;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.SqlUpdate;

import java.sql.Timestamp;

@RegisterBeanMapper(Address.class)
public interface AddressDAO {

    @SqlQuery("SELECT a.id " +
            "FROM addresses a left join provinces p on a.provinceId = p.id " +
            "left join districts d on a.districtId = d.id " +
            "left join wards w on a.wardId = w.id " +
            "WHERE p.id = :province AND d.id = :district AND w.id = :ward")
    String getAddressId(@Bind("province") String province, @Bind("district") String district, @Bind("ward") String ward);


    @SqlQuery("SELECT id " + "FROM addresses " + "WHERE id = :addressId")
    String getSpecificId(@Bind("addressId") String addressId);

    @SqlUpdate("INSERT INTO addresses(provinceId, districtId, wardId, createdAt) VALUES(:provinceId, :districtId, :wardId, now())")
    int insertAddress(@BindBean Address address);

    @SqlQuery("SELECT * FROM addresses WHERE createdAt = :createdAt")
    Address getCreatedAt(@Bind("createdAt") Timestamp createdAt);

    @SqlQuery("SELECT id,provinceId,districtId,wardId FROM addresses WHERE id = :addressId")
    Address getAddressById(@Bind("addressId") int addressId);
}