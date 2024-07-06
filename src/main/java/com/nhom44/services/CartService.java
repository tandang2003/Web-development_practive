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

    public int add(Cart order) {
        Cart finalOrder = order;
        finalOrder.setAddressId(AddressService.getInstance().addAddress(order.getAddress()));
        int id = conn.withExtension(CartDAO.class, dao -> dao.add(finalOrder));
        for (int serviceId : order.getServices()) {
            CartService.getInstance().addService(id, serviceId);
        }
        for (String s : order.getImages()
        ) {
            int imageId = ImageService.getInstance().add(s);
            CartService.getInstance().addImage(id, imageId);
        }
        return id;
    }

    public void update(Cart order) {
        Cart finalOrder = order;
        AddressService.getInstance().updateAddress(order.getAddress());
        conn.withExtension(CartDAO.class, dao -> dao.update(finalOrder));
        CartService.getInstance().deleteServices(order.getId());
        for (int serviceId : order.getServices()) {
            CartService.getInstance().addService(order.getId(), serviceId);
        }
        CartService.getInstance().deleteImages(order.getId());
        for (String s : order.getImages()
        ) {
            int imageId = ImageService.getInstance().add(s);
            CartService.getInstance().addImage(order.getId(), imageId);
        }

    }

    public void deleteImages(int id) {
            List<Integer> images = conn.withExtension(CartDAO.class, dao -> dao.getImages(id));
            conn.withExtension(CartDAO.class, dao -> dao.deleteImages(id));
            for (int imageId : images) {
                ImageService.getInstance().delete(imageId);
            }
    }

    public List<Integer> getImages(int id) {
        return conn.withExtension(CartDAO.class, dao -> dao.getImages(id));

    }

    public List<String> getImageNames(int id) {
        System.out.println("id = " + id);
        return conn.withExtension(CartDAO.class, dao -> dao.getImageNames(id));
    }

    public void deleteServices(int id) {
        conn.withExtension(CartDAO.class, dao -> dao.deleteServices(id));
    }

    public int checkingUnSent(String email) {
        Integer result=conn.withExtension(CartDAO.class, dao -> dao.checkingUnSent(email));
        return result==null?0:result;
    }


    public void addService(int cartId, int serviceId) {
        conn.withExtension(CartDAO.class, dao -> dao.addService(cartId, serviceId));
    }


    public void addImage(int id, int imageId) {
        conn.withExtension(CartDAO.class, dao -> dao.addImage(id, imageId));
    }

    public int updateSuccessVerifyCart(int cartId) {
        return conn.withExtension(CartDAO.class, dao -> dao.updateSuccessVerifyCart(cartId));
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

    public void setCheckingIsSend(int id) {
        conn.withExtension(CartDAO.class, dao -> dao.updateCheckingIsSent(id));
    }

    public void delete(int i) {
        deleteImages(i);
        deleteServices(i);
        conn.withExtension(CartDAO.class, dao -> dao.delete(i));
    }

//    public List<String> getImages(int id) {
//        return conn.withExtension(CartDAO.class, dao -> dao.getImages(id));
//    }


}
