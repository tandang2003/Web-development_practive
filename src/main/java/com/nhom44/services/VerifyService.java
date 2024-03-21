
package com.nhom44.services;

import com.nhom44.DAO.VerifyDAO;
import com.nhom44.db.JDBIConnector;
import org.jdbi.v3.core.Jdbi;

public class VerifyService {
    private Jdbi conn = JDBIConnector.get();
    private static VerifyService instance;

    private VerifyService() {
    }

    public static VerifyService getInstance() {
        if (instance == null) {
            instance = new VerifyService();
        }

        return instance;
    }

    public int insert(String code, int userId) {
        return (Integer)this.conn.withExtension(VerifyDAO.class, (dao) -> {
            return dao.insert(code, userId);
        });
    }

    public int getUserIdByCode(String code) {
        return (Integer)this.conn.withExtension(VerifyDAO.class, (dao) -> {
            return dao.getUserIdByCode(code);
        });
    }

    public void insertVerifyCart(String cartCode, int cartId) {
        this.conn.withExtension(VerifyDAO.class, (dao) -> {
            return dao.insertVerifyCart(cartCode, cartId);
        });
    }
    public int getCartsIdByCode(String code) {
        return (Integer)this.conn.withExtension(VerifyDAO.class, (dao) -> {
            return dao.getCartsIdByCode(code);
        });
    }
}
