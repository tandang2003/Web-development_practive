<%@include file="/layout/common.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<div class="header fixed-top ">
    <div class="header-menu row m-0">
        <div class="col-11 d-flex align-items-center">
            <div class="sidebar-btn mr-3">
                <i class="fas fa-bars"></i>
            </div>
            <div class="title text-uppercase">
                Xây dựng <span>Nhà Đẹp</span></div>
        </div>
        <ul class="col-1 d-flex align-items-center m-0">
            <li><a href="/logout?action=logout"><i
                    class="fas fa-sign-out-alt"></i></a></li>
        </ul>
    </div>
</div>
<div class="sidebar">
    <div class="sidebar-menu">
        <center class="logo">
            <a href="/home">
                <img src="/template/img/logo/logo.png" alt="logo" style="">
            </a>
        </center>
        <li class="sidebar-item">
            <a href="/admin/dashboard" class="menu-btn">
                <i class="fas fa-desktop"></i><span>Thống kê</span>
            </a>
        </li>
        <li class="sidebar-item" id="user">
            <a href="/admin/user_management?action=manager" class="menu-btn">
                <i class="fas fa-user-circle"></i><span>QL Người dùng</span>
            </a>
        </li>
        <li class="sidebar-item" id="project">
            <div class="menu-btn">
                <i class="fa-solid fa-building"> </i>
                <a href="/admin/project_management">
                    <span>QL Dự án</span>
                </a> <i
                    class="m-0 fas fa-chevron-circle-down drop-down"></i></div>
            <div class="sub-menu d-none">
                <a href="/admin/category_management" class="menu-btn">
                    <i class="fa-solid fa-building m-0"> </i> <i
                        class="fa-solid fa-folder-tree"></i><span>QL loại dự án</span>
                </a>
                <a href="/admin/post_project" class="menu-btn">
                    <i class="fa-solid fa-newspaper"></i><span>QL Bài viết dự án</span>
                </a>
                <a href="/admin/project_schedule" class="menu-btn">
                    <i class="fa-solid fa-bars-progress"></i><span>QL Dự án thi công</span>
                </a>
            </div>
        </li>

        <li class="sidebar-item" id="type-project">
            <div class="menu-btn">
                <a href="/admin/service">
                    <i class="fa-solid fa-toolbox"></i><span>QL Dịch vụ</span>
                </a>
                <i class="m-0 fas fa-chevron-circle-down drop-down"></i>
            </div>
            <div class="sub-menu d-none">
                <a href="/admin/post_service" class="menu-btn">
                    <i class="fa-solid fa-newspaper"></i><span>QL Bài viết dịch vụ</span>
                </a>
            </div>
        </li>

        <li class="sidebar-item" id="contact">
            <div class="menu-btn">
                <a href="/admin/contact">
                    <i class="fa-solid fa-newspaper"></i><span>QL Liên hệ</span>
                </a>
            </div>
        </li>

        <li class="sidebar-item" id="order">
            <div class="menu-btn">
                <a href="/admin/cart">
                    <i class="fa-solid fa-toolbox"></i> <span>QL Yêu cầu</span>
                </a>
            </div>
        </li>

        <li class="sidebar-item" id="slide">
            <a href="/admin/slide" class="menu-btn">
                <i class="fa-regular fa-clone"></i><span>QL Slide</span></span>
            </a>
        </li>
    </div>
</div>
<!-- Central Modal Small -->

<div id="modal"></div>
<%--<div class="modal fade" id="centralModalSm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"--%>
<%--     aria-hidden="true">--%>
<%--    <!-- Change class .modal-sm to change the size of the modal -->--%>
<%--    <div class="modal-dialog modal-sm" role="document">--%>
<%--        <div class="modal-content">--%>
<%--            <div class="modal-header">--%>
<%--                <h4 class="modal-title w-100 text-center" id="myModalLabel">Thông báo</h4>--%>
<%--            </div>--%>
<%--            <div class="modal-body">--%>
<%--                <p class="text-center" id="notify"></p>--%>
<%--            </div>--%>
<%--            <div class="modal-footer">--%>
<%--                <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Close</button>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>
<!-- Central Modal Small -->

