import {PROJECT, SERVICE, upload} from "../firebase/uploadImage.js";

CKEDITOR.replace('post', {
    width: "100%",
    height: "400px",
});
$(document).ready(function () {
    const filePond = FilePond.create($('#file_input_avatar')[0], {
        required: true,
        maxFiles: 1,
        labelIdle: 'Kéo thả hình ảnh vào đây',
        maxFileSize: '5MB',
        acceptedFileTypes: ['image/*'],
    });
})

function updateAvatar() {
    return new Promise((resolve, reject) => {
        const fileToUpload = FilePond.find($('#file_input_avatar')[0]).getFiles()
        upload(fileToUpload, SERVICE).then((data) => {
            $('#uploadAvatar').val(fileToUpload.map(e => e.file.name))
        })
        resolve(true);
    }).catch((error) => {
        reject(error)
    })
}

validate("#form-add-service", adminAddServiceValidator, function (form) {
    updateAvatar().then((data) => {
        let dataForm={
            name: $('#name').val(),
            status: $('#status').val(),
            description: $('#description').val(),
            avatar: FilePond.find($('#file_input_avatar')[0]).getFiles().map(e => e.file.name)[0],
            content: CKEDITOR.instances.post.getData()
        }
        $.ajax({
            url: '/api/admin/service/add',
            type: 'POST',
            dataType: 'json',
            data: dataForm,
            drawCallback: function (settings) {
                this.api().columns.adjust();
            },
            success: function (data) {
                if (data.status === 200) {
                    autoCloseAlertIcon(data.message, 1500, swal2Icon.SUCCESS, data.redirect)
                } else {
                    errorAlert(data.message)
                }
            },
            error: function (error) {
                console.log(123)
                errorAlert("Xin vui lòng thực hiện lại sau 5p")
            }
        });
    })

})
// function saveService(id) {
//     let form = new FormData();
//     form.append('name', $("#name").val());
//     form.append('status', $("#status").val());
//     form.append('description', $("#description").val());
//     form.append('avatar', $("#avatar").prop('files')[0]);
//     form.append('postId', id);
//     $.ajax({
//         url: "/api/admin/service?action=add",
//         type: "POST",
//         // dataType: "json",
//         processData: false,
//         contentType: false,
//         data: form,
//         success: function (data) {
//             console.log(data.responseText)
//             obj = JSON.parse(data);
//             if (obj.name == "success" || obj.name == "sys") {
//                 delayNotify(2000, obj.message);
//                 setTimeout(() => {
//                     window.location.href = 'service';
//                 }, 3000);
//             }
//         },
//         error: function (data) {
//             console.log(data.responseText)
//             var err = JSON.parse(data.responseText);
//             console.log(err)
//             for (let e of err) {
//                 console.log(e.name, e.message)
//                 //     console.log email
//                 fetchErr(e.name, e.message);
//
//
//             }
//         }
//     })
// }


// $('#save').click(function () {
//     let content = CKEDITOR.instances.post.getData();
//     $.ajax({
//         url: "/api/admin/post?action=add",
//         type: 'POST', dataType: "json",
//         data: {content: content},
//         success: function (data) {
//             console.log("success post")
//             saveService(data.data.id);
//         },
//         error: function (data) {
//             var err = JSON.parse(data.responseText);
//
//             for (const e of err) {
//                 console.log(e.name, e.message)
//                 fetchErr(e.name, e.message);
//             }
//         }
//     })
// })


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
