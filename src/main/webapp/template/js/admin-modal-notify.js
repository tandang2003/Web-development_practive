//to use this API you must insert a tag identified by 'modal'
let modal = document.getElementById('modal');
let code =
   ' <div class="modal fade" id="centralModalSm" tabIndex="-1" role="dialog" aria-labelledby="myModalLabel"' +
    'aria-hidden="true">' +
    '<!-- Change class .modal-sm to change the size of the modal -->' +
    '<div class="modal-dialog modal-sm" role="document">' +
    '<div class="modal-content">' +
    '<div class="modal-header">' +
    '<h4 class="modal-title w-100 text-center" id="myModalLabel">Thông báo</h4>' +
    '</div>' +
    '<div class="modal-body">' +
    '<p class="text-center" id="notify"></p>' +
    '</div>' +
    '<div class="modal-footer">' +
    '<button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Close</button>' +
    '</div>' +
    '</div>' +
    '</div>' +
    '</div>'
modal.innerHTML = "";
modal.innerHTML = code;

function delayNotify(delay, notifys) {
    $('#centralModalSm').modal('show');
    $('#notify').text(notifys);
    setTimeout(() => {
        $('#centralModalSm').modal('hide');
    }, delay);
}
