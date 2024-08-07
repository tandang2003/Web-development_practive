package com.nhom44.DAO;

import com.nhom44.bean.Image;
import org.jdbi.v3.sqlobject.config.RegisterBeanMapper;
import org.jdbi.v3.sqlobject.config.RegisterFieldMapper;
import org.jdbi.v3.sqlobject.customizer.Bind;
import org.jdbi.v3.sqlobject.customizer.BindBean;
import org.jdbi.v3.sqlobject.statement.GetGeneratedKeys;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.SqlUpdate;

import java.util.List;


@RegisterBeanMapper(Image.class)
public interface ImageDAO {
    @SqlUpdate("INSERT INTO group_images(projectId, imageId) VALUES(:projectId, :imageId)")
    int addProjectImage(@Bind("projectId") String projectId, @Bind("imageId") int imageId);

    @SqlUpdate("INSERT INTO images(name) VALUES( :name)")
    @GetGeneratedKeys
    int addImage(@Bind("name") String name);

    @SqlQuery("SELECT id FROM images WHERE path=:path AND name=:name")
    int getIdImage(@BindBean Image image);

    @SqlQuery("SELECT images.name FROM images  JOIN group_images gi on images.id = gi.imageId WHERE gi.projectId=:id")
    List<String> getGroupImagesByProjectId(@Bind("id") int id);

    @SqlUpdate("DELETE FROM group_images WHERE projectId=:id")
    int deleteAllImageProProject(@Bind("id") int id);
    @SqlUpdate("DELETE FROM images WHERE id=:imageId")
    Boolean delete(@Bind("imageId") int imageId);
}
