package com.nhom44.DAO;

import com.nhom44.bean.Cart;
import org.jdbi.v3.sqlobject.config.RegisterBeanMapper;
import org.jdbi.v3.sqlobject.customizer.Bind;
import org.jdbi.v3.sqlobject.customizer.BindBean;
import org.jdbi.v3.sqlobject.statement.GetGeneratedKeys;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.SqlUpdate;

import java.util.List;

@RegisterBeanMapper(Cart.class)
public interface CartDAO {
    @SqlUpdate("INSERT INTO carts(email, categoryId, addressId,width,height,representProjectId, createdAt, updatedAt) VALUES (:email,:categoryId, :addressId,:width,:height,:representProjectId, :createdAt, :updatedAt)")
    @GetGeneratedKeys
    Integer add(@BindBean Cart cart);

    @SqlUpdate("INSERT INTO carts_images(cartId, imageId) VALUES(:id, :imageId)")
    Integer addImage(@Bind("id") int id, @Bind("imageId") int imageId);

    @SqlUpdate("UPDATE carts SET isCheck=1 WHERE id=:cartId")
    Integer updateSuccessVerifyCart(@Bind("cartId") int cartId);

    @SqlQuery("SELECT c.*, categories.name as category, provinces.name as province FROM carts c " +
            "JOIN categories ON c.categoryId=categories.id " +
            "JOIN provinces ON c.provinceId=provinces.id " +
            "order by c.id desc"
    )
    List<Cart> getAll();

    @SqlQuery("SELECT * FROM carts WHERE id=:cartId")
    Cart getById(@Bind("cartId") int cartId);

    @SqlUpdate("INSERT INTO carts_services(cartId, serviceId) VALUES(:check, :integer)")
    Integer addService(@Bind("check") int check, @Bind("integer") Integer integer);

    @SqlQuery("SELECT serviceId FROM carts_services WHERE cartId=:id")
    List<Integer> getServices(@Bind("id") int id);

    //    @SqlQuery("SELECT  concat(i.path,'/',i.name)  FROM carts_images ci join images i on ci.imageId=i.id WHERE cartId=:id")
    @SqlQuery("SELECT imageId FROM carts_images where cartId=:id")
    List<Integer> getImages(@Bind("id") int id);

    @SqlQuery("Select id from carts where email=:email and isCheck=0")
    Integer checkingUnSent(@Bind("email") String email);

    @SqlUpdate("UPDATE carts SET email=:email, categoryId=:categoryId, addressId=:addressId, width=:width, height=:height, representProjectId=:representProjectId, updatedAt=NOW() WHERE id=:id")
    int update(@BindBean Cart cart);

    @SqlUpdate("DELETE FROM carts_services WHERE cartId=:id")
    Boolean deleteServices(@Bind("id") int id);

    @SqlQuery("SELECT i.name FROM carts_images ci join images i on ci.imageId=i.id WHERE cartId=:id")
    List<String> getImageNames(@Bind("id") int id);

    @SqlUpdate("DELETE FROM carts_images WHERE cartId=:id")
    Boolean deleteImages(@Bind("id") int id);

    @SqlUpdate("UPDATE carts SET isCheck=1 WHERE id=:id")
    Boolean updateCheckingIsSent(@Bind("id") int id);

    @SqlUpdate("DELETE FROM carts WHERE id=:id")
    boolean delete(@Bind("id") int id);
}
