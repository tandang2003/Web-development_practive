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
                        <h5 class="font-weight-bold pl-3 pr-3 main-color text-center">Post</h5>
                        <div class="chart-container">
                            <canvas id="myChart1"></canvas>
                        </div>
                    </div>
                    <div class="col-md-12 col-lg-6 pl-1 ">
                        <h5 class="font-weight-bold pl-3 pr-3 main-color text-center">Post</h5>
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
        function fetchDataAndUpdateChart() {
            $.ajax({
                url: '/api/dashboard/project',
                type: 'GET',
                success: function (data) {
                    updateChart(data);
                },
                error: function (error) {
                    console.log('Error fetching data:', error);
                }
            });
        }

        function parseDate(dateStr) {
            if (!dateStr) {
                return new Date();
            }

            // Convert 'yyyy-MM-dd HH:mm:ss' to a Date object
            const [datePart, timePart] = dateStr.split(' ');
            if (!datePart || !timePart) {
                return new Date();
            }

            const [year, month, day] = datePart.split('-').map(Number);
            const [hour, minute, second] = timePart.split(':').map(Number);
            return new Date(year, month - 1, day, hour, minute, second);
        }

        function updateChart(data) {
            if (!data || !data.histories || !data.posts) {
                return;
            }

            const histories = data.histories;
            const dateCountMap = {};
            histories.forEach(history => {
                if (!history.createdAt) {
                    return;
                }
                const createdAt = parseDate(history.createdAt);
                const dateKey = createdAt.toISOString().split('T')[0]; // Format YYYY-MM-DD

                if (dateCountMap[dateKey]) {
                    dateCountMap[dateKey]++;
                } else {
                    dateCountMap[dateKey] = 1;
                }
            });

            const dates = Object.keys(dateCountMap);
            const counts = dates.map(date => dateCountMap[date]);

            const ctx = document.getElementById('myChart').getContext('2d');
            if (window.myChart instanceof Chart) {
                window.myChart.destroy();
            }
            window.myChart = new Chart(ctx, {
                type: 'line',
                data: {
                    labels: dates,
                    datasets: [{
                        label: 'Số lần truy cập theo ngày',
                        data: counts,
                        backgroundColor: 'rgba(54, 162, 235, 0.2)',
                        borderColor: 'rgba(54, 162, 235, 1)',
                        borderWidth: 1,
                        pointStyle: 'circle',
                        pointRadius: 5,
                        pointBorderColor: 'rgba(54, 162, 235, 1)',
                        pointBackgroundColor: 'rgba(54, 162, 235, 0.2)',
                    }]
                },
                options: {
                    scales: {
                        x: {
                            ticks: {
                                autoSkip: true,
                                maxTicksLimit: 20
                            }
                        },
                        y: {
                            type: 'logarithmic',
                            ticks: {
                                callback: function(value, index, values) {
                                    // Custom log scale labels
                                    return Number(value).toLocaleString();
                                }
                            },
                            beginAtZero: true
                        }
                    }
                }
            });
        }
        fetchDataAndUpdateChart();

        setInterval(fetchDataAndUpdateChart, 2000);
    });
</script>
<script>
    $(document).ready(function () {
        $.ajax({
            url: '/api/dashboard/project',
            type: 'GET',
            success: function (data) {
                console.log(data);
                updateChart(data);
            },
            error: function (error) {
                console.log(error);
            }
        });

        function updateChart(data) {
            const histories = data.histories;
            const posts = data.posts;

            const postCountMap = {};
            histories.forEach(history => {
                if (!postCountMap[history.postId]) {
                    postCountMap[history.postId] = 0;
                }
                postCountMap[history.postId]++;
            });

            const postLabels = [];
            const postData = [];
            posts.forEach(post => {
                postLabels.push('Post ' + post.id);
                postData.push(postCountMap[post.id] || 0);  // Default to 0 if no occurrences
            });

            const ctx = document.getElementById('myChart1').getContext('2d');
            new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: postLabels,
                    datasets: [{
                        label: 'Tổng lượt truy cập bài post',
                        data: postData,
                        backgroundColor: 'rgba(54, 162, 235, 0.2)',
                        borderColor: 'rgba(54, 162, 235, 1)',
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
        }
    });
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
</body>
</html>
