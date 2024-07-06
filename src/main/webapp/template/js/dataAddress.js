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
        $.ajax({
            url: '/api/district/' + provinceId,
            type: 'GET',
            success: function (result) {
                result = JSON.parse(result)
                for (let i of result) {
                    $('#district').append('<option value="' + i.id + '">' + i.fullName + '</option>')
                }
            },
            error: function (error) {
            }
        });
    });
});

// wards
$(document).ready(function () {
    $('#district').on('change', function () {
        let districtId = $(this).val();
        $.ajax({
            url: '/api/ward/' + districtId,
            type: 'GET',
            success: function (result) {
                result = JSON.parse(result)
                for (let i of result) {
                    $('#ward').append('<option value="' + i.id + '">' + i.fullName + '</option>')
                }
            },
            error: function (error) {
            }
        });
    });
});