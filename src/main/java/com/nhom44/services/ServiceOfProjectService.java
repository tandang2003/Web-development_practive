package com.nhom44.services;

import com.nhom44.DAO.ServiceDAO;
import com.nhom44.bean.Project;
import com.nhom44.bean.Service;
import com.nhom44.db.JDBIConnector;
import org.jdbi.v3.core.Jdbi;

import java.util.*;

public class ServiceOfProjectService {
    private static Jdbi conn;
    private static ServiceOfProjectService instance;
    private ServiceOfProjectService() {
        conn = JDBIConnector.get();
    }
    public static ServiceOfProjectService getInstance() {
        return instance != null ? instance : (instance = new ServiceOfProjectService());
    }

    public List<Service> getAll() {
        return conn.withExtension(ServiceDAO.class, dao -> dao.getAll());
    }
    public List<Service> getAdminAll() {
            return conn.withExtension(ServiceDAO.class, dao -> dao.getAdminAll());
    }
    public int addServiceForProject(String projectId, int serviceId) {
        return conn.withExtension(ServiceDAO.class, dao -> dao.addServiceForProject(projectId, serviceId));
    }
    public List<Service> getServicesByProjectId(String id) {
        return conn.withExtension(ServiceDAO.class, dao -> dao.getServicesByProjectId(id));
    }
    public List<Service> getServicesForOwnerByProjectId(String id) {
        return conn.withExtension(ServiceDAO.class, dao -> dao.getServicesForOwnerByProjectId(id));
    }
    public Map<String, String> getServicesForOwnerByProjectIds(List<Project> projects) {
        Map<String, String> map = new HashMap<>();
        for (Project project : projects) {
            List<Service> services = getServicesForOwnerByProjectId(project.getId());
            StringBuilder sb = new StringBuilder();
            for (Service service : services) {
                sb.append(service.getName()).append(", ");
            }
            if (sb.length() > 0) {
                sb.delete(sb.length() - 2, sb.length());
            }
            map.put(project.getId(), sb.toString());
        }
        return map;
    }



    public void updateServiceForProject(int id, List<String> services) {
        deleteServiceProject(id);
        for (String service : services) {
            addServiceForProject(id+"", Integer.parseInt(service));
        }
    }

    public void deleteServiceProject(int id) {
        conn.withExtension(ServiceDAO.class, dao -> dao.deleteServiceProject(id));
    }
    public boolean isExist(Service service){
        return conn.withExtension(ServiceDAO.class, dao -> dao.isExist(service));
    }

    public int add(Service service) {
        return isExist(service)?-1:conn.withExtension(ServiceDAO.class, dao -> dao.add(service));
    }

    public int update(Service service) {
        return conn.withExtension(ServiceDAO.class, dao -> dao.update(service));
    }

    public Service getById(int id) {
        return conn.withExtension(ServiceDAO.class, dao -> dao.getById(id));
    }

    public List<Service> getAllActive() {
        return conn.withExtension(ServiceDAO.class, dao -> dao.getAllActive());
    }

    public Service getActiveById(int i) {
        return conn.withExtension(ServiceDAO.class, dao -> dao.getActiveById(i));
    }

    public List<Service> getSuggestServices() {
        List<Service> serivces=conn.withExtension(ServiceDAO.class, dao -> dao.getSuggestServices());
        Set<Integer> set = new HashSet<>();
        while (set.size() < 4 && set.size() < serivces.size()){
            Random random = new Random();
            int i = random.nextInt(serivces.size());
            set.add(i);
        }
        List<Service> res = new ArrayList<>();
        set.forEach(i -> res.add(serivces.get(i)));
        return res;
    }
    public static void main(String[] args) {
        System.out.println(getInstance().getActiveById(3));
    }
}