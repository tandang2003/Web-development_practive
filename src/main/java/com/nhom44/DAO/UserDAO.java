package com.nhom44.DAO;


import com.nhom44.bean.User;
import org.jdbi.v3.sqlobject.config.RegisterBeanMapper;
import org.jdbi.v3.sqlobject.customizer.Bind;
import org.jdbi.v3.sqlobject.customizer.BindBean;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.SqlUpdate;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

@RegisterBeanMapper(User.class)
public interface UserDAO {
    @SqlUpdate("INSERT INTO users(fullname, email, password, role, phone , provinceId, birthday, gender, status)" +
                         " VALUES(:fullname,:email,:password,:role, :phone,:provinceId ,:birthday, :gender, :status)")
    int insertUser(@Bind("fullname") String fulllName, @Bind("email") String email,
                   @Bind("password") String password,
                   @Bind("role") int role,  @Bind("phone") String phone,
                   @Bind("provinceId") int provinceId, @Bind("gender") int gender, @Bind("birthday") Date birthday,
                   @Bind("status") int status);

    @SqlUpdate("UPDATE users SET fullname =:fullName , email =:email , password =:password, role =:role,avatar=:avatar,phone=:phone, birthday=:birthday," +
            " gender=:gender, status=:status ,updated_at=now() WHERE email=:oldEmail")
    int updateUser(@BindBean User user,@Bind("oldEmail") String oldEmail);
    @SqlUpdate("UPDATE users SET fullname =:fullName , email =:email , password =:password, " +
            "role =:role,phone=:phone, birthday=:birthday, provinceId=:provinceId, " +
            "gender=:gender, status=:status ,updated_at=now() WHERE id=:id")
    int updateUser(@BindBean User user);
    @SqlUpdate("UPDATE users SET provinceId=:provinceId WHERE email=:email")
    int updateProvinceForUser(@Bind("provinceId") int provinceId,@Bind("email") String email);

    @SqlQuery("Select u.fullname, u.email,u.password,u.phone, u.gender,u.status,u.role,p.name as province " +
            "FROM users u Left Join provinces p ON u.provinceId=p.id")
    List<User> getAllUser();

    @SqlQuery("Select COUNT(u.email) FROM users u WHERE u.email=:email")
    int NumOfSameEmailContain(@Bind("email") String email);

    @SqlQuery("Select u.id FROM users u WHERE u.email=:email")
    int getIdUserWithEmail(@Bind("email") String email);
    @SqlQuery("Select u.* FROM users u JOIN users_projects up ON u.id=up.userId WHERE up.projectId=:projectId")
    User getUserOwnerOfProject(@Bind("projectId") int projectId);
@SqlQuery("Select u.id, u.fullname, u.email,u.password, u.phone, u.gender,u.status,u.role, u.birthday,p.name as province " +
        "FROM users u Left Join provinces p ON u.provinceId=p.id where u.email=:email")
        User getUserByEmail(@Bind("email") String email);
    @SqlQuery("SELECT u.email From users_projects up Left JOIN users u ON u.id=up.userId  right join projects p ON p.id=up.projectId ")
    List<String> getEmailOwner();
    @SqlQuery("SELECT * FROM users WHERE email=:email AND password=:password")
    User login(@Bind("email") String email,@Bind("password") String password);
    @SqlUpdate("UPDATE users SET status=1 WHERE id=:id")
    Boolean updateSuccessVerify(@Bind("id") int id);
    @SqlQuery("Select u.id, u.fullname, u.email,u.password, u.phone, u.gender,u.status,u.role, u.birthday,p.name as province " +
            "FROM users u Left Join provinces p ON u.provinceId=p.id where u.email=:email AND u.status=1")
    User getUserByEmailForCustomer(@Bind("email") String email);
    @SqlUpdate("INSERT INTO users(email,password,fullName,role,status) VALUES(:email,:password,:fullName,:role,:status)")
    Integer insertGoogleUser(@BindBean User user);

    @SqlQuery("SELECT * FROM users WHERE id=:id AND email=:email AND updated_at=:updateAt AND created_at=:createAt")
    User getUserByTimeAndEmail(@Bind("id") int id, @Bind("email") String email, @Bind("updated_at") Timestamp update_at,@Bind("create_at") Timestamp create_at);
}
