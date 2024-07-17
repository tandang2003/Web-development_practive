import {getDownloadUrl, PROJECT} from "../firebase/uploadImage.js";

$(document).ready(function () {
    $(".sidebar-btn").click(function () {
        $(".wrapper").toggleClass("mycollapse");
    });

    $.ajax({
        url: `/api/admin/project`,
        type: "GET",
        dataType: "json",
        success: function (data) {
            console.log(data)
        },
        error: function (e) {
            console.log(e)
        }
    })
})
let index = 1;
$('#project-table').dataTable({
    ajax: {
        url: "/api/admin/project",
        type: "get",
        dataSrc: "",
        dataType: "json",
    },  drawCallback: function (settings) {
            this.api().columns.adjust();
    },
    columns: [
        {

            render: function () {
                return index++;
            }
        },
        {
            data: "title",
            render: function (title) {
                return (title == null || title === "") ? "---" : title;
            }
        },
        {
            data: "avatar",
            render: function (avatar, type, row, meta) {
                if (avatar == null || avatar === "") {
                    return "";
                } else {
                    const imgId = 'img-' + meta.row + '-' + meta.col;
                    getDownloadUrl(avatar, PROJECT).then((data) => {
                        $('#' + imgId).attr('src', data[0]);
                    });
                    return `<img id="${imgId}" src="loading-spinner.gif" alt="" class="w-100">`;
                }
            },
        },
        {
            data: "price",
            render: function (price) {
                return (price == null || price === 0) ? 0 : price + "VND";
            }
        },
        {
            data: "address",
            render: function (province) {
                return (province == null || province === "") ? "---" : province;
            }
        },
        {
            data: "category",
            render: function (category) {
                return (category == null || category === "") ? "---" : category;
            }
        },
        {
            data: "isAccepted", render: function (isAccepted) {
                if (isAccepted === 1) {
                    return '<i class="fa-solid fa-square active-icon" value="0"></i>'
                } else {
                    return '<i class="fa-solid fa-square inactive-icon" value="1"></i>'
                }
            }
        },
        {
            data: "status",
            render: function (status) {
                if (status === 1) {
                    return '<i class="fa-solid fa-square active-icon" value="0"></i>'
                } else {
                    return '<i class="fa-solid fa-square inactive-icon" value="1"></i>'
                }
            }
        },
        {
            data: "updatedAt", render: function (updatedAt) {
                return updatedAt
            }
        },
        {
            data: "id",
            render: function (id) {
                return '<a href="/admin/project/edit/' + id + '"><i class="icon-action fa-solid fa-edit"></i></a>\n'
            }
        },
    ],
    columnDefs: [
        {
            "targets": 0,
            "width": "5%",
        },
        {
            "targets": 1,
            "width": "15%",
        },
        {
            "targets": 2,
            "width": "10%",
        },
        {
            "targets": 3,
            "width": "15%",
        },
        {
            "targets": 4,
            "width": "10%",
        },
        {
            "targets": 5,
            "width": "10%",
        },
        {
            "targets": 6,
            "width": "10%",
        },
        {
            "targets": 7,
            "width": "5%",
        },
        {
            "targets": 8,
            "width": "10%",
        },
        {
            "targets": 9,
            "width": "10%",
        },
        {className: "text-center mt-auto mb-auto", targets: "_all"},

    ],
    language: {
        lengthMenu: "Hiển thị _MENU_ dòng",
        zeroRecords: "Không tìm thấy dữ liệu",
        info: "Hiển thị trang _PAGE_ trên _PAGES_",
        infoEmpty: "Không có dữ liệu",
        infoFiltered: "(lọc từ _MAX_ dòng dữ liệu)",
        search: "Tìm kiếm",
        paginate: {
            previous: "Trước",
            next: "Tiếp theo"
        }
    },
    pagingType: "full_numbers",
    lengthMenu: [5, 10, 15, 20],
    order: [[0, "asc"]],
});
// $('#project-table').columns.adjust().draw();


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
