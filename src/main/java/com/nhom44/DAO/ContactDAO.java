package com.nhom44.DAO;

import com.nhom44.bean.Contact;
import org.jdbi.v3.sqlobject.config.RegisterBeanMapper;
import org.jdbi.v3.sqlobject.customizer.BindBean;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.SqlUpdate;

import java.util.List;

@RegisterBeanMapper(Contact.class)
public interface ContactDAO {
    @SqlUpdate("INSERT INTO contacts(fullname, email, phone, content)" +
            " VALUES(:fullName, :email, :phone, :content)")
    Integer add(@BindBean Contact contact);

    @SqlQuery("SELECT * FROM contacts")
    List<Contact> getAll();
@SqlQuery("SELECT * FROM contacts WHERE fullname=:fullName AND email=:email AND phone=:phone AND address=:address AND content=:content")
    Contact getContact(@BindBean Contact contact);
}
