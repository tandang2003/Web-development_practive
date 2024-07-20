package com.nhom44.DAO;

import com.nhom44.bean.ServiceAccessCount;
import org.jdbi.v3.sqlobject.config.RegisterBeanMapper;
import org.jdbi.v3.sqlobject.statement.SqlQuery;

import java.util.List;

@RegisterBeanMapper(ServiceAccessCount.class)
public interface ServiceAccessCountDAO {

    @SqlQuery("SELECT s.id AS serviceId, " +
            "s.name AS serviceName, " +
            "COUNT(h.id) AS timesAccessed " +
            "FROM services s " +
            "JOIN projects_services ps ON s.id = ps.serviceId " +
            "JOIN posts p ON ps.projectId = p.id " +
            "JOIN histories h ON p.id = h.postId " +
            "GROUP BY s.id, s.name " +
            "ORDER BY timesAccessed DESC")
    List<ServiceAccessCount> getServiceAccessCount();
}
