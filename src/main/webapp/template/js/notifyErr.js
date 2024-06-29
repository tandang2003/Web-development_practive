class swal2Icon {
    static SUCCESS = "success";
    static ERROR = "error";
    static WARNING = "warning";
    static INFO = "info";
    static QUESTION = "question";
}


function alert(mes, type) {
    Swal.fire({
        position: 'top',
        title: 'THÔNG BÁO',
        html: mes,
        icon: type != null ? type : 'success',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        showCancelButton: false,
        // confirmButtonText: 'Yes!'
    })
}

function successAlert(mes) {
    alert(mes, 'success');
}

function errorAlert(mes) {
    alert(mes, 'error');
}

function warningAlert(mes) {
    alert(mes, 'warning');
}

function infoAlert(mes) {
    alert(mes, 'info');
}

function questionAlert(mes) {
    alert(mes, 'question');
}
function autoCloseAlert(mes, time = 1500, url = null) {
    Swal.fire({
        position: 'top',
        title: 'THÔNG BÁO',
        html: mes,
        icon: 'info',
        // showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        showCancelButton: false,
        confirmButtonText: 'CLOSE',
        timer: time,
        timerProgressBar: true,
        didOpen: () => {
            Swal.showLoading()
            timerInterval = setInterval(() => {
                const content = Swal.getContent()
                if (content) {
                    const b = content.querySelector('b')
                    if (b) {
                        b.textContent = Swal.getTimerLeft()
                    }
                }
            }, 100)
        },
        willClose: () => {
            clearInterval(time);
        }
    }).then((result) => {
        // console.log( url);
        if (url != null) location.href = url;
    })
}
function autoCloseAlertWithFunction(mes, time = 1500, Function = (result)=>{}) {
    Swal.fire({
        position: 'top',
        title: 'THÔNG BÁO',
        html: mes,
        icon: 'info',
        // showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        showCancelButton: false,
        confirmButtonText: 'CLOSE',
        timer: time,
        timerProgressBar: true,
        didOpen: () => {
            Swal.showLoading()
            timerInterval = setInterval(() => {
                const content = Swal.getContent()
                if (content) {
                    const b = content.querySelector('b')
                    if (b) {
                        b.textContent = Swal.getTimerLeft()
                    }
                }
            }, 100)
        },
        willClose: () => {
            clearInterval(time);
        }
    }).then((result) => {
        Function(result);
    })
}
function flashCloseAlert( time = 1500,icon = 'info') {
    Swal.fire ({
        position: 'top',
        icon: icon,
        width:250,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        showCancelButton: false,
        confirmButtonText: 'CLOSE',
        showConfirmButton:false,
        timer: time,
        willClose: () => {
            clearInterval(time);
        }
    });
}

function autoCloseAlertIcon(mes, time = 1500, icon = 'info', url = null) {
    Swal.fire({
        position: 'top',
        title: 'THÔNG BÁO',
        html: mes,
        icon: icon,
        // showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        showCancelButton: false,
        confirmButtonText: 'CLOSE',
        timer: time,
        timerProgressBar: true,
        didOpen: () => {
            Swal.showLoading()
            timerInterval = setInterval(() => {
                const content = Swal.getContent()
                if (content) {
                    const b = content.querySelector('b')
                    if (b) {
                        b.textContent = Swal.getTimerLeft()
                    }
                }
            }, 100)
        },
        willClose: () => {
            clearInterval(time);
        }
    }).then((result) => {
        // console.log( url);
        if (url != null) location.href = url;
    })
}

