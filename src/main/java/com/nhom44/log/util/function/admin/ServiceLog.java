package com.nhom44.log.util.function.admin;

import com.nhom44.bean.Service;
import com.nhom44.bean.Slider;
import com.nhom44.log.util.function.LogFunction;
import com.nhom44.services.ServiceOfProjectService;
import com.nhom44.services.SliderService;

import javax.servlet.http.HttpServletRequest;

import static com.nhom44.util.GsonUtil.getGson;

public class ServiceLog extends LogFunction {
    private Service service;

    public ServiceLog(HttpServletRequest request, Service service) {
        super(request);
        this.service = service;
    }

    @Override
    protected String getValue() {
        Service service = ServiceOfProjectService.getInstance().getById(this.service.getId());
        return getGson().toJson(service);
    }

    public void addLog() {
        resetDescription(request.getRemoteAddr() + " add service " + service.getId());
        this.setPostValue();
        this.setLevel(2);
        this.log();
    }

    public void editLog(Service service) {
        this.service = service;
        this.setPreValue();
        ServiceOfProjectService.getInstance().update(service);
        this.setPostValue();
        resetDescription(request.getRemoteAddr() + " edit service " + service.getId());
        this.setLevel(3);
        this.log();
    }
}

