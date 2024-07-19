package com.nhom44.DAO;

import com.nhom44.bean.Contact;
import org.jdbi.v3.sqlobject.config.RegisterBeanMapper;
import org.jdbi.v3.sqlobject.customizer.Bind;
import org.jdbi.v3.sqlobject.customizer.BindBean;
import org.jdbi.v3.sqlobject.statement.GetGeneratedKeys;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.SqlUpdate;

import java.util.List;

@RegisterBeanMapper(Contact.class)
public interface ContactDAO {
    @SqlUpdate("INSERT INTO contacts(fullname, email, phone, content,addressId,createdAt,updatedAt)" +
            " VALUES(:fullName, :email, :phone, :content,:addressId,NOW(),NOW())")
    @GetGeneratedKeys
    Integer add(@BindBean Contact contact);

    @SqlQuery("SELECT  c.*,ad.address as addressS " +
            "FROM contacts c JOIN " +
            "(SELECT ad.id, CONCAT(wa.fullName, ', ',di.fullName,', ',pr.fullName) as address " +
            "FROM addresses ad JOIN provinces pr ON ad.provinceId=pr.id " +
            "JOIN districts di ON ad.districtId=di.id " +
            "JOIN wards wa ON ad.wardId=wa.id) ad ON c.addressId=ad.id")
    List<Contact> getAll();

    @SqlQuery("SELECT * FROM contacts WHERE fullname=:fullName AND email=:email AND phone=:phone AND addressId=:addressId AND content=:content")
    Contact getContact(@BindBean Contact contact);

    @SqlQuery("SELECT * FROM contacts WHERE id=:id")
    Contact getById(@Bind("id") int id);
}
