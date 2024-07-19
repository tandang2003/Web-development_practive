package com.nhom44.log.util.function.admin;

import com.nhom44.bean.Slider;
import com.nhom44.log.model.Log;
import com.nhom44.log.util.function.LogFunction;
import com.nhom44.services.SliderService;

import javax.servlet.http.HttpServletRequest;

import static com.nhom44.util.GsonUtil.getGson;

public class SlideLog extends LogFunction {
    private Slider  slider;
    public SlideLog(HttpServletRequest request, Slider slider) {
        super(request);
        this.slider=slider;
    }

    @Override
    protected String getValue() {
        Slider slider = SliderService.getInstance().getById(this.slider.getId());
        return getGson().toJson(slider);
    }
    public void addLog(){
        resetDescription(request.getRemoteAddr() + " add slider " + slider.getId());
        this.setPostValue();
        this.setLevel(2);
        this.log();
    }
    public void editLog(){
        resetDescription(request.getRemoteAddr() + " edit slider " + slider.getId());
        this.setLevel(3);
        this.log();
    }
}
