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
    @SqlUpdate("INSERT INTO carts(email, categoryId, addressId,width,height,representProjectId,isCheck,) VALUES (:email,:categoryId, :addressId,:width,:height,:representProjectId,2,)")
    @GetGeneratedKeys
    Integer add(@BindBean Cart cart);

    @SqlUpdate("INSERT INTO carts_images(cartId, imageId) VALUES(:id, :imageId)")
    Integer addImage(@Bind("id") int id, @Bind("imageId") int imageId);

    @SqlUpdate("UPDATE carts SET isCheck=2 WHERE id=:cartId")
    Integer updateSuccessVerifyCart(@Bind("cartId") int cartId);

    @SqlQuery("SELECT c.*, categories.name as category, ad.name as addressS FROM carts c " +
            "JOIN categories ON c.categoryId=categories.id " +
            "JOIN (SELECT ad.id, CONCAT(w.fullName,', ',d.fullName,', ',pr.fullName) as name " +
            "FROM addresses ad  " +
            "JOIN provinces pr ON pr.id=ad.provinceId  " +
            "JOIN districts d ON ad.districtId=d.id  " +
            "JOIN wards w ON ad.wardId=w.id  " +
            ") as ad ON c.addressId=ad.id  " +
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

    @SqlUpdate("UPDATE carts SET email=:email, categoryId=:categoryId, addressId=:addressId, width=:width, height=:height, representProjectId=:representProjectId,isCheck=:isCheck, updatedAt=NOW() WHERE id=:id")
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
