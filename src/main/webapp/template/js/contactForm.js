$(document).ready(function () {
    $('#province').change(function () {
        let provinceId = $(this).val();
        console.log(provinceId + " provinceId")
        $('#provinceValue').val(provinceId);
        $('#provinceValue-error').remove()
    });
    $('#district').change(function () {
        let districtId = $(this).val();
        console.log(districtId + " districtId")
        $('#districtValue').val(districtId);
        $('#districtValue-error').remove()
    });
    $('#ward').change(function () {
        let wardId = $(this).val();
        console.log(wardId + " wardId")
        $('#wardValue').val(wardId);
        $('#wardValue-error').remove()
        console.log($('#wardValue').val() + " wardValue")
    });

    //check if input tag have valid in className then remove it

});
