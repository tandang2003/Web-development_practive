package com.nhom44.DAO;

import com.nhom44.bean.Cart;
import org.jdbi.v3.sqlobject.config.RegisterBeanMapper;
import org.jdbi.v3.sqlobject.customizer.Bind;
import org.jdbi.v3.sqlobject.customizer.BindBean;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.SqlUpdate;

import java.util.List;

@RegisterBeanMapper(Cart.class)
public interface CartDAO {
    @SqlUpdate("INSERT INTO carts(email, categoryId, provinceId,width,height,representProjectId, createdAt, updatedAt) VALUES (:email,:categoryId, :provinceId,:width,:height,:representProjectId, :createdAt, :updatedAt)")
    Integer add(@BindBean Cart cart);

    @SqlQuery("SELECT * From carts WHERE email=:email AND categoryId=:categoryId AND provinceId=:provinceId AND width=:width AND height=:height AND representProjectId=:representProjectId")
    Cart getByObject(@BindBean Cart cart);

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

    @SqlQuery("SELECT  concat(i.path,'/',i.name)  FROM carts_images ci join images i on ci.imageId=i.id WHERE cartId=:id")
    List<String> getImages(@Bind("id") int id);
}
