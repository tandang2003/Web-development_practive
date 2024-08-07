package com.nhom44.DAO;


import com.nhom44.bean.User;
import org.jdbi.v3.sqlobject.config.RegisterBeanMapper;
import org.jdbi.v3.sqlobject.customizer.Bind;
import org.jdbi.v3.sqlobject.customizer.BindBean;
import org.jdbi.v3.sqlobject.statement.GetGeneratedKeys;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.SqlUpdate;

import java.sql.Date;
import java.util.List;

@RegisterBeanMapper(User.class)
public interface UserDAO {
    @SqlUpdate("INSERT INTO users(fullname, email, password, roleId, phone , addressId, birthday, gender, status)" +
            " VALUES(:fullname,:email,:password,:roleId, :phone,:addressId ,:birthday, :gender, :status)")
    @GetGeneratedKeys
    int insertUser(@Bind("fullname") String fulllName, @Bind("email") String email,
                   @Bind("password") String password,
                   @Bind("roleId") int roleId, @Bind("phone") String phone,
                   @Bind("addressId") int addressId, @Bind("gender") int gender, @Bind("birthday") Date birthday,
                   @Bind("status") int status);

    @SqlUpdate("UPDATE users SET fullname =:fullName , email =:email , password =:password, roleId =:roleId,avatar=:avatar,phone=:phone, birthday=:birthday," +
            " gender=:gender, status=:status ,updatedAt=now() WHERE email=:oldEmail")
    int updateUser(@BindBean User user, @Bind("oldEmail") String oldEmail);

    @SqlUpdate("UPDATE users SET fullname =:fullName , email =:email , password =:password, " +
            "roleId =:roleId, phone=:phone, birthday=:birthday, addressId=:addressId, " +
            "gender=:gender, status=:status ,updatedAt=now() WHERE id=:id")
    int updateUser(@BindBean User user);

    @SqlUpdate("UPDATE users SET addressId=:addressId WHERE email=:email")
    int updateProvinceForUser(@Bind("provinceId") int provinceId, @Bind("email") String email);

    @SqlQuery("Select u.id, u.fullname, u.email,u.password,u.phone, u.gender,u.status,u.roleId, a.id as addressId " +
            "FROM users u Left Join addresses a ON u.addressId=a.id")
    List<User> getAllUser();

    @SqlQuery("Select COUNT(u.email) FROM users u WHERE u.email=:email")
    int NumOfSameEmailContain(@Bind("email") String email);

    @SqlQuery("Select u.id FROM users u WHERE u.email=:email")
    int getIdUserWithEmail(@Bind("email") String email);

    @SqlQuery("Select u.* FROM users u JOIN users_projects up ON u.id=up.userId WHERE up.projectId=:projectId")
    User getUserOwnerOfProject(@Bind("projectId") String projectId);

    @SqlQuery("Select u.id, u.fullname, u.email,u.password, u.phone, u.gender,u.status,u.roleId, u.birthday,a.id as addressId, p.id as provinceId, d.id as districtId, w.id as wardId " +
            "FROM users u Left Join addresses a ON u.addressId=a.id left join provinces p on p.id = a.provinceId " +
            "left join districts d on d.id = a.districtId left join wards w on w.id = a.wardId where u.email=:email")
    User getUserByEmail(@Bind("email") String email);

    @SqlQuery("SELECT u.email From users_projects up Left JOIN users u ON u.id=up.userId  right join projects p ON p.id=up.projectId ")
    List<String> getEmailOwner();

    @SqlQuery("SELECT * FROM users WHERE email=:email AND password=:password")
    User login(@Bind("email") String email, @Bind("password") String password);

    @SqlUpdate("UPDATE users SET status=1 WHERE id=:id")
    Boolean updateSuccessVerify(@Bind("id") int id);

    @SqlQuery("Select * FROM users u where u.email=:email AND u.status=1")
    User getUserByEmailForCustomer(@Bind("email") String email);

    @SqlUpdate("INSERT INTO users(email,password,fullName,roleId,status) VALUES(:email,:password,:fullName,:roleId,:status)")
    Integer insertGoogleUser(@BindBean User user);

    @SqlUpdate("UPDATE users SET password=:password WHERE email=:email")
    Boolean updatePassword(@Bind("email") String email, @Bind("password") String password);
    @SqlQuery("SELECT * FROM users WHERE id=:id")
    User getUserById(@Bind("id")int id);

    @SqlUpdate("INSERT INTO users(email,password,fullName,roleId,status) VALUES(:email,:password,:fullName,:roleId,:status)")
    Integer insertFacebookUser(@BindBean User user);
    @SqlQuery("SELECT roleId FROM users WHERE id=:id")
    Integer getRole(@Bind("id")int id);
}