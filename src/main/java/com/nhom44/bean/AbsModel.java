package com.nhom44.bean;

import com.google.gson.Gson;
import com.nhom44.DAO.LogDAO;
import com.nhom44.db.JDBIConnector;
import com.nhom44.ip2location.Ip2Location;
import com.nhom44.services.LogServices;
import org.jdbi.v3.core.Jdbi;

import java.util.Map;

import static com.nhom44.util.GsonUtil.getGson;

public abstract class AbsModel implements IModel {
    protected AbsModel preValue;
    protected AbsModel afterValue;

    public AbsModel() {
    }

    public void insert(Map<String, String> map) {
        Log log = new Log();
        log.setPreValue(getGson().toJson(this.preValue));
        log.setAfterValue(getGson().toJson(this.afterValue));
        log.setIp(map.get("ip"));
        log.setLevel(Integer.parseInt(map.get("level")));
        log.setNational(Ip2Location.getNationality(map.get("ip")));
        log.setAddress(map.get("address"));
        System.out.println("log: " + log.toString());
//        LogServices.getInstance().insert(log);
    }

    ;

    public AbsModel getPreValue() {
        return this.preValue;
    }

    public AbsModel getAfterValue() {
        return this.afterValue;
    }

    public abstract void setPreValue(AbsModel model);

    public abstract void setAfterValue(AbsModel preModel);

    protected void update(AbsModel preModel, AbsModel afterModel) {
    }

    ;

    protected void delete(AbsModel model) {
    }

    ;
}

