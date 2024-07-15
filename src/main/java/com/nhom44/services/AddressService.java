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

    public void updateAddress(Address address) {
        conn.withExtension(AddressDAO.class, dao -> dao.updateAddress(address));
    }

    public String getAddressId(Address address) {
        return conn.withExtension(AddressDAO.class, dao -> dao.getAddressId(address));
    }

    public Address getAddressById(int addressId) {
        return conn.withExtension(AddressDAO.class, dao -> dao.getAddressById(addressId));
    }

    public boolean isContainAddress(String province, String district, String ward) {
        return getAddressId(Address.builder().districtId(Integer.parseInt(district)).provinceId(Integer.parseInt(province)).wardId(Integer.parseInt(ward)).build()) != null;
    }

    public int addAddress(Address address) {
        int id = conn.withExtension(AddressDAO.class, dao -> dao.insertAddress(address));
        return id;
    }

    public Address getAccCreatedAt(Timestamp createdAt) {
        return conn.withExtension(AddressDAO.class, dao -> dao.getCreatedAt(createdAt));
    }

    public Address getSpecificId(int addressId) {
        return conn.withExtension(AddressDAO.class, dao -> dao.getSpecificId(addressId));
    }

    public void getAddressFullName(Address address) {
        address.setFullName(conn.withExtension(AddressDAO.class, dao -> dao.getAddressFullName(address)));
    }

    public void getData(Address address) {
        Address address1 = conn.withExtension(AddressDAO.class, dao -> dao.getSpecificId(address.getId()));
        if (address1 == null) {
            return;
        }
        address.setProvinceId(address1.getProvinceId());
        address.setDistrictId(address1.getDistrictId());
        address.setWardId(address1.getWardId());
    }
    public static void main(String[] args) {
        System.out.println(getInstance().getSpecificId(12));
    }
}
