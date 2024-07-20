package com.nhom44.log.util.function.admin;

import com.nhom44.bean.Project;
import com.nhom44.log.util.function.LogFunction;
import com.nhom44.services.ProjectService;

import javax.servlet.http.HttpServletRequest;

import static com.nhom44.util.GsonUtil.getGson;

public class ProjectLog extends LogFunction {
    private Project project;
    public ProjectLog(HttpServletRequest request, Project project) {
        super(request);
        this.project=project;
    }

    @Override
    protected String getValue() {
        Project project= ProjectService.getInstance().getById(this.project.getId()+"");
        return getGson().toJson(project);
    }
    public void addProject(){
        resetDescription(request.getRemoteAddr() + " add project " + project.getId());
        this.setPostValue();
        this.setLevel(2);
        this.log();
    }
    public void editProject(Project project, boolean isComplete){
        this.project=project;
        this.setPreValue();
        ProjectService.getInstance().updateProject(project, isComplete);
        this.setPostValue();
        resetDescription(request.getRemoteAddr() + " edit project " + project.getId());
        this.setLevel(3);
        this.log();
    }
}
