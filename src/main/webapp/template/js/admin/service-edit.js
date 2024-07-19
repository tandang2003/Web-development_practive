import {GALLERY, getImageInfo, SERVICE, upload} from "../firebase/uploadImage.js";

CKEDITOR.replace('post', {
    width: "100%",
    height: "400px",
});
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
validate("#form-edit-service", adminAddServiceValidator, function (form) {
    updateAvatar().then((data) => {
        let dataForm = {
            id: $('#id').val(),
            name: $('#name').val(),
            status: $('#status').val(),
            description: $('#description').val(),
            avatar: FilePond.find($('#file_input_avatar')[0]).getFiles().map(e => e.file.name)[0],
            content: CKEDITOR.instances.post.getData()
        }
        $.ajax({
            url: '/api/admin/service/edit',
            type: 'POST',
            dataType: 'json',
            data: dataForm,
            drawCallback: function (settings) {
                this.api().columns.adjust();
            },
            success: function (data) {
                localStorage.setItem('message', data.message)
                if (data.status === 200) {
                    autoCloseAlertIcon(data.message, 3000, swal2Icon.SUCCESS, data.redirect)
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

$(document).ready(function () {
    const filePond = FilePond.create($('#file_input_avatar')[0], {
        required: true,
        maxFiles: 1,
        labelIdle: 'Kéo thả hình ảnh vào đây',
        maxFileSize: '5MB',
        acceptedFileTypes: ['image/*'],
    });

    initialData().then(data => {
        $('#id').val(data.service.id);
        $('#name').val(data.service.name);
        $('#description').val(data.service.description);
        $('#status').val(data.service.status);
        CKEDITOR.instances.post.setData(data.post.content);
        getFilesForFilePondProperties([data.service.avatar], SERVICE).then((data) => {
            filePond.addFiles(data)
        })
        // filePond.addFile(data.service.avatar);
    })


})

function initialData() {
    return new Promise((resolve, reject) => {
        const id = window.location.href.split('/').pop();
        $.ajax({
            url: '/api/admin/service/edit/' + id,
            type: 'GET',
            dataType: 'json',
            success: function (data) {
                if (data.status === 200)
                    resolve(data);
                else
                    reject(data)
            },
            error: function (error) {
                reject(error);
            }
        });

    })
}

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

async function getFilesForFilePondProperties(files = [], place) {
    const r = files.map(async (e) => {
        const data = await getImageInfo(e, place)
        return {
            source: data[0],
            options: {
                type: 'local',
                file: {
                    name: data[0].name,
                    type: 'image/jpeg',
                    size: data[0].size
                },
                metadata: {
                    poster: data[1]
                }
            }
        }
    })
    return Promise.all(r);
}
