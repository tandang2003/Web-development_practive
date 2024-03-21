$(document).ready(function () {
    $('.mdb-select').materialSelect();
});
$(document).ready(function () {
    $(".sidebar-btn").click(function () {
        $(".wrapper").toggleClass("mycollapse");
    });

});
$('.datepicker').datepicker({
    inline: true,
    monthsFull: ['Tháng 01', 'Tháng 02', 'Tháng 03', 'Tháng 04', 'Tháng 05', 'Tháng 06', 'Tháng 07', 'Tháng 08', 'Tháng 09', 'Tháng 10',
        'Tháng 11', 'Tháng 12'],

    weekdaysFull: ["CN", "T2", "T3", "T4", "T5", "T6", "T7"],
    showWeekdaysFull: true,
    today: 'Hôm nay',
    clear: 'Xóa',
    close: 'Đóng',
    regional: 'vi-VN',
    labelMonthNext: 'Tháng kế tiêp',
    labelMonthPrev: 'Tháng trước',
    labelMonthSelect: 'Chọn tháng',
    labelYearSelect: 'Chọn năm',
    format: 'yyyy-mm-dd',
});