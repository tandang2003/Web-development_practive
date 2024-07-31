package com.nhom44.services;

import com.nhom44.DAO.HistoryDAO;
import com.nhom44.DAO.ProjectDAO;
import com.nhom44.bean.History;
import com.nhom44.bean.Project;
import com.nhom44.bean.ServiceAccessCount;
import com.nhom44.db.JDBIConnector;
import com.nhom44.util.DateUtil;
import org.jdbi.v3.core.Jdbi;

import java.util.*;

public class ProjectService {
    private static ProjectService instance;
    private Jdbi conn;

    private ProjectService() {
        conn = JDBIConnector.get();
    }

    public static ProjectService getInstance() {
        return instance != null ? instance : (instance = new ProjectService());
    }

    public List<Project> getAllProject() {
        return conn.withExtension(ProjectDAO.class, dao -> dao.getAll());
    }

    public Project add(Project project, boolean isComplete) {
        conn.withExtension(ProjectDAO.class, dao -> dao.add(project));
        if (!isComplete) {
//            Project nProject = getProjectByObject(project);
            addExcuting(project);
//            status = s1 == 1 && s2 == 1 ? 1 : 0;
        }

        return project;
//                == 1 ? getProjectByObject(project) : null;
    }

    public int addExcuting(Project project) {
        Project finalProject = project;
        return conn.withExtension(ProjectDAO.class, dao -> dao.addExcuting(finalProject.getId(), finalProject.getSchedule(), finalProject.getEstimatedComplete()));
    }

    public boolean isFinishProject(int id) {
        return conn.withExtension(ProjectDAO.class, dao -> dao.isFinishProject(id));
    }

    public Project getById(String id) {
        return conn.withExtension(ProjectDAO.class, dao -> dao.getById(id));
    }

    public Project getActiveById(int id) {
        return conn.withExtension(ProjectDAO.class, dao -> dao.getActiveById(id));
    }

    public Project getProjectByObject(Project project) {
        return conn.withExtension(ProjectDAO.class, dao -> dao.getProjectByObject(project));
    }


    public Project updateProject(Project project, boolean isComplete) {
        if (isComplete) {
            conn.withExtension(ProjectDAO.class, dao -> dao.deleteInExcuting(project.getId()));
            conn.withExtension(ProjectDAO.class, dao -> dao.updateProject(project));
        } else {
            conn.withExtension(ProjectDAO.class, dao -> dao.deleteInExcuting(project.getId()));
            addExcuting(project);
            conn.withExtension(ProjectDAO.class, dao -> dao.updateProject(project));
        }
        return project;
    }

    public int addProjectForUser(int projectId, int userId) {
        return conn.withExtension(ProjectDAO.class, dao -> dao.addProjectForUser(projectId, userId));
    }


    public int updateProjectForUser(int id, int id1) {
        return conn.withExtension(ProjectDAO.class, dao -> dao.updateProjectForUser(id, id1));
    }

    public List<Project> getNumOfSavedAndRead() {
        return conn.withExtension(ProjectDAO.class, dao -> {
            List<Project> res = dao.getNumOfSaved();
            List<Project> read = dao.getNumOfRead();
            for (int i = 0; i < res.size(); i++) {
                res.get(i).setNumVisit(read.get(i).getNumVisit());
            }
            return res;
        });
    }

    public static void main(String[] args) {
//       List<String> onwer= UserService.getInstance().getEmailOwner();
       List<Project> projects = ProjectService.getInstance().get8ActiveProjectHighestView(1,34);
//        System.out.println(projects.size());
//        System.out.println(onwer.size());
       for (Project s: projects){
           System.out.println(s);
       }

    }

    public List<Project> getExcuting() {
        return conn.withExtension(ProjectDAO.class, dao -> dao.getExcuting());
    }

    public List<Project> getProjetAllActive(int offset, int categoryId, int serviceId, int provinceId, long minPrice, long maxPrice, int minAcreage, int maxAcreage, int userid) {


        return conn.withExtension(ProjectDAO.class, dao -> {
            List<Project> res = dao.getProjetAllActive(offset, categoryId, serviceId, provinceId, minPrice, maxPrice, minAcreage, maxAcreage, userid);
            for (Project p : res) {
                if (p.getSaveBy() == userid && p.getSaveBy() != 0) p.setSave(true);
            }
//            res.forEach(p -> {
//                if (p.getSaveBy() == userid) p.setSave(true);
//            });
            return res;
        });
    }


    public List<Project> get8ActiveProjectHighestView(int id, int userid) {
        System.out.println(userid);
        List<Project> top8 = conn.withExtension(ProjectDAO.class, dao -> dao.get8ActiveProjectHighestView(id, userid));

        for (Project p : top8) {
            if (p.getSaveBy() == userid && p.getSaveBy() != 0) p.setSave(true);
        }
        return top8;
    }

    public int getProjetAllActiveSize(int offset, int categoryId, int serviceId, int provinceId, long minPrice, long maxPrice, int minArea, int maxArea) {
        int num = conn.withExtension(ProjectDAO.class, dao -> dao.getProjetAllActiveSize(offset, categoryId, serviceId, provinceId, minPrice, maxPrice, minArea, maxArea));
        return num % 16 == 0 ? num / 16 : num / 16 + 1;
    }

    public List<Project> getSuggestProjects(int categoryId) {
        List<Project> list = conn.withExtension(ProjectDAO.class, dao -> dao.getSuggestProjects(categoryId));
        System.out.println(list.size());
        Set<Integer> set = new HashSet<>();
        while (set.size() < 4 && set.size() < list.size()) {
            Random random = new Random();
            int i = random.nextInt(list.size());
            set.add(i);
        }
        List<Project> res = new ArrayList<>();
        set.forEach(i -> res.add(list.get(i)));
        System.out.println(res.size());
        return res;
    }


    public List<Project> getLikedProjectByUserId(int i, int offset) {
        return conn.withExtension(ProjectDAO.class, dao -> dao.getLikedProjectByUserId(i, offset));
    }

    public int pageSizeProjectByUserId(int id) {
        int page = conn.withExtension(ProjectDAO.class, dao -> dao.pageSizeProjectByUserId(id));
        page = page % 16 == 0 ? page / 16 : page / 16 + 1;
        return page;
    }

    public List<Project> getHistoryUserProject(int id, int offset) {
        System.out.println("get history user project");
        System.out.println(id + " " + offset);

        List<Project> projects = conn.withExtension(ProjectDAO.class, dao -> dao.getHistoryUserProject(id, offset));
        for (Project p : projects) {
            if (p.getSaveBy() == id && p.getSaveBy() != 0) p.setSave(true);
        }
        return projects;
    }


    public void addHistory(int userId, int postId) {
        conn.withExtension(ProjectDAO.class, dao -> dao.addHistory(userId, postId));
    }

    public int pageSizeHistoryProjectByUserId(int id) {
        int page = conn.withExtension(ProjectDAO.class, dao -> dao.pageSizeHistoryProjectByUserId(id));
        page = page % 16 == 0 ? page / 16 : page / 16 + 1;
        return page;
    }

    public List<Project> getOwnProject(int id) {
        List<Project> projects = conn.withExtension(ProjectDAO.class, dao -> dao.getOwnProject(id));
        projects.forEach(p -> {
            p.setUpdatedAt(DateUtil.formatStringDate(p.getUpdatedAt()));
            if (p.getEstimatedComplete() != null) {
                p.setEstimatedComplete(DateUtil.formatStringDate(p.getEstimatedComplete()));
            } else {
                p.setSchedule("Dự án đã hoàn thành");
                p.setEstimatedComplete(p.getUpdatedAt());
            }
        });
        return projects;
    }

    public void acceptProject(int idInt) {
        conn.withExtension(ProjectDAO.class, dao -> dao.acceptProject(idInt));
    }

    public boolean isLikeByUser(int userid, int postid) {
        return conn.withExtension(ProjectDAO.class, dao -> dao.isLikeByUser(userid, postid));
    }

//    get all histories
    public List<History> getAllHistory() {
        return conn.withExtension(HistoryDAO.class, dao -> dao.getAllHistory());
    }
}