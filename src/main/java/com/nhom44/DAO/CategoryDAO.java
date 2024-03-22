package com.nhom44.DAO;

import com.nhom44.bean.Category;
import org.jdbi.v3.sqlobject.config.RegisterBeanMapper;
import org.jdbi.v3.sqlobject.config.RegisterFieldMapper;
import org.jdbi.v3.sqlobject.customizer.Bind;
import org.jdbi.v3.sqlobject.customizer.BindBean;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.SqlUpdate;

import java.util.List;

@RegisterBeanMapper(Category.class)
public interface CategoryDAO {
    @SqlQuery("SELECT c.id, c.name, IFNULL(count(p.id),0) AS numberOfProject, c.updatedAt, c.status FROM Categories c LEFT JOIN Projects p ON p.categoryId = c.Id GROUP BY c.id, c.name,c .updatedAt, c.status")
    List<Category> getAll();

    @SqlQuery("SELECT * FROM Categories WHERE id = :id")
    Category getById(@Bind("id") int id);

    @SqlUpdate("INSERT INTO Categories(name,status) VALUES (:name,:status)")
    int add(@BindBean Category category);
    @SqlQuery("SELECT EXISTS(SELECT * FROM Categories WHERE name = :name)")
    Boolean existCategory(@Bind("name")String name);
    @SqlUpdate("UPDATE Categories SET name = :name, status = :status WHERE id = :id")
    Integer update(@BindBean Category category);
    @SqlQuery("SELECT * FROM Categories WHERE status=1 ")
    List<Category> getAllActive();
}
