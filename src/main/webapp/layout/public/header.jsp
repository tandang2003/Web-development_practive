<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<nav class="navbar navbar-expand-lg navbar-light sticky-top nav-property ">
    <div class="container">
        <a class="navbar-brand "
           href="#">
            <div class="navbar-brand flex-center justify-content-between ">
                <img class="mr-3 ml-4 " src="<c:url value="/template/img/logo/logo.png" />" style="width: 50px">
                <h5 class=" text-uppercase mb-2 mt-2 font-weight-bold main-color">XÂY DỰNG NHÀ ĐẸP</h5>
            </div>
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent-555"
                aria-controls="navbarSupportedContent-555" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse border-left row align-items-center" id="navbarSupportedContent-555">
            <ul class="navbar-nav col-9 border-right">
                <li class="nav-item nav-menuItem font-weight-bolder"
                    id="<c:if test="${page=='home'}">nav-menuItem-active</c:if>">
                    <a class="nav-link" href="/home">Trang Chủ
                    </a>
                </li>
                <li class="nav-item nav-menuItem font-weight-bolder"
                    id="<c:if test="${page=='intro'}">nav-menuItem-active</c:if>">
                    <a class="nav-link" href="/intro">Giới Thiệu</a>
                </li>
                <li class="nav-item nav-menuItem position-relative font-weight-bolder nav-dropdownItem d-flex align-items-center"
                    id="<c:if test="${page=='service'||page=='post-service'}">nav-menuItem-active</c:if>">
                    <a class="nav-link justify-content-center text-center"
                       href="/service"
                       role="link"
                    >Dịch vụ
                    </a>
                    <i class="fa-solid fa-angle-down position-absolute " style="color: #000000;"></i>
                    <div class="dropdown-menu mt-0 ">
                        <c:forEach items="${sessionScope.services}" var="service">
                            <a class="dropdown-item text-center text-break text-uppercase" style="font-size: 16px"
                               href="/post/service?id=${service.id}">${service.name}</a></c:forEach>
                        <%--                        <a class="dropdown-item text-center" style="font-size: 16px" href="/service">Xây Nhà Trọn--%>
                        <%--                            Gói</a>--%>
                        <%--                        <a class="dropdown-item text-center" style="font-size: 16px" href="/service">Xây Nhà Thô</a>--%>
                        <%--                        <a class="dropdown-item text-center" style="font-size: 16px" href="/service">Xây Biệt Thự</a>--%>
                        <%--                        <a class="dropdown-item text-center" style="font-size: 16px" href="/service">Xây Nhà Xưởng</a>--%>
                    </div>
                </li>
                <li class=" nav-item
    nav-menuItem position-relative font-weight-bolder nav-dropdownItem d-flex align-items-center"
                    id="<c:if test="${page=='project'||page=='post-project'}">nav-menuItem-active</c:if>">
                    <a class="nav-link justify-content-center text-center"
                       href="/project"
                       role="link"

                    >Dự án
                    </a>
                    <i class="fa-solid fa-angle-down position-absolute " style="color: #000000;"></i>

                    <div class="dropdown-menu mt-0">
                        <c:forEach items="${sessionScope.categories}" var="category">
                            <a class="dropdown-item text-center text-uppercase" style="font-size: 16px"
                               href="/project?category=${category.id}">${category.name}</a></c:forEach>
                        <%--                        <a class="dropdown-item text-center" style="font-size: 16px" href="/project">Biệt Thự</a>--%>
                        <%--                        <a class="dropdown-item text-center" style="font-size: 16px" href="/project">Nhà Phố</a>--%>
                        <%--                        <a class="dropdown-item text-center" style="font-size: 16px" href="/project">Văn Phòng</a>--%>
                    </div>
                </li>
                <li class="nav-item nav-menuItem font-weight-bolder"
                    id="<c:if test="${page=='contact'}">nav-menuItem-active</c:if>">
                    <a class="nav-link"
                       href="/contact">Liên Hệ</a>
                </li>
                <c:choose>
                    <c:when test="${sessionScope.get('auth') == null}">
                        <li class="nav-item nav-menuItem font-weight-bolder">
                            <a class="nav-link" href="/login">Đăng nhập</a>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li class="nav-item nav-menuItem position-relative font-weight-bolder
                        nav-dropdownItem d-flex align-items-center"
                            id="<c:if test="${page=='account'}">nav-menuItem-active</c:if>">
                            <a class="nav-link justify-content-center text-center"
                               href="/user"
                               role="link">Tài khoản
                            </a>
                            <div class="dropdown-menu mt-0 w-100">
                                <c:if test="${sessionScope.get('auth').getRole() == 1}">
                                    <a class="dropdown-item text-center" style="font-size: 16px" href="/admin">Quản
                                        trị</a></c:if>
                                <a class="dropdown-item text-center" style="font-size: 16px"
                                   href="/logout?action=logout">Đăng
                                    xuất</a>
                            </div>
                        </li>
                    </c:otherwise>
                </c:choose>
            </ul>
            <!--icon font ring-->
            <div class="phone-contain flex-center justify-content-center col-3">

                <div class="icon-phone-ring col-lg-6 col-md-6 col-sm-12 ">
                    <div class="w-100 h-100 d-flex justify-content-center align-items-center">
                        <i class="fa-solid fa-phone"></i>
                        <i class="circle-1"></i>
                    </div>
                </div>
                <div>
                    <a class=" col-lg-6 col-md-6">0352033199</a>
                </div>
            </div>
        </div>
    </div>
</nav>
