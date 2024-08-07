package com.nhom44.DAO;

import com.nhom44.bean.Project;
import com.nhom44.bean.ServiceAccessCount;
import org.jdbi.v3.sqlobject.config.RegisterBeanMapper;
import org.jdbi.v3.sqlobject.config.RegisterRowMapper;
import org.jdbi.v3.sqlobject.customizer.Bind;
import org.jdbi.v3.sqlobject.customizer.BindBean;
import org.jdbi.v3.sqlobject.statement.GetGeneratedKeys;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.SqlUpdate;
import org.jdbi.v3.sqlobject.*;

import javax.servlet.annotation.WebServlet;
import java.util.List;

@RegisterBeanMapper(Project.class)
public interface ProjectDAO {
    @SqlQuery("Select p.id, p.title, p.avatar, p.price, ad.address as address, c.name as category, p.isAccepted," +
            " p.status, p.updatedAt" +
            " FROM projects p LEFT JOIN categories c ON p.categoryId=c.id" +
            " LEFT JOIN (SELECT a.id, Concat(w.fullName,', ',d.fullName,', ',pr.fullName) as address FROM addresses a " +
            "JOIN provinces pr ON pr.id=a.provinceId " +
            "JOIN districts d ON d.id=a.districtId " +
            "JOIN wards w ON w.id=a.wardId" +
            ") ad ON p.addressId=ad.id" )
    List<Project> getAll();

    @SqlUpdate("INSERT INTO projects(id,title, description, avatar, price, acreage, addressId, " +
            "isAccepted, categoryId, status, postId)" +
            " VALUES(:id,:title, :description, :avatar, :price, :acreage, :addressId, :isAccepted, " +
            ":categoryId, :status,:postId)")
    Integer add(@BindBean Project project);

    @GetGeneratedKeys
    @SqlUpdate("UPDATE projects SET title=:title, description=:description, " +
            " price=:price, acreage=:acreage, addressId=:addressId,avatar=:avatar, " +
            "isAccepted=:isAccepted, categoryId=:categoryId, status=:status , updatedAt=now() " +
            "WHERE id=:id")
    Integer updateProject(@BindBean Project project);

    @SqlUpdate("UPDATE projects SET avatar=:avatar " +
            "WHERE id=:id")
    Integer updateProjectAvatar(@BindBean Project project);

    @SqlUpdate("INSERT INTO excuting_projects(projectId, schedule, estimatedComplete)" +
            " VALUES(:projectId, :schedule, :estimatedComplete)")
    @GetGeneratedKeys
    int addExcuting(@Bind("projectId") String projectId, @Bind("schedule") String schedule, @Bind("estimatedComplete") String estimatedComplete);


    @SqlQuery("Select p.id, p.title,p.description, p.avatar, p.price, p.acreage, concat(w.fullName,', ',d.fullName,',   ',pr.fullName) as province, c.name as category, p.isAccepted," +
            " p.status, p.postId, ep.schedule, ep.estimatedComplete, p.addressId, p.categoryId, p.updatedAt" +
            " FROM projects p LEFT JOIN categories c ON p.categoryId=c.id" +
            " LEFT JOIN addresses address ON p.addressId=address.id" +
            " LEFT JOIN provinces pr ON pr.id=address.provinceId" +
            " LEFT JOIN wards w ON w.id=address.wardId" +
            " LEFT JOIN districts d ON d.id=address.wardId" +
            " LEFT JOIN excuting_projects ep ON p.id=ep.projectId" +
            " WHERE p.id=:id")
    Project getById(@Bind("id") String id);

    @SqlQuery("Select p.id, p.title,p.description, p.avatar, p.price, p.acreage, ad.name as address, c.name as category, p.isAccepted," +
            " p.status, p.postId, ep.schedule, ep.estimatedComplete, p.addressId, p.categoryId, p.updatedAt " +
            " FROM projects p LEFT JOIN categories c ON p.categoryId=c.id" +
            " Left JOIN (select a.id,  concat(w.fullName,', ',dt.fullName,',   ',pr.fullName) as name from addresses a " +
            "                               join provinces pr on a.provinceId = pr.id" +
            "                               join districts dt on a.districtId = dt.id" +
            "                               join wards w on w.id = a.wardId" +
            " ) ad ON p.addressId=ad.id" +
            " LEFT JOIN excuting_projects ep ON p.id=ep.projectId" +
            " WHERE p.id=:id AND p.status=1 AND p.isAccepted=1 and c.status=1")
    Project getActiveById(@Bind("id") int id);

    @SqlQuery("SELECT COUNT(projectId) From excuting_projects WHERE projectId=:id")
    boolean isFinishProject(@Bind("id") int id);

    @SqlQuery("Select p.id, p.title,p.description, p.avatar, p.acreage ,p.price, p.addressId as province, c.name as category, p.isAccepted," +
            " p.status, p.postId, ep.schedule, ep.estimatedComplete, p.categoryId,p.addressId ,p.updatedAt" +
            " FROM projects p LEFT JOIN categories c ON p.categoryId=c.id" +
            " LEFT JOIN addresses pr ON p.addressId=pr.id" +
            " LEFT JOIN excuting_projects ep ON p.id=ep.projectId" +
            " WHERE p.title=:title AND p.description=:description " +
            "AND p.price=:price AND p.addressId=:addressId " +
            "AND p.isAccepted=:isAccepted AND p.categoryId=:categoryId " +
            "AND p.status=:status")
    Project getProjectByObject(@BindBean Project project);

    @GetGeneratedKeys
    @SqlUpdate("INSERT INTO users_projects(projectId, userId) VALUES(:projectId, :userId)")
    int addProjectForUser(@Bind("projectId") int projectId, @Bind("userId") int userId);

    @GetGeneratedKeys
    @SqlUpdate("DELETE FROM excuting_projects WHERE projectId=:id ")
    Integer deleteInExcuting(@Bind("id") String id);

    @GetGeneratedKeys
    @SqlUpdate("UPDATE excuting_projects SET schedule=:schedule, estimatedComplete=:estimatedComplete, updatedAt=now() WHERE projectId=:id")
    int updateExcuting(@BindBean Project project);

    @SqlQuery("SELECT p.id, p.title, p.description, p.avatar, c.name " +
            ",userid as saveBy " +
            "FROM Projects p " +
            "JOIN Categories c ON c.id = p.categoryId AND c.status = 1 " +
            "LEFT JOIN Posts po On po.id =p.postId " +
            "LEFT JOIN (select * from saved_projects sp where sp.userId=:userid) sl ON sl.postId=po.id  " +
            "LEFT JOIN (SELECT address.id, address.provinceId FROM ADDRESSES address) pr ON pr.id=p.addressId " +
            "WHERE  p.status=1 AND p.isAccepted=1 " +
            "AND if(:categoryId <>0 , c.id=:categoryId, c.id=p.categoryId) " +
            "AND if(:provinceId <>0 , pr.provinceId=:provinceId, pr.provinceId=pr.provinceId) " +
            "AND if(:minPrice <>0 ,p.price<=:minPrice,p.price>0) " +
            "AND if(:maxPrice <> 0, p.price>=:maxPrice,p.price>0) " +
            "AND if(:minAcreage <>0 , p.acreage<:minAcreage,p.acreage>=0) " +
            "AND if(:maxAcreage <>0 , p.acreage>:maxAcreage,p.acreage>=0) " +
            "AND p.id IN( " +
            "SELECT ps.projectId " +
            "FROM projects_services ps " +
            "Left JOIN Services s ON s.id=ps.serviceId AND s.status=1 " +
            "WHERE if(:serviceId<>0,s.id=:serviceId,s.id=s.id)" +
            ") " +
            "GROUP BY p.id, p.title, p.description, p.avatar, c.name , if(:userid<>0, sl.userId, sl.postId) " +
            "order by p.id " +
            "LIMIT 16 OFFSET :offset")
    List<Project> getProjetAllActive(@Bind("offset") int offset, @Bind("categoryId") int categoryId,
                                     @Bind("serviceId") int serviceId,
                                     @Bind("provinceId") int provinceId,
                                     @Bind("minPrice") long minPrice,
                                     @Bind("maxPrice") long maxPrice,
                                     @Bind("minAcreage") int minAcreage,
                                     @Bind("maxAcreage") int maxAcreage,
                                     @Bind("userid") int userid);

    @SqlQuery("SELECT p.id, ep.estimatedComplete,ep.schedule, ep.updatedAt" +
            " FROM projects p JOIN doanweb.excuting_projects ep on p.id = ep.projectId")
    List<Project> getExcuting();

    @SqlQuery("SELECT p.id, p.title ," +
            "count(h.id) AS numVisit, po.updatedAt AS updatedAt " +
            "FROM Projects p JOIN posts po ON p.postId=po.id " +
            "LEFT JOIN " +
            "Histories h ON po.id = h.postId GROUP BY p.id, p.title , po.updatedAt, po.updatedAt"
    )
    List<Project> getNumOfRead();

    @SqlQuery("SELECT p.id, p.title , count(sl.id) as numSave, " +
            " p.updatedAt as updatedAt " +
            "FROM Projects p JOIN posts po ON p.postId=po.id " +
            "LEFT JOIN saved_projects sl ON po.id = sl.postId " +
            "GROUP BY p.id, p.title , po.updatedAt"
    )
    List<Project> getNumOfSaved();

    @SqlQuery("SELECT p.id, p.title, p.description,p.avatar,sl.userId as saveBy " +
            "FROM Projects p JOIN Categories c ON c.id=p.categoryId " +
            "Left JOIN Histories h ON h.postId=p.postId " +
            "Left JOIN (select * from saved_projects) sl ON sl.postId=p.postId  " +
            "WHERE p.categoryId =:id AND p.isAccepted=1 AND p.status=1 AND c.status = 1 " +
            "GROUP BY p.id, p.title, p.description, p.avatar " +
            "ORDER BY COUNT(p.id) desc LIMIT 8")
    List<Project> get8ActiveProjectHighestView(@Bind("id") int id, @Bind("userid") int userid);

    @GetGeneratedKeys
    @SqlUpdate("UPDATE users_projects SET userId=:id1, updatedAt=now() WHERE projectId=:id")
    int updateProjectForUser(@Bind("id") int id, @Bind("id1") int id1);

    @SqlQuery("SELECT count(p.id) " +
            "FROM Projects p " +
            "JOIN Categories c ON c.id = p.categoryId AND c.status = 1 " +
            "LEFT JOIN Posts po On po.id =p.postId " +
            "LEFT JOIN (SELECT address.id, address.provinceId FROM ADDRESSES address) pr ON pr.id=p.addressId " +
            "WHERE  p.status=1 AND p.isAccepted=1 " +
            "AND if(:categoryId <>0 , c.id=:categoryId, c.id=p.categoryId) " +
            "AND if(:provinceId <>0 , pr.provinceId=:provinceId, pr.provinceId=pr.provinceId) " +
            "AND if(:minPrice <>0 ,p.price<=:minPrice,p.price>0) " +
            "AND if(:maxPrice <> 0, p.price>=:maxPrice,p.price>0) " +
            "AND if(:minAcreage <>0 , p.acreage<:minAcreage,p.acreage>=0) " +
            "AND if(:maxAcreage <>0 , p.acreage>:maxAcreage,p.acreage>=0) " +
            "AND p.id IN( " +
            "SELECT ps.projectId " +
            "FROM projects_services ps " +
            "Left JOIN Services s ON s.id=ps.serviceId AND s.status=1 " +
            "WHERE if(:serviceId<>0,s.id=:serviceId,s.id=s.id)" +
            ") " +
            "order by p.id ")
    Integer getProjetAllActiveSize(@Bind("offset") int offset, @Bind("categoryId") int categoryId, @Bind("serviceId") int serviceId, @Bind("provinceId") int addressId, @Bind("minPrice") long minPrice, @Bind("maxPrice") long maxPrice, @Bind("minAcreage") int minAcreage, @Bind("maxAcreage") int maxAcreage);

    @SqlQuery("SELECT DISTINCT p.id, p.title, p.avatar,p.updatedAt " +
            "FROM Projects p  " +
            "JOIN Categories c ON p.categoryId = c.id AND c.status=1 " +
            "WHERE p.status=1 AND c.id=:categoryId AND p.id IN( " +
            "SELECT projectId " +
            "FROM  Projects_Services ps  " +
            "JOIN Services s ON s.id=ps.serviceId AND s.status=1 )")
    List<Project> getSuggestProjects(@Bind("categoryId") int categoryId);

    @SqlQuery("SELECT DISTINCT p.id, p.title, p.avatar,p.description,p.updatedAt, sl.userId as saveBy " +
            "FROM Projects p  " +
            "JOIN saved_projects sl ON sl.postId=p.postId " +
            "JOIN Categories c ON p.categoryId = c.id AND c.status=1 " +
            "WHERE sl.userId=:id AND p.status=1 AND p.isAccepted=1 AND p.id IN( " +
            "SELECT projectId " +
            "FROM  Projects_Services ps  " +
            "JOIN Services s ON s.id=ps.serviceId AND s.status=1 ) LIMIT 16 OFFSET :offset")
    List<Project> getLikedProjectByUserId(@Bind("id") int i, @Bind("offset") int offset);

    @SqlQuery("SELECT count( DISTINCT p.id) " +
            "FROM Projects p  " +
            "JOIN saved_projects sl ON sl.postId=p.postId " +
            "JOIN Categories c ON p.categoryId = c.id AND c.status=1 " +
            "WHERE sl.userId=:id AND p.status=1 AND p.isAccepted=1 AND p.id IN( " +
            "SELECT projectId " +
            "FROM  Projects_Services ps  " +
            "JOIN Services s ON s.id=ps.serviceId AND s.status=1 )")
    Integer pageSizeProjectByUserId(@Bind("id") int id);

    @SqlQuery("SELECT Distinct p.id, p.title, p.avatar,p.description,p.updatedAt, sl.userId as saveBy " +
            "FROM Projects p  " +
            "Left JOIN (select * from saved_projects s where s.userId=:id) sl ON sl.postId=p.postId  " +
            "JOIN histories h on p.postId = h.postId AND h.userId=:id " +
            "JOIN Categories c ON p.categoryId = c.id AND c.status=1 " +
            "WHERE " +
            " p.status=1 AND p.isAccepted=1 AND p.id IN( " +
            "SELECT projectId " +
            "FROM  Projects_Services ps  " +
            "JOIN Services s ON s.id=ps.serviceId AND s.status=1 )" +
            "ORDER BY h.updatedAt DESC" +
            " LIMIT 16 OFFSET :offset"
    )
    List<Project> getHistoryUserProject(@Bind("id") int id, @Bind("offset") int offset);

    @SqlUpdate("INSERT INTO histories(postId, userId, updatedAt, createdAt) VALUES(:postId, :userId, now(), now())")
    Integer addHistory(@Bind("userId") int userId, @Bind("postId") int postId);

    @SqlQuery("SELECT count(distinct p.id) " +
            "FROM Projects p  " +
            "Left JOIN (select * from saved_projects s where s.userId=:id) sl ON sl.postId=p.postId  " +
            "JOIN histories h on p.postId = h.postId AND h.userId=:id " +
            "JOIN Categories c ON p.categoryId = c.id AND c.status=1 "
            +
            "WHERE " +
            " p.status=1 AND p.isAccepted=1 AND p.id IN( " +
            "SELECT projectId " +
            "FROM  Projects_Services ps  " +
            "JOIN Services s ON s.id=ps.serviceId AND s.status=1 )")
    Integer pageSizeHistoryProjectByUserId(@Bind("id") int id);

    @SqlQuery("SELECT p.id, p.title, p.avatar,p.updatedAt,p.isAccepted,p.price,ad.name as address ,c.name as category , " +
            "ep.schedule as schedule , ep.estimatedComplete as estimatedComplete , u.fullName as owner " +
            "FROM Projects p " +
            "JOIN Categories c ON p.categoryId = c.id  " +
            "JOIN (" +
            "SELECT ad.id, CONCAT(w.fullName,', ',d.fullName,', ',pr.fullName) as name " +
            "FROM addresses ad " +
            "       JOIN provinces pr ON pr.id=ad.provinceId " +
            "       JOIN districts d ON ad.districtId=d.id " +
            "       JOIN wards w ON ad.wardId=w.id " +
            ") as ad ON p.addressId=ad.id " +
            "Left JOIN excuting_projects ep ON p.id=ep.projectId " +
            "JOIN users_projects up ON up.projectId=p.id AND up.userId=:id " +
            "JOIN users u ON u.id=up.userId"
    )
    List<Project> getOwnProject(@Bind("id") int id);

    @SqlUpdate("UPDATE projects SET isAccepted=1 WHERE id=:id")
    Integer acceptProject(@Bind("id") int idInt);

    @SqlQuery("SELECT EXISTS(SELECT * FROM saved_projects WHERE userId=:userid AND postId=:postid)")
    Boolean isLikeByUser(@Bind("userid") int userid, @Bind("postid") int postid);
}