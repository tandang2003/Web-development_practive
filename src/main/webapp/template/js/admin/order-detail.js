import {GALLERY, getImageInfo, ORDER} from "../firebase/uploadImage.js";

$(document).ready(function () {
    const f = FilePond.create($('#file_input')[0], {
        // allowDrop: false,
        // allowBrowse: false,
        // allowPaste: false,
    });
    initialData().then(data => {
        console.log(data);
        $('#email').val(data.cart.email);
        $('#category').val(data.cart.categoryId);
        $('#height').val(data.cart.height);
        $('#width').val(data.cart.width);
        $('#id').val(data.cart.representProjectId);
        data.services.forEach((e) => {
            let selected = data.selectedService.some(s => s == e.id) ? 'selected' : '';
            $('#services').append(`<option value="${e.id} " ${selected}  > 
   <span class="text-uppercase">${e.name}</span>
  </option>`)
        })
        data.categories.forEach((e) => {
            $('#category').append(`<option value="${e.id} " }  ${e.id === data.cart.categoryId ? 'selected' : ''}> ${e.name}  </option>`)
        });
        getFilesForFilePondProperties(data.images.join(',').split(','), `${ORDER}`).then((data) => {
            console.log(data)
            f.addFiles(data)
        })
        $('#province').val(data.address.provinceId);
        updateDistricts(data.address.provinceId).then(() => {
            $('#district').val(data.address.districtId);
            updateWard(data.address.districtId).then(() => {
                $('#ward').val(data.address.wardId);
            })
        })

    })
})

function initialData() {
    return new Promise((resolve, reject) => {
        const id = window.location.href.split('/').pop();
        $.ajax({
            url: '/api/admin/cart/detail/' + id,
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
