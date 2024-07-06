package com.nhom44.services;

import com.nhom44.DAO.AddressDAO;
import com.nhom44.bean.Address;
import com.nhom44.db.JDBIConnector;
import org.jdbi.v3.core.Jdbi;

import java.io.Serializable;
import java.sql.Timestamp;
import java.time.Instant;

public class AddressService implements Serializable {
    private static AddressService instance;
    private Jdbi conn;


    private AddressService() {
        conn = JDBIConnector.get();
    }

    public static AddressService getInstance() {
        return instance != null ? instance : (instance = new AddressService());
    }

    public String getAddressId(String province, String district, String ward) {
        return conn.withExtension(AddressDAO.class, dao -> dao.getAddressId(province, district, ward));
    }
    public Address getAddressById(int addressId) {
        return conn.withExtension(AddressDAO.class, dao -> dao.getAddressById(addressId));
    }

    public boolean isContainAddress(String province, String district, String ward) {
        return getAddressId(province, district, ward) != null;
    }

    public Address addAddress(Address address) {
        address.setCreatedAt(Timestamp.from(Instant.now()));
        int point = conn.withExtension(AddressDAO.class, dao -> {
            dao.insertAddress(address);
            return 1;
        });
        return point == 1 ? getAccCreatedAt(Timestamp.from(Instant.now())) : null;
    }
    public Address getAccCreatedAt(Timestamp createdAt) {
        return conn.withExtension(AddressDAO.class, dao -> dao.getCreatedAt(createdAt));
    }
    public String getSpecificId(String addressId) {
        return conn.withExtension(AddressDAO.class, dao -> dao.getSpecificId(addressId));
    }

    public static void main(String[] args) {
        Address address = new Address();
        address.setProvinceId(2);
        address.setDistrictId(145);
        address.setWardId(0);

        System.out.println(getInstance().getAddressById(12));
    }

}