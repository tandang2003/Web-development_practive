package com.nhom44.DAO;

import com.nhom44.bean.Service;
import org.jdbi.v3.sqlobject.config.RegisterBeanMapper;
import org.jdbi.v3.sqlobject.config.RegisterFieldMapper;
import org.jdbi.v3.sqlobject.customizer.Bind;
import org.jdbi.v3.sqlobject.customizer.BindBean;
import org.jdbi.v3.sqlobject.statement.GetGeneratedKeys;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.SqlUpdate;

import java.util.List;

@RegisterBeanMapper(Service.class)
public interface ServiceDAO {
    //get all service

    @SqlQuery("SELECT s.id, s.name, s.description,s.avatar, s.postId," +
            "count(ps.id) as numberOfProject,  " +
            "count(h.id) AS numberOfView ,s.status FROM Services s " +
            "LEFT JOIN Projects_Services ps ON s.id=ps.serviceId " +
            "LEFT JOIN Posts p ON p.id=s.postId   " +
            "LEFT JOIN Histories h ON h.postId=p.id " +
            "WHERE s.status=1 " +
            "GROUP BY s.id, s.name, s.description, s.status")
    List<Service> getAll();
    @SqlQuery("SELECT s.id, s.name, s.description,s.avatar, s.postId," +
            "count(ps.id) as numberOfProject,  " +
            "count(h.id) AS numberOfView ,s.status FROM Services s " +
            "LEFT JOIN Projects_Services ps ON s.id=ps.serviceId " +
            "LEFT JOIN Posts p ON p.id=s.postId   " +
            "LEFT JOIN Histories h ON h.postId=p.id " +
            "GROUP BY s.id, s.name, s.description, s.status")
    List<Service> getAdminAll();
    @SqlQuery("SELECT s.id, s.name, s.status FROM services s " +
            "JOIN projects_services sp ON s.id=sp.serviceId AND sp.projectId=:id " +
            "JOIN projects p ON p.id=sp.projectId AND  s.status=1")
    List<Service> getServicesByProjectId(@Bind("id") String id);

    @SqlQuery("SELECT s.id, s.name, s.status FROM services s " +
            "JOIN projects_services sp ON s.id=sp.serviceId AND sp.projectId=:id " +
            "JOIN projects p ON p.id=sp.projectId")
    List<Service> getServicesForOwnerByProjectId(@Bind("id") String id);

    @SqlUpdate("INSERT INTO projects_services(projectId, serviceId) VALUES(:projectId, :serviceId)")
    Integer addServiceForProject(@Bind("projectId") String projectId, @Bind("serviceId") int serviceId);

    @SqlUpdate("DELETE FROM projects_services WHERE projectId=:id")
    int deleteServiceProject(@Bind("id") int id);

    @SqlUpdate("INSERT INTO services(name, description, avatar, status, postId) VALUES(:name, :description, :avatar, :status , :postId)")
    @GetGeneratedKeys
    int add(@BindBean Service service);

    @SqlQuery("SELECT EXISTS(SELECT * FROM services WHERE name=:name and id!=:id)")
    Boolean isExist(@BindBean Service service);

    @SqlUpdate("UPDATE services SET name=:name, description=:description, avatar=:avatar, status=:status, postId=:postId WHERE id=:id")
    Integer update(@BindBean Service service);

    //TODO check lỗi
    @SqlQuery("SELECT s.id,s.name, s.description, s.postId, s.avatar, s.status,p.content " +
            "FROM services s Left Join posts p on s.postId=p.id " +
            "WHERE s.id=:id")
    Service getById(@Bind("id") int id);

    @SqlQuery("SELECT id,name, description, postId, status, avatar FROM services WHERE status=1")
    List<Service> getAllActive();

    @SqlQuery("Select EXISTS(SELECT * FROM services s " +
            "JOIN doanweb.projects_services ps " +
            "on s.id = ps.serviceId " +
            "WHERE ps.projectId=:projectId AND ps.serviceId=:serviceId AND s.status=1)")
    boolean isProjectHaveExsistProject(@Bind("projectId") int projectId, @Bind("serviceId") int serviceId);

    @SqlQuery("SELECT s.id,s.name, s.description, s.postId, s.avatar, s.status,p.content, s.updatedAt " +
            "FROM services s Left Join posts p on s.postId=p.id " +
            "WHERE s.id=:id AND s.status=1")
    Service getActiveById(@Bind("id") int id);


    @SqlQuery("SELECT s.id, s.name, s.description,s.avatar, s.postId  " +
            ",s.status FROM Services s " +
            "GROUP BY s.id, s.name, s.description, s.status ")
    List<Service> getSuggestServices();


    
}