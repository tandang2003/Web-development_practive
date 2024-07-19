package com.nhom44.services;

import com.google.api.client.util.DateTime;
import com.nhom44.DAO.AddressDAO;
import com.nhom44.DAO.ProvinceDAO;
import com.nhom44.DAO.UserDAO;
import com.nhom44.bean.Address;
import com.nhom44.bean.User;
import com.nhom44.db.JDBIConnector;
import com.nhom44.util.StringUtil;
import org.jdbi.v3.core.Jdbi;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;


public class UserService {
    private static UserService instance;
    private static Jdbi conn;

    private UserService() {
        conn = JDBIConnector.get();
    }

    public static UserService getInstance() {
        return instance != null ? instance : (instance = new UserService());
    }
    public void FacebookAdditional(User user) {
        user.setPassword(StringUtil.hashPassword(user.getPassword()));
        conn.withExtension(UserDAO.class, dao -> dao.insertFacebookUser(user));
    }
    public List<User> getAllUser() {
        return conn.withExtension(UserDAO.class, dao -> dao.getAllUser());
    }

    public int getIdUserWithEmail(String email) {
        return conn.withExtension(UserDAO.class, dao -> dao.getIdUserWithEmail(email));

    }

    public boolean isContainEmail(String email) {
        return conn.withExtension(UserDAO.class, dao -> dao.NumOfSameEmailContain(email)) == 1;
    }

    public User addUser(User user) {
        int addressId = AddressService.getInstance().addAddress(user.getAddress());
        user.setAddressId(addressId);
        int id = conn.withExtension(UserDAO.class, handle -> handle.insertUser(user.getFullName(),
                user.getEmail(), StringUtil.hashPassword(user.getPassword()),
                user.getRole(), user.getPhone(), user.getAddressId(),
                user.getGender(), (java.sql.Date) user.getBirthday(), user.getStatus()));
        if (id != 0) {
            user.setId(id);
            user.setPassword(null);
        }
        return user;
    }


    public User getUserById(int id) {
        return conn.withExtension(UserDAO.class, dao -> {
            User user=dao.getUserById(id);
            user.setAddress(AddressService.getInstance().getAddressById(user.getAddressId()));
            return user;
        });
    }

    public User update(User user) {
        System.out.println(user);
        AddressService.getInstance().updateAddress(user.getAddress());
        int check = conn.withExtension(UserDAO.class, dao -> dao.updateUser(user));
        return check == 1 ? conn.withExtension(UserDAO.class, dao -> dao.login(user.getEmail(), user.getPassword())) : null;
    }



    public User getUserOwnerOfProject(String projectId) {
        return conn.withExtension(UserDAO.class, dao -> dao.getUserOwnerOfProject(projectId));
    }


    public User getUserByEmail(String email) {
        return conn.withExtension(UserDAO.class, dao -> dao.getUserByEmail(email));
    }

    public List<String> getEmailOwner() {
        return conn.withExtension(UserDAO.class, dao -> dao.getEmailOwner());
    }


    public User login(String email, String password) {
        return conn.withExtension(UserDAO.class, dao -> {
            String hash = StringUtil.hashPassword(password);
            return dao.login(email, hash);
        });
    }

    public boolean updateSuccessVerify(int id) {
        return conn.withExtension(UserDAO.class, dao -> dao.updateSuccessVerify(id));
    }

    public User getUserByEmailForCustomer(String email) {
        return conn.withExtension(UserDAO.class, dao -> dao.getUserByEmailForCustomer(email));
    }

    public void GoogleAdditional(User user) {
        user.setPassword(StringUtil.hashPassword(user.getPassword()));
        conn.withExtension(UserDAO.class, dao -> dao.insertGoogleUser(user));
    }

    public boolean updatePassword(String email, String newPw) {
        return conn.withExtension(UserDAO.class, dao -> dao.updatePassword(email, StringUtil.hashPassword(newPw)));
    }

    public int getRole(int id) {
        return conn.withExtension(UserDAO.class, dao -> dao.getRole(id));
    }

    public static void main(String[] args) {
        UserService userService = UserService.getInstance();
        System.out.println(userService.getRole(34));
    }
}
