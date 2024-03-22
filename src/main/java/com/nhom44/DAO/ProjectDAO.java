package com.nhom44.DAO;

import com.nhom44.bean.Project;
import org.jdbi.v3.sqlobject.config.RegisterBeanMapper;
import org.jdbi.v3.sqlobject.customizer.Bind;
import org.jdbi.v3.sqlobject.customizer.BindBean;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.SqlUpdate;

import javax.servlet.annotation.WebServlet;
import java.util.List;

@RegisterBeanMapper(Project.class)
public interface ProjectDAO {
    @SqlQuery("Select p.id, p.title, p.avatar, p.price, pr.name as province, c.name as category, p.isAccepted," +
            " p.status, p.updatedAt" +
            " FROM projects p LEFT JOIN categories c ON p.categoryId=c.id" +
            " LEFT JOIN provinces pr ON p.provinceId=pr.id")
    List<Project> getAll();

    @SqlUpdate("INSERT INTO projects(title, description, avatar, price, acreage, provinceId, " +
            "isAccepted, categoryId, status, postId)" +
            " VALUES(:title, :description, :avatar, :price, :acreage, :provinceId, :isAccepted, " +
            ":categoryId, :status,:postId)")
    Integer add(@BindBean Project project);

    @SqlUpdate("UPDATE projects SET title=:title, description=:description, " +
            " price=:price, acreage=:acreage, provinceId=:provinceId, " +
            "isAccepted=:isAccepted, categoryId=:categoryId, status=:status , updatedAt=now() " +
            "WHERE id=:id")
    Integer updateProject(@BindBean Project project);

    @SqlUpdate("UPDATE projects SET avatar=:avatar " +
            "WHERE id=:id")
    Integer updateProjectAvatar(@BindBean Project project);

    @SqlUpdate("INSERT INTO excuting_projects(projectId, schedule, estimated_complete)" +
            " VALUES(:projectId, :schedule, :estimated_complete)")
    int addExcuting(@Bind("projectId") int projectId, @Bind("schedule") String schedule, @Bind("estimated_complete") String estimated_complete);


    @SqlQuery("Select p.id, p.title,p.description, p.avatar, p.price, p.acreage, pr.name as province, c.name as category, p.isAccepted," +
            " p.status, p.postId, ep.schedule, ep.estimated_complete, p.provinceId, p.categoryId,p.updatedAt" +
            " FROM projects p LEFT JOIN categories c ON p.categoryId=c.id" +
            " LEFT JOIN provinces pr ON p.provinceId=pr.id" +
            " LEFT JOIN excuting_projects ep ON p.id=ep.projectId" +
            " WHERE p.id=:id")
    Project getById(@Bind("id") int id);

    @SqlQuery("Select p.id, p.title,p.description, p.avatar, p.price, p.acreage, pr.name as province, c.name as category, p.isAccepted," +
            " p.status, p.postId, ep.schedule, ep.estimated_complete, p.provinceId, p.categoryId, p.updatedAt " +
            " FROM projects p LEFT JOIN categories c ON p.categoryId=c.id" +
            " LEFT JOIN provinces pr ON p.provinceId=pr.id" +
            " LEFT JOIN excuting_projects ep ON p.id=ep.projectId" +
            " WHERE p.id=:id AND p.status=1 AND p.isAccepted=1")
    Project getActiveById(@Bind("id") int id);

    @SqlQuery("SELECT COUNT(projectId) From excuting_projects WHERE projectId=:id")
    boolean isFinishProject(@Bind("id") int id);

    @SqlQuery("Select p.id, p.title,p.description, p.avatar, p.acreage ,p.price, pr.name as province, c.name as category, p.isAccepted," +
            " p.status, p.postId, ep.schedule, ep.estimated_complete, p.categoryId,p.provinceId ,p.updatedAt" +
            " FROM projects p LEFT JOIN categories c ON p.categoryId=c.id" +
            " LEFT JOIN provinces pr ON p.provinceId=pr.id" +
            " LEFT JOIN excuting_projects ep ON p.id=ep.projectId" +
            " WHERE p.title=:title AND p.description=:description  AND p.price=:price AND p.provinceId=:provinceId AND p.isAccepted=:isAccepted AND p.categoryId=:categoryId AND p.status=:status")
    Project getProjectByObject(@BindBean Project project);


    @SqlUpdate("INSERT INTO users_projects(projectId, userId) VALUES(:projectId, :userId)")
    int addProjectForUser(@Bind("projectId") int projectId, @Bind("userId") int userId);

    @SqlUpdate("DELETE FROM excuting_projects WHERE projectId=:id ")
    Integer deleteInExcuting(@Bind("id") int id);

    @SqlUpdate("UPDATE excuting_projects SET schedule=:schedule, estimated_complete=:estimated_complete, updatedAt=now() WHERE projectId=:id")
    int updateExcuting(@BindBean Project project);

    @SqlQuery("SELECT p.id, p.title, p.description, p.avatar, c.name , userid as saveBy " +
            "FROM Projects p " +
            "JOIN Categories c ON c.id = p.categoryId AND c.status = 1 " +
            "JOIN Posts po On po.id =p.postId " +
            "LEFT JOIN (select * from saved_projects where userId=:userid) sl ON sl.postId=po.id  " +
            "WHERE  p.status=1 AND p.isAccepted=1 " +
            "AND if(:categoryId <>0 , c.id=:categoryId, c.id=p.categoryId) " +
            "AND if(:provinceId <>0 , p.provinceId=:provinceId, p.provinceId=p.provinceId) " +
            "AND if(:minPrice <>0 ,p.price<=:minPrice,p.price>0) " +
            "AND if(:maxPrice <> 0, p.price>=:maxPrice,p.price>0) " +
            "AND if(:minAcreage <>0 , p.acreage<:minAcreage,p.acreage>=0) " +
            "AND if(:maxAcreage <>0 , p.acreage>:maxAcreage,p.acreage>=0) " +
            "AND p.id IN( " +
            "SELECT ps.projectId " +
            "FROM projects_services ps " +
            "JOIN Services s ON s.id=ps.serviceId AND s.status=1 " +
            "WHERE if(:serviceId>0,s.id=:serviceId,s.id=s.id)) " +
            "GROUP BY p.id, p.title, p.description, p.avatar, c.name , if(:userid<>0, userId, sl.postId) " +
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

    @SqlQuery("SELECT p.id, ep.estimated_complete,ep.schedule, ep.updatedAt" +
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
            " po.updatedAt AS updatedAt " +
            "FROM Projects p JOIN posts po ON p.postId=po.id " +
            "LEFT JOIN saved_projects sl ON po.id = sl.postId " +
            "GROUP BY p.id, p.title , po.updatedAt, po.updatedAt"
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

    @SqlUpdate("UPDATE users_projects SET userId=:id1, updatedAt=now() WHERE projectId=:id")
    int updateProjectForUser(@Bind("id") int id, @Bind("id1") int id1);

    @SqlQuery("SELECT count(p.id) " +
            "FROM Projects p " +
            "JOIN Categories c ON c.id = p.categoryId AND c.status = 1 " +
            "JOIN Posts po On po.id =p.postId " +
            "LEFT JOIN saved_projects sl ON sl.postId=po.id " +
            "WHERE  p.status=1 AND p.isAccepted=1 " +
            "AND if(:categoryId <>0 , c.id=:categoryId, c.id=p.categoryId) " +
            "AND if(:provinceId <>0 , p.provinceId=:provinceId, p.provinceId=p.provinceId) " +
            "AND if(:minPrice <>0 ,p.price<=:minPrice,p.price>0) " +
            "AND if(:maxPrice <> 0, p.price>=:maxPrice,p.price>0) " +
            "AND if(:minAcreage <>0 , p.acreage<:minAcreage,p.acreage>0) " +
            "AND if(:maxAcreage <>0 , p.acreage>:maxAcreage,p.acreage>0) " +
            "AND p.id IN( " +
            "SELECT ps.projectId " +
            "FROM projects_services ps " +
            "JOIN Services s ON s.id=ps.serviceId AND s.status=1 " +
            "WHERE if(:serviceId>0,s.id=:serviceId,s.id=s.id)) " +
            "order by p.id ")
    Integer getProjetAllActiveSize(@Bind("offset") int offset, @Bind("categoryId") int categoryId, @Bind("serviceId") int serviceId, @Bind("provinceId") int provinceId, @Bind("minPrice") long minPrice, @Bind("maxPrice") long maxPrice, @Bind("minAcreage") int minAcreage, @Bind("maxAcreage") int maxAcreage);

    @SqlUpdate("INSERT INTO saved_projects(postId, userId) VALUES(:projectId, :userId)")
    Boolean saveProject(@Bind("projectId") int projectId, @Bind("userId") int userId);

    @SqlUpdate("DELETE FROM saved_projects WHERE postId=:projectId AND userId=:userId")
    Boolean deleteSaveProject(@Bind("projectId") int projectId, @Bind("userId") int id);

    @SqlQuery("Select EXISTS(SELECT * FROM saved_projects WHERE postId=:projectId AND userId=:userId)")
    Boolean isSaveProject(@Bind("projectId") int projectId, @Bind("userId") int id);

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

    @SqlQuery("SELECT DISTINCT count(p.id) " +
            "FROM Projects p  " +
            "JOIN saved_projects sl ON sl.postId=p.postId " +
            "JOIN Categories c ON p.categoryId = c.id AND c.status=1 " +
            "WHERE sl.userId=:id AND p.status=1 AND p.isAccepted=1 AND p.id IN( " +
            "SELECT projectId " +
            "FROM  Projects_Services ps  " +
            "JOIN Services s ON s.id=ps.serviceId AND s.status=1 )")
    Integer pageSizeProjectByUserId(@Bind("id") int id);

    @SqlQuery("SELECT p.id, p.title, p.avatar,p.description,p.updatedAt, sl.userId as saveBy " +
            "FROM Projects p  " +
            "Left JOIN (select * from saved_projects s where s.userId=:id) sl ON sl.postId=p.postId  " +
            "JOIN histories h on p.postId = h.postId AND h.userId=:id " +
            "JOIN Categories c ON p.categoryId = c.id AND c.status=1 " +
            "WHERE " +
            " p.status=1 AND p.isAccepted=1 AND p.id IN( " +
            "SELECT projectId " +
            "FROM  Projects_Services ps  " +
            "JOIN Services s ON s.id=ps.serviceId AND s.status=1 )" +
            "ORDER BY h.id DESC" +
            " LIMIT 16 OFFSET :offset"
    )
    List<Project> getHistoryUserProject(@Bind("id") int id, @Bind("offset") int offset);

    @SqlUpdate("INSERT INTO histories(postId, userId) VALUES(:postId, :userId)")
    Integer addHistory(@Bind("userId") int userId, @Bind("postId") int postId);

    @SqlQuery("SELECT count(p.id) " +
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

    @SqlQuery("SELECT p.id, p.title, p.avatar,p.updatedAt,p.isAccepted,p.price,pr.name as province ,c.name as category , ep.schedule as schedule , ep.estimated_complete as estimated_complete " +
            "FROM Projects p " +
            "JOIN Categories c ON p.categoryId = c.id  " +
            "JOIN provinces pr ON p.provinceId=pr.id " +
            "Left JOIN excuting_projects ep ON p.id=ep.projectId " +
            "JOIN users_projects up ON up.projectId=p.id AND up.userId=:id"
    )
    List<Project> getOwnProject(@Bind("id") int id);
    @SqlUpdate("UPDATE projects SET isAccepted=1 WHERE id=:id")
    Integer acceptProject(@Bind("id") int idInt);
@SqlQuery("SELECT EXISTS(SELECT * FROM saved_projects WHERE userId=:userid AND postId=:postid)")
    Boolean isLikeByUser(@Bind("userid")int userid,@Bind("postid") int postid);
}