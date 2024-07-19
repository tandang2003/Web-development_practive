package com.nhom44.DAO;

import com.nhom44.bean.Address;
import org.jdbi.v3.sqlobject.config.RegisterBeanMapper;
import org.jdbi.v3.sqlobject.customizer.Bind;
import org.jdbi.v3.sqlobject.customizer.BindBean;
import org.jdbi.v3.sqlobject.statement.GetGeneratedKeys;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.SqlUpdate;

import java.sql.Timestamp;

@RegisterBeanMapper(Address.class)
public interface AddressDAO {

    @SqlQuery("SELECT a.id " +
            "FROM addresses a left join provinces p on a.provinceId = p.id " +
            "left join districts d on a.districtId = d.id " +
            "left join wards w on a.wardId = w.id " +
            "WHERE p.id =:provinceId AND d.id =:districtId AND w.id =:wardId")
    String getAddressId(@BindBean Address address);


    @SqlQuery("SELECT * FROM addresses WHERE id =:addressId")
    Address getSpecificId(@Bind("addressId") int addressId);

    @SqlUpdate("INSERT INTO addresses(provinceId, districtId, wardId, createdAt) VALUES(:provinceId, :districtId, :wardId, now())")
    @GetGeneratedKeys
    int insertAddress(@BindBean Address address);

    @SqlQuery("SELECT * FROM addresses WHERE createdAt =:createdAt")
    Address getCreatedAt(@Bind("createdAt") Timestamp createdAt);

    @SqlQuery("SELECT id,provinceId,districtId,wardId FROM addresses WHERE id =:addressId")
    Address getAddressById(@Bind("addressId") int addressId);

    @SqlUpdate("UPDATE addresses SET provinceId=:provinceId, districtId=:districtId, wardId=:wardId WHERE id=:id")
    Boolean updateAddress(@BindBean Address address);
    @SqlQuery("SELECT concat( w.name, ', ', d.name, ', ',p.name) FROM addresses a " +
            "JOIN provinces p ON a.provinceId = p.id " +
            "JOIN districts d ON a.districtId = d.id " +
            "JOIN wards w ON a.wardId = w.id " +
            "WHERE a.id =:id")
    String getAddressFullName(@BindBean Address address);
}
