package com.nhom44.services;

import com.google.api.client.util.DateTime;
import com.nhom44.DAO.ProvinceDAO;
import com.nhom44.DAO.UserDAO;
import com.nhom44.bean.User;
import com.nhom44.db.JDBIConnector;
import com.nhom44.util.StringUtil;
import org.jdbi.v3.core.Jdbi;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;


public class UserService {
    private static UserService instance;
    private Jdbi conn;

    private UserService() {
        conn = JDBIConnector.get();
    }

    public static UserService getInstance() {
        return instance != null ? instance : (instance = new UserService());
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

// address
    public User additional(String email, String password, String name, Date birthday, String phone, String province, String isMale, String status, String role, String addressId) {
        User user = new User();
        user.setEmail(email);
        user.setPassword(StringUtil.hashPassword(password));
        user.setFullName(name);
        user.setBirthday(new java.sql.Date(birthday.getTime()));
        user.setPhone(phone);

        user.setProvince(province);
        user.setGender(isMale != null ? 1 : 0);
        user.setStatus(Integer.parseInt(status));
        user.setRole(Integer.parseInt(role));
        String idProvince = conn.withExtension(ProvinceDAO.class, handle -> handle.getSpecificId(user.getProvince()));
        int line = Integer.MIN_VALUE;
        line = conn.withExtension(UserDAO.class, handle -> handle.insertUser(user.getFullName(),
                user.getEmail(), user.getPassword(),
                user.getRole(), user.getPhone(), Integer.parseInt(idProvince),
                user.getGender(), (java.sql.Date) user.getBirthday(), user.getStatus()));
        if (line == 1) {
            user.setPassword(null);
            return user;
        }
        return user;
    }

    public User addUser(User user) {
        user.setCreatedAt(new Timestamp(System.currentTimeMillis()));
        user.setUpdatedAt(new Timestamp(System.currentTimeMillis()));
        UserService userService = UserService.getInstance();
        User u = userService.getUserByTimeAndEmail(user.getId(), user.getEmail(), user.getUpdatedAt(), user.getCreatedAt());
        if (u != null) {
            return null;
        }
        return conn.withExtension(UserDAO.class, dao -> dao)
                .insertUser(user.getFullName(), user.getEmail(), user.getPassword(), user.getRole(), user.getPhone(), user.getProvinceId(), user.getGender(), user.getBirthday(), user.getStatus()) == 1 ? getUserByEmail(user.getEmail()) : null;
    }

    private User getUserByTimeAndEmail(int id, String email, Timestamp update_at, Timestamp create_at) {
        return conn.withExtension(UserDAO.class, dao -> dao.getUserByTimeAndEmail(id, email, update_at, create_at));
    }
    private int updateProvinceId(int id, String email) {
        return conn.withExtension(UserDAO.class, dao -> dao.updateProvinceForUser(id, email));
    }

    public User update(User user) {
        System.out.println("userupdated" + user.toString());
        int check = conn.withExtension(UserDAO.class, dao -> dao.updateUser(user));
        return check == 1 ? conn.withExtension(UserDAO.class, dao -> dao.login(user.getEmail(), user.getPassword())) : null;
    }

    public int update(String oldEmail, String email, String password, String name, Date birthday, String phone, String province, String isMale, String status, String role) {
        String idProvince = ProvinceService.getInstance().getSpecificId(province);
        try {
            if (!oldEmail.equals(email)) {
                User u = getUserByEmail(email);
                if (u != null) {
                    throw new Exception("Email đã tồn tại");
                }
            }
            User user = new User();
            user.setEmail(email);
            user.setPassword(StringUtil.hashPassword(password));
            user.setFullName(name);
            user.setBirthday(new java.sql.Date(birthday.getTime()));
            user.setPhone(phone);
            user.setGender(isMale != null ? 1 : 0);
            user.setStatus(Integer.parseInt(status));
            user.setRole(Integer.parseInt(role));
            int id = Integer.parseInt(idProvince);
            int checkUpdateProvince = updateProvinceId(id, oldEmail);
            int checkUpdateOther = conn.withExtension(UserDAO.class, dao -> dao.updateUser(user, oldEmail));
            return Math.max(checkUpdateOther, checkUpdateProvince);
        } catch (Throwable t) {
            return -1;
        }
    }

    public User getUserOwnerOfProject(int projectId) {
        return conn.withExtension(UserDAO.class, dao -> dao.getUserOwnerOfProject(projectId));
    }


    public User getUserByEmail(String email) {
        return conn.withExtension(UserDAO.class, dao -> dao.getUserByEmail(email));
    }

    public List<String> getEmailOwner() {
        return conn.withExtension(UserDAO.class, dao -> dao.getEmailOwner());
    }

    public static void main(String[] args) {
        System.out.println(getInstance().getEmailOwner());
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
}
