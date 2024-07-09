package com.nhom44.services;

import com.nhom44.DAO.AddressDAO;
import com.nhom44.DAO.ContactDAO;
import com.nhom44.bean.Contact;
import com.nhom44.db.JDBIConnector;
import org.jdbi.v3.core.Jdbi;

import java.util.List;

public class ContactService {
    private static Jdbi conn;
    private static ContactService instance;

    private ContactService() {
        conn = JDBIConnector.get();
    }

    public static ContactService getInstance() {
        return instance != null ? instance : (instance = new ContactService());
    }

    public int add(Contact contact) {
        AddressService.getInstance().addAddress(contact.getAddress());
        return conn.withExtension(ContactDAO.class, dao -> dao.add(contact));
    }

    public List<Contact> getAll() {
        List<Contact> contacts = conn.withExtension(ContactDAO.class, dao -> dao.getAll());
        contacts.forEach(contact -> {
            contact.setUpdatedAt(contact.getUpdatedAt().substring(0, 10));
        });
        return contacts;
    }


    public Contact getContact(Contact contact) {
        return conn.withExtension(ContactDAO.class, dao -> dao.getContact(contact));
    }
}
