package com.nhom44.services;

import com.nhom44.DAO.ProjectDAO;
import com.nhom44.bean.Project;
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
        int status = Integer.MIN_VALUE;
        if (isComplete) {
            status = conn.withExtension(ProjectDAO.class, dao -> {
                System.out.println("complete dao\n " + project.getDescription());
                return dao.add(project);
            });
        } else {
            int s1 = conn.withExtension(ProjectDAO.class, dao -> {
                System.out.println("dao\n " + project.toString());

                return dao.add(project);
            });
            Project nProject = getProjectByObject(project);
            int s2 = addExcuting(nProject);
            status = s1 == 1 && s2 == 1 ? 1 : 0;
        }

        return status == 1 ? getProjectByObject(project) : null;
    }

    public int addExcuting(Project project) {
        if (project.getId() != 0) {
            Project finalProject = project;
            return conn.withExtension(ProjectDAO.class, dao -> dao.addExcuting(finalProject.getId(), finalProject.getSchedule(), finalProject.getEstimated_complete()));
        }
        project = getProjectByObject(project);
        Project finalProject1 = project;
        return conn.withExtension(ProjectDAO.class, dao -> dao.addExcuting(finalProject1.getId(), finalProject1.getSchedule(), finalProject1.getEstimated_complete()));
    }

    public boolean isFinishProject(int id) {
        return conn.withExtension(ProjectDAO.class, dao -> dao.isFinishProject(id));
    }

    public Project getById(int id) {
        return conn.withExtension(ProjectDAO.class, dao -> dao.getById(id));
    }

    public Project getActiveById(int id) {
        return conn.withExtension(ProjectDAO.class, dao -> dao.getActiveById(id));
    }

    public Project getProjectByObject(Project project) {
        return conn.withExtension(ProjectDAO.class, dao -> dao.getProjectByObject(project));
    }

    public Project updateProjectAvatar(Project project) {
        System.out.println("update avatar");
        System.out.println(project.toString());
        conn.withExtension(ProjectDAO.class, dao -> dao.updateProjectAvatar(project));
        return getById(project.getId());
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
        return getProjectByObject(project);
    }

    public int addProjectForUser(int projectId, int userId) {
        return conn.withExtension(ProjectDAO.class, dao -> dao.addProjectForUser(projectId, userId));
    }

    public int deleteInExcuting(int id) {
        return conn.withExtension(ProjectDAO.class, dao -> dao.deleteInExcuting(id));

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

    public List<Project> getExcuting() {
        return conn.withExtension(ProjectDAO.class, dao -> dao.getExcuting());
    }

    public List<Project> getProjetAllActive(int offset, int categoryId, int serviceId, int provinceId, long minPrice, long maxPrice, int minAcreage, int maxAcreage, int userid) {
        return conn.withExtension(ProjectDAO.class, dao -> {
            System.out.println("userid " + userid);
            List<Project> res = dao.getProjetAllActive(offset, categoryId, serviceId, provinceId, minPrice, maxPrice, minAcreage, maxAcreage, userid);
            for (Project project : res) {
                System.out.println(project.toString());
            }
            for (Project p : res) {
                if (p.getSaveBy() == userid && p.getSaveBy() != 0) p.setSave(true);
            }
//            res.forEach(p -> {
//                if (p.getSaveBy() == userid) p.setSave(true);
//            });
            for (Project project : res) {
                System.out.println(project.toString());
            }
            return res;
        });
    }


    public List<Project> get8ActiveProjectHighestView(int id, int userid) {
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

    public boolean saveProject(int projectId, int userId) {
        return conn.withExtension(ProjectDAO.class, dao -> dao.saveProject(projectId, userId));
    }

    public boolean deleteSaveProject(int projectId, int id) {
        return conn.withExtension(ProjectDAO.class, dao -> dao.deleteSaveProject(projectId, id));
    }

    public boolean isSaveProject(int projectId, int id) {
        return conn.withExtension(ProjectDAO.class, dao -> {
            System.out.println(dao.isSaveProject(projectId, id));
            return dao.isSaveProject(projectId, id);
        });
    }

    public List<Project> getSuggestProjects(int categoryId) {
        List<Project> list = conn.withExtension(ProjectDAO.class, dao -> dao.getSuggestProjects(categoryId));
        Set<Integer> set = new HashSet<>();
        while (set.size() < 4 && set.size() < list.size()) {
            Random random = new Random();
            int i = random.nextInt(list.size());
            set.add(i);
        }
        List<Project> res = new ArrayList<>();
        set.forEach(i -> res.add(list.get(i)));
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
            if (p.getEstimated_complete() != null) {
                p.setEstimated_complete(DateUtil.formatStringDate(p.getEstimated_complete()));
            } else {p.setSchedule("Dự án đã hoàn thành");p.setEstimated_complete(p.getUpdatedAt());}
        });
        return projects;
    }

    public static void main(String[] args) {
//        List<Project> projects = getInstance().getOwnProject(24);
//        System.out.println(projects.size());
//        for (Project project : projects) {
//            System.out.println(project);
//        }
//        System.out.println(getInstance().pageSizeHistoryProjectByUserId(24));
        System.out.println(getInstance().isLikeByUser(29, 187));
    }

    public void acceptProject(int idInt) {
        conn.withExtension(ProjectDAO.class, dao -> dao.acceptProject(idInt));
    }

    public boolean isLikeByUser(int userid, int postid) {
        return conn.withExtension(ProjectDAO.class, dao -> dao.isLikeByUser(userid, postid));
    }

}
