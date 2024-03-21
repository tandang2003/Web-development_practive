package com.nhom44.services;

import com.nhom44.DAO.CartDAO;
import com.nhom44.bean.Cart;
import com.nhom44.db.JDBIConnector;
import org.jdbi.v3.core.Jdbi;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.List;

public class CartService implements Serializable {
    private static CartService instance;
    private Jdbi conn;

    private CartService() {
        conn = JDBIConnector.get();
    }

    public static CartService getInstance() {
        return instance != null ? instance : (instance = new CartService());
    }

    public Cart add(Cart cart) {
        String now = Timestamp.valueOf(java.time.LocalDateTime.now()).toString();
        cart.setCreatedAt(now);
        cart.setUpdatedAt(now);
        int check = conn.withExtension(CartDAO.class, dao -> dao.add(cart));
        cart.setId(check == 1 ? getByObject(cart).getId() : 0);
        return cart;
    }


    public void addService(int cartId, int serviceId) {
        conn.withExtension(CartDAO.class, dao -> dao.addService(cartId,serviceId));
    }

    private Cart getByObject(Cart cart) {
        return conn.withExtension(CartDAO.class, dao -> dao.getByObject(cart));
    }

    public void addImage(int id, int imageId) {
        conn.withExtension(CartDAO.class, dao -> dao.addImage(id, imageId));
    }

    public void updateSuccessVerifyCart(int cartId) {
        conn.withExtension(CartDAO.class, dao -> dao.updateSuccessVerifyCart(cartId));
    }

    public List<Cart> getAll() {
        return conn.withExtension(CartDAO.class, dao -> dao.getAll());
    }

    public static void main(String[] args) {
        List<Cart> carts = CartService.getInstance().getAll();

    }

    public Cart getById(int cartId) {
        return conn.withExtension(CartDAO.class, dao -> dao.getById(cartId));
    }

    public List<Integer> getServices(int id) {
        return conn.withExtension(CartDAO.class, dao -> dao.getServices(id));
    }

    public List<String> getImages(int id) {
        return conn.withExtension(CartDAO.class, dao -> dao.getImages(id));
    }
}
