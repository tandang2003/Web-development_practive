package com.nhom44.log.util.function.admin;

import com.nhom44.bean.Category;
import com.nhom44.log.util.function.LogFunction;
import com.nhom44.services.CategoryService;

import javax.servlet.http.HttpServletRequest;

import static com.nhom44.util.GsonUtil.getGson;

public class CategoryLog extends LogFunction {
    private Category category;

    public CategoryLog(HttpServletRequest request, Category category) {
        super(request);
        this.category = category;
    }

    @Override
    protected String getValue() {
        Category category= CategoryService.getInstance().getById(this.category.getId());
        return getGson().toJson(category);
    }

    public void addLog() {
        resetDescription(request.getRemoteAddr() + " add category " + category.getId());
        this.setPostValue();
        this.setLevel(2);
        this.log();
    }
    public void editLog() {
        resetDescription(request.getRemoteAddr() + " edit category " + category.getId());
        this.setLevel(3);
        this.log();
    }
}
