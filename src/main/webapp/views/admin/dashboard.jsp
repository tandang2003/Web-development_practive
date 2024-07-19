<%--
  Created by IntelliJ IDEA.
  User: Clover
  Date: 04/12/2023
  Time: 10:22 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@include file="/layout/common.jsp" %>
<html>
<head>
    <meta charset="UTF-8">
    <%@include file="/layout/public/link.jsp" %>
    <link href=" <c:url value="/template/css/admin-nav-bar.css"/>" rel="stylesheet">
    <link href=" <c:url value="/template/css/admin-datatable.css"/>" rel="stylesheet">
    <link href=" <c:url value="/template/lib/DataTables/DataTables-1.13.6/css/jquery.dataTables.min.css"/>"
          rel="stylesheet">
    <link href=" <c:url value="/template/css/admin_Dashboard.css"/>" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <title>Title</title>
</head>
<body>
<!-- Sidebar navigation -->
<div class="wrapper">
    <%@include file="/layout/admin/adminheader.jsp"%>
    <div class="main-container">
        <div class="container">
            <nav class="" aria-label="breadcrumb">
                <ol class="breadcrumb m-0 bg-white">
                    <li class="breadcrumb-item"><a class="black-text main-color" href="#">Thống kê</a></li>
                </ol>
            </nav>
            <!--Section: Content-->
            <section class="p-2 z-depth-1">

                <h3 class="text-center font-weight-bold mb-3">Số lượng</h3>

                <div class="row d-flex justify-content-center">

                    <div class="col-md-6 col-lg-3 text-center">
                        <h4 class="font-weight-normal mb-3">
                            <i class="fa-solid fa-building indigo-text "></i>
                            <span class="d-inline-block count-up" data-from="0" data-to="${numberProject}"
                                  data-time="2000">${numberProject}</span>
                        </h4>
                        <p class="font-weight-normal text-muted">Dự án</p>
                    </div>

                    <div class="col-md-6 col-lg-3 text-center">
                        <h4 class="font-weight-normal mb-3">
                            <i class="fa-solid fa-sitemap indigo-text"></i>
                            <span class="d-inline-block count1" data-from="0" data-to="${numberCategory}"
                                  data-time="2000">${numberCategory}</span>
                        </h4>
                        <p class="font-weight-normal text-muted">Loại dự án</p>
                    </div>

                    <div class="col-md-6 col-lg-3 text-center">
                        <h4 class=" font-weight-normal mb-3">
                            <i class="fa-solid fa-toolbox indigo-text"></i>
                            <span class="d-inline-block count2" data-from="0" data-to="${numberService}"
                                  data-time="2000">${numberService}</span>
                        </h4>
                        <p class="font-weight-normal text-muted">Loại dịch vụ</p>
                    </div>

                    <div class="col-md-6 col-lg-3 text-center">
                        <h4 class=" font-weight-normal mb-3">
                            <i class="fa-solid fa-user indigo-text"></i>
                            <span class="d-inline-block count2" data-from="0" data-to="${numberUser}"
                                  data-time="2000">${numberUser}</span>
                        </h4>
                        <p class="font-weight-normal text-muted">Người dùng</p>
                    </div>


                </div>

            </section>
            <!--Section: Content-->
            <section class="table-section mt-3">
                <div class="row shadow pt-3 pb-3" style="">
                    <div class="col-md-12 col-lg-6 pr-1 border-right">
                        <h5 class="font-weight-bold pl-3 pr-3 main-color text-center">Dự án</h5>
                        <table id="table1" class="display border" style="width:100%">
                            <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Tên dự án</th>
                                <th scope="col">Chủ đầu tư</th>
                                <th scope="col">Trạng thái</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td>
                                    <i class="fa-solid fa-square active-icon" title="Đã hoàn thành" value="1"></i>
                                    <p class="d-none">1</p>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="col-md-12 col-lg-6 pl-1 ">
                        <h5 class="font-weight-bold pl-3 pr-3 main-color text-center">Graph</h5>
                        <div class="chart-container">
                            <canvas id="myChart"></canvas>
                        </div>
                    </div>
                </div>
            </section>

        </div>
    </div>
</div>
<!--/. Sidebar navigation -->
<%@include file="/layout/public/script.jsp" %>
<script src="<c:url value="/template/lib/DataTables/DataTables-1.13.6/js/jquery.dataTables.min.js"/>"></script>
<script>
    $(document).ready(function () {
        $.ajax({
            url: '/api/dashboard/project',
            type: 'GET',
            success: function (data) {
                console.log(data)
            }
        })
    });
</script>
<script>
    let index = 1;
    $('#table1').DataTable({
        ajax: {
            url: '/api/dashboard/project',
            type: 'GET',
            dataSrc: ''
        },
        "columns": [
            {
                render: function () {
                    return index++
                },
            },
            {
                data: "title",
                render: function (title) {
                    if (title == null || title === "") return "---"; else return title;
                }
            },
            {
                data: "email",
                render: function (email) {
                    if (email == null || email === "null") return "---"; else return email;
                }
            },
            {
                data: "status",
                render: function (status) {
                    return status == 1 ? "<i class='fa-solid fa-square active-icon'></i>" : "<i class='fa-solid fa-square inactive-icon'></i>"
                }
            },
        ],
        "columnDefs": [
            {"width": "5%", "targets": 0},
            {className: "text-center font-weight-bold", targets: "_all"},
        ],
        "language": {
            "lengthMenu": "Hiển thị _MENU_ dòng",
            "zeroRecords": "Không tìm thấy dữ liệu",
            "info": "Hiển thị trang _PAGE_ trên _PAGES_",
            "infoEmpty": "Không có dữ liệu",
            "infoFiltered": "(lọc từ _MAX_ dòng dữ liệu)",
            "search": "Tìm kiếm",
            "paginate": {
                "previous": "Trước",
                "next": "Tiếp theo"
            }
        },
        "pagingType": "full_numbers",
        "lengthMenu": [5, 10, 15, 20],
    });
    $('#table2').DataTable({
        "columnDefs": [
            {"width": "5%", "targets": 0},
            {"width": "30%", "targets": 2},
            {className: "text-center font-weight-bold", targets: "_all"},
        ]
        ,
        "lengthMenu": [5, 10, 15, 20],
    });
    // document.querySelectorAll('.paginate_button ').forEach(function (e) {
    //     e.preventDefault();
    // })
</script>

<script>
    (function ($) {
        $.fn.counter = function () {
            const $this = $(this),
                numberFrom = parseInt($this.attr('data-from')),
                numberTo = parseInt($this.attr('data-to')),
                delta = numberTo - numberFrom,
                deltaPositive = delta > 0 ? 1 : 0,
                time = parseInt($this.attr('data-time')),
                changeTime = 10;

            let currentNumber = numberFrom,
                value = delta * changeTime / time;
            var interval1;
            const changeNumber = () => {
                currentNumber += value;
                //checks if currentNumber reached numberTo
                (deltaPositive && currentNumber >= numberTo) || (!deltaPositive && currentNumber <= numberTo) ? currentNumber = numberTo : currentNumber;
                this.text(parseInt(currentNumber));
                currentNumber == numberTo ? clearInterval(interval1) : currentNumber;
            }

            interval1 = setInterval(changeNumber, changeTime);
        }
    }(jQuery));
    $(document).ready(function () {

        $('.count-up').counter();
        $('.count1').counter();
        $('.count2').counter();
        $('.count3').counter();
        new WOW().init();
        setTimeout(function () {
            $('.count5').counter();
        }, 3000);
    });
</script>
<script>
    let cur;
    for (let item of $('.sidebar-item')) {
        item.addEventListener('click', function () {
            if (cur != null) {
                cur.classList.remove('d-block');
                cur.classList.add('d-none');
            }
            if (this.children.length === 2) {
                this.children[1].classList.remove('d-none')
                this.children[1].classList.add('d-block')
                cur = this.children[1];
            }
        })
    }

</script>
<script>
    $(document).ready(function () {
        $(".sidebar-btn").click(function () {
            $(".wrapper").toggleClass("mycollapse");
        });
    });
</script>
<script>
    // Chart Data
    const ctx = document.getElementById('myChart').getContext('2d');
    const myChart = new Chart(ctx, {
        type: 'line', // Change this to the type of chart you want
        data: {
            labels: ['Project', 'Category', 'Service', 'User'], // Update labels as needed
            datasets: [{
                label: '# of Items',
                data: [${numberProject}, ${numberCategory}, ${numberService}, ${numberUser}], // Update with your data
                backgroundColor: [
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(54, 162, 235, 0.2)',
                    'rgba(255, 206, 86, 0.2)',
                    'rgba(75, 192, 192, 0.2)'
                ],
                borderColor: [
                    'rgba(255, 99, 132, 1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 206, 86, 1)',
                    'rgba(75, 192, 192, 1)'
                ],
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });
</script>
</body>
</html>
