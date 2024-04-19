package com.nhom44.services;

import com.nhom44.DAO.AddressDAO;
import com.nhom44.bean.Address;
import com.nhom44.db.JDBIConnector;
import org.jdbi.v3.core.Jdbi;

import java.io.Serializable;

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

    public boolean isContainAddress(String province, String district, String ward) {
        return getAddressId(province, district, ward) != null;
    }

    public Address addAddress(Address address) {
        int point = conn.withExtension(AddressDAO.class, dao -> {
            dao.insertAddress(address.getProvinceId(), address.getDistrictId(), address.getWardId());
            return 1;
        });
        return point == 1 ? address : null;
    }

    public String getSpecificId(String addressId) {
        return conn.withExtension(AddressDAO.class, dao -> dao.getSpecificId(addressId));
    }

    public static void main(String[] args) {
        Address address = new Address();
        address.setProvinceId(2);
        address.setDistrictId(145);
        address.setWardId(0);
        System.out.println(getInstance().addAddress(address));
    }

}
