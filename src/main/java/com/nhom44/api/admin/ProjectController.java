package com.nhom44.api.admin;

import com.google.gson.Gson;
import com.nhom44.bean.Project;
import com.nhom44.bean.User;
import com.nhom44.bean.Image;
import com.nhom44.bean.ResponseModel;
import com.nhom44.services.ImageService;
import com.nhom44.services.ProjectService;
import com.nhom44.services.ServiceOfProjectService;
import com.nhom44.services.UserService;
import com.nhom44.util.StringUtil;
import com.nhom44.util.Upload;
import com.nhom44.validator.*;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.beanutils.converters.DateTimeConverter;
import org.apache.commons.beanutils.converters.SqlDateConverter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@WebServlet(urlPatterns = "/api/admin/project")
@MultipartConfig(
        maxFileSize = 1024 * 1024 * 10,
        maxRequestSize = 1024 * 1024 * 10 * 5,
        fileSizeThreshold = 1024 * 1024 * 10)
public class ProjectController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Project> projects = ProjectService.getInstance().getAllProject();
        projects.forEach(project -> project.setUpdatedAt(project.getUpdatedAt().trim()
//        .substring(0,project.getUpdatedAt().indexOf(" "))
        ));
        Gson gson = new Gson();
        PrintWriter printWriter = resp.getWriter();
        String json = gson.toJson(projects);
        printWriter.println(json);
        printWriter.flush();
        printWriter.close();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action") == null ? "#" : req.getParameter("action");
        System.out.println(req.getParameterMap().keySet().toString());
        List<ResponseModel> errMess = new ArrayList<>();
        boolean isErr = false;
        SingleValidator validator = new EmailSingleValidator();
        Project project = new Project();
        User user = new User();
        // email validator
        if (!validator.validator(req.getParameter("email"))) {
            ResponseModel responseModel = new ResponseModel();
            responseModel.setMessage("Email không hợp lệ");
            responseModel.setName("email");
            errMess.add(responseModel);
            isErr = true;
        }
        // title validator
        validator = new TitleOrNameSingleValidator();
        if (!validator.validator(req.getParameter("title"))) {
            ResponseModel responseModel = new ResponseModel();
            responseModel.setMessage("Tiêu đề phải có ít nhất 6 ký tự");
            responseModel.setName("title");
            errMess.add(responseModel);
            isErr = true;
        }
        // category validator
        validator = new SelectorSingleValidator();
        if (!validator.validator(req.getParameter("categoryId"))) {
            ResponseModel responseModel = new ResponseModel();
            responseModel.setMessage("Vui lòng chọn loại dự án");
            responseModel.setName("category");
            errMess.add(responseModel);
            isErr = true;
        }
        if (!validator.validator(req.getParameter("provinceId"))) {
            ResponseModel responseModel = new ResponseModel();
            responseModel.setMessage("Vui lòng chọn loại địa chỉ");
            responseModel.setName("province");
            errMess.add(responseModel);
            isErr = true;
        }
        String input = req.getParameter("service");
        String[] arr = input.split(",");
        System.out.println(arr.length);
        if (!new ServiceSelectValidator().validator(arr)) {
            ResponseModel responseModel = new ResponseModel();
            System.out.println("lỗi service" + input);
            responseModel.setMessage("Vui lòng chọn loại dịch vụ");
            responseModel.setName("service");
            errMess.add(responseModel);
            isErr = true;
        }
        //number validator
        validator = new NumberVallidator();
        if (!validator.validator(req.getParameter("price"))) {
            ResponseModel responseModel = new ResponseModel();
            responseModel.setMessage("Vui lòng nhập lại kinh phí");
            responseModel.setName("price");
            errMess.add(responseModel);
            isErr = true;
        }
        if (!validator.validator(req.getParameter("acreage"))) {
            ResponseModel responseModel = new ResponseModel();
            responseModel.setMessage("Vui lòng nhập lại diện tích xây dựng");
            responseModel.setName("acreage");
            errMess.add(responseModel);
            isErr = true;
        }
        String isComplete = req.getParameter("isComplete");
        System.out.println(isComplete);
        if (isComplete.equals("0")) {
            validator = new TitleOrNameSingleValidator();
            if (!validator.validator(req.getParameter("schedule"))) {
                ResponseModel responseModel = new ResponseModel();
                responseModel.setMessage("Vui lòng nhập tiến độ dự án");
                responseModel.setName("schedule");
                errMess.add(responseModel);
                isErr = true;
            }
            validator = new DateValidator();
            if (!validator.validator(req.getParameter("estimated_complete"))) {
                ResponseModel responseModel = new ResponseModel();
                responseModel.setMessage("Vui ng nhập lại ngày hoàn thành");
                responseModel.setName("estimated_complete");
                errMess.add(responseModel);
                isErr = true;
            }
        }

        try {
            DateTimeConverter dateTimeConverter = new SqlDateConverter(null);
            dateTimeConverter.setPattern("yyyy-MM-dd HH:mm:ss");
            ConvertUtils.register(dateTimeConverter, Date.class);
            BeanUtils.populate(project, req.getParameterMap());
            BeanUtils.populate(user, req.getParameterMap());
            System.out.println(req.getParameter("postId"));
            project.setPostId(req.getParameter("postId") == null ? 0 : Integer.parseInt(req.getParameter("postId")));
            user = UserService.getInstance().getUserByEmail(user.getEmail());
            if (user == null) {
                ResponseModel responseModel = new ResponseModel();
                responseModel.setMessage("Email không tồn tại");
                responseModel.setName("email");
                errMess.add(responseModel);
                isErr = true;
            }
            if (isErr) {
                System.out.println(1231);
                resp.setStatus(400);
                Gson gson = new Gson();
                PrintWriter printWriter = resp.getWriter();
                String json = gson.toJson(errMess);
                System.out.println(json);
                printWriter.print(json);
                printWriter.flush();
                printWriter.close();
                return;
            }
            if (action.equalsIgnoreCase("add")) {
                project = ProjectService.getInstance().add(project, !req.getParameter("isComplete").equals("0"));
                List<String> services = Arrays.asList(arr);
                for (String service : services
                ) {
                    ServiceOfProjectService.getInstance().addServiceForProject(project.getId(), Integer.parseInt(service));
                }
                List<String> groupImages = Upload.uploadFile(Upload.UPLOAD_PROJECT + "/" + StringUtil.projectFolder(project.getId()) + "/post", "groupImage", req);
                System.out.println(groupImages.toString());
                if (!groupImages.isEmpty()) {
                    for (String path : groupImages
                    ) {
                        Image img = StringUtil.getImage(path);
                        int idImg = ImageService.getInstance().add(img);
                        System.out.println(idImg);
                        ImageService.getInstance().addImageForProject(project.getId(), idImg);
                    }
                } else {
                    ResponseModel responseModel = new ResponseModel();
                    resp.setStatus(400);
                    responseModel.setMessage("Vui lòng chọn ảnh mô tả dự án");
                    responseModel.setName("groupImage");
                    errMess.add(responseModel);
                    Gson gson = new Gson();
                    PrintWriter printWriter = resp.getWriter();
                    String json = gson.toJson(errMess);
                    printWriter.println(json);
                    printWriter.flush();
                    printWriter.close();
                    return;
                }
                ProjectService.getInstance().addProjectForUser(project.getId(), user.getId());
                List<String> fileNames = Upload.uploadFile(Upload.UPLOAD_PROJECT + "/" + StringUtil.projectFolder(project.getId()), "avatar", req);

                if (!fileNames.isEmpty()) {
                    System.out.println("avatar filename : " + fileNames.toString());
                    project.setAvatar(fileNames.get(0));
                    ProjectService.getInstance().updateProject(project, !req.getParameter("isComplete").equals("0"));
                    System.out.println(project.toString());
                } else {
                    ResponseModel responseModel = new ResponseModel();
                    resp.setStatus(400);
                    responseModel.setMessage("Vui lòng chọn ảnh đại diện");
                    responseModel.setName("avatar");
                    errMess.add(responseModel);
                    Gson gson = new Gson();
                    PrintWriter printWriter = resp.getWriter();
                    String json = gson.toJson(errMess);
                    printWriter.println(json);
                    printWriter.flush();
                    printWriter.close();
                    return;
                }
            } else if (action.equalsIgnoreCase("edit")) {
                project = ProjectService.getInstance().updateProject(project, !req.getParameter("isComplete").equals("0"));
                List<String> services = Arrays.asList(arr);
                ServiceOfProjectService.getInstance().updateServiceForProject(project.getId(), services);
                if (req.getParameter("notHaveGroupImages") == null) {
                    List<String> groupImages = Upload.uploadFile(Upload.UPLOAD_PROJECT + "/" + StringUtil.projectFolder(project.getId()) + "/post", "groupImage", req);
                    if (!groupImages.isEmpty()) {
                        ImageService.getInstance().deleteAllImageProProject(project.getId());
                        for (String path : groupImages
                        ) {
                            Image img = StringUtil.getImage(path);
                            int idImg = ImageService.getInstance().add(img);
                            ImageService.getInstance().updateImageForProject(project.getId(), idImg);
                        }
                    }
                }
                System.out.println(req.getParameter("notHaveAvatar") );
                if (req.getParameter("notHaveAvatar") == null) {
                    List<String> fileNames = Upload.uploadFile(Upload.UPLOAD_PROJECT + "/" + StringUtil.projectFolder(project.getId()), "avatar", req);

                    if (!fileNames.isEmpty()) {

                        project.setAvatar(fileNames.get(0));
                        project = ProjectService.getInstance().updateProjectAvatar(project);

                    }
                }
                ProjectService.getInstance().updateProjectForUser(project.getId(), user.getId());
            }
            resp.setStatus(200);
            ResponseModel responseModel = new ResponseModel();
            responseModel.setName("success");
            responseModel.setMessage("Thêm thành công");
            responseModel.setData("/admin/project_management");
            Gson gson = new Gson();
            PrintWriter printWriter = resp.getWriter();
            String json = gson.toJson(responseModel);
            printWriter.println(json);
            printWriter.flush();
            printWriter.close();
            return;
        } catch (Exception e) {
            ResponseModel responseModel = new ResponseModel();
            resp.setStatus(200);
            responseModel.setMessage("Lỗi không xác định");
            e.printStackTrace();
            responseModel.setData(null);
            responseModel.setName("sys");
            Gson gson = new Gson();
            PrintWriter printWriter = resp.getWriter();
            String json = gson.toJson(responseModel);
            printWriter.println(json);
            printWriter.flush();
            printWriter.close();
            return;
        }
    }
}
