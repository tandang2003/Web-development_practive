// provinces
$(document).ready(function () {
    $.ajax({
        url: '/api/province',
        type: 'GET',
        success: function (result) {
            result = JSON.parse(result)
            for (let i of result) {
                $('#province').append('<option value="' + i.id + '">' + i.fullName + '</option>')
            }
        },
        error: function (error) {
        }
    })
})

// districts
$(document).ready(function () {
    $('#province').on('change', function () {
        let provinceId = $(this).val();
        console.log(provinceId)
        updateDistricts(provinceId).then((data)=>{}).catch((error)=>{})
        // $.ajax({
        //     url: '/api/district/' + provinceId,
        //     type: 'GET',
        //     success: function (result) {
        //         result = JSON.parse(result)
        //         for (let i of result) {
        //             $('#district').append('<option value="' + i.id + '">' + i.fullName + '</option>')
        //         }
        //     },
        //     error: function (error) {
        //     }
        // });
    });
});

function updateDistricts(provinceId) {
    return new Promise((resolve, reject) => {
        $.ajax({
            url: '/api/district/' + provinceId,
            type: 'GET',
            success: function (result) {
                result = JSON.parse(result);
                let $district = $('#district');
                $district.empty(); // Clear existing options
                for (let i of result) {
                    $district.append('<option value="' + i.id + '">' + i.fullName + '</option>');
                }
                resolve(); // Resolve the promise once done
            },
            error: function (error) {
                reject(error); // Reject the promise on error
            }
        });
    });
}

// wards
$(document).ready(function () {
    $('#district').on('change', function () {
        let districtId = $(this).val();
        updateWard(districtId).then((data)=>{}).catch((error)=>{})
        // $.ajax({
        //     url: '/api/ward/' + districtId,
        //     type: 'GET',
        //     success: function (result) {
        //         result = JSON.parse(result)
        //         for (let i of result) {
        //             $('#ward').append('<option value="' + i.id + '">' + i.fullName + '</option>')
        //         }
        //     },
        //     error: function (error) {
        //     }
        // });
    });
});
function updateWard(districtId) {
    return new Promise((resolve, reject) => {
        $.ajax({
            url: '/api/ward/' + districtId,
            type: 'GET',
            success: function (result) {
                result = JSON.parse(result);
                let $ward = $('#ward');
                $ward.empty(); // Clear existing options
                for (let i of result) {
                    $ward.append('<option value="' + i.id + '">' + i.fullName + '</option>');
                }
                resolve(); // Resolve the promise once done
            },
            error: function (error) {
                reject(error); // Reject the promise on error
            }
        });
    });
}
