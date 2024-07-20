import {getDownloadUrl, PROJECT, SERVICE} from "../firebase/uploadImage.js";

let index = 1;
$(document).ready(function () {
    $('#table-service').dataTable({
        "ajax": {
            "url": "/api/admin/service",
            "dataSrc": "",
            type: "get",
            dataType: "json",
        }, drawCallback: function (settings) {
            this.api().columns.adjust();
        },
        columns: [
            {
                render: function () {
                    return index++;
                }
            },
            {data: "name"},
            {data: "description"},
            {
                data: "avatar",
                render: function (avatar, type, row, meta) {
                    if (avatar == null || avatar === "") {
                        return "";
                    } else {
                        const imgId = 'img-' + meta.row + '-' + meta.col;
                        getDownloadUrl(avatar, SERVICE).then((data) => {
                            $('#' + imgId).attr('src', data[0]);
                        });
                        return `<img id="${imgId}" src="loading-spinner.gif" alt="" class="w-100">`;
                    }
                }
            },
            {data: "numberOfProject"},
            {
                data: "status",
                render: function (status) {
                    return (status === 1) ? `<i class="fa-solid fa-square active-icon" title="Đang phục vụ"></i>` : `<i class="fa-solid fa-square inactive-icon" title="Đang phục vụ"></i>`
                }
            },
            {
                data: "id",
                render: function (data, type, row) {
                    return `<a href="/admin/service/edit/${data}"><i class="fa-solid fa-pen p-1 icon-action"></i></a>`
                }
            }
        ]
        ,
        "columnDefs": [
            {"width": "5%", "targets": [0]},
            {"width": "15%", "targets": [1]},
            {"width": "30%", "targets": [2]},
            {"width": "15%", "targets": [3]},
            {"width": "10%", "targets": [4]},
            {"width": "10%", "targets": [5]},
            {"width": "10%", "targets": [6]},
            {className: " text-center mt-auto mb-auto text-break", targets: "_all"},
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
        "order": [[0, "asc"]],
    });

})

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


$(document).ready(function () {
    $(".sidebar-btn").click(function () {
        $(".wrapper").toggleClass("mycollapse");
    });

});
