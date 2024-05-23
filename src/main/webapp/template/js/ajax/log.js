function webLog(place, id=null){
    console.log('weblog')
    console.log(place);
    switch (place) {
        case 'home':
            $.ajax({
                url: '/api/log',
                type: 'POST',
                data: {
                    place: 'home',
                    time: new Date().toLocaleString()
                },
                error: function (err) {
                    //rollback
                }
            })
            break;
        case 'intro':
            $.ajax({
                url: '/api/log',
                type: 'POST',
                data: {
                    place: 'intro',
                    time: new Date().toLocaleString()
                },
                error: function (err) {
                    //rollback
                }
            })
            break;
        case 'detail-project':
            $.ajax({
                url: '/api/log',
                type: 'POST',
                data: {
                    place: 'detail-project',
                    time: new Date().toLocaleString(),
                    id: id
                },
                error: function (err) {
                    //rollback
                }
            })
            break;
        case 'contact':
            $.ajax({
                url: '/api/log',
                type: 'POST',
                data: {
                    place: 'contact',
                    time: new Date().toLocaleString()
                },
                error: function (err) {
                    //rollback
                }
            })
            break;
        case 'project':
            $.ajax({
                url: '/api/log',
                type: 'POST',
                data: {
                    place: 'project',
                    time: new Date().toLocaleString()
                },
                error: function (err) {
                    //rollback
                }
            })
            break;
        case 'service':
            $.ajax({
                url: '/api/log',
                type: 'POST',
                data: {
                    place: 'service',
                    time: new Date().toLocaleString()
                },
                error: function (err) {
                    //rollback
                }
            })
            break;
        case 'detail-service':
            $.ajax({
                url: '/api/log',
                type: 'POST',
                data: {
                    place: 'detail-service',
                    time: new Date().toLocaleString(),
                    id: id
                },
                error: function (err) {
                    //rollback
                }
            })
            break;
    }
}
function popularProject(idCategory){
    $.ajax({
        url: '/api/log',
        type: 'POST',
        data: {
            type: 'popularProject',
            id: idCategory,
            time: new Date().toLocaleString()
        },
        success: function (data) {

        },
        error: function (err) {
            //rollback
        }
    })
}
function searching(searchingData){
    $.ajax({
        url: '/api/log',
        type: 'POST',
        data: {
            type: 'searching',
            data: searchingData,
            time: new Date().toLocaleString()
        },
        error: function (err) {
            //rollback
        }
    })
}
function paging(offset){
    $.ajax({
        url: '/api/log',
        type: 'POST',
        data: {
            type: 'paging',
            offset: offset,
            time: new Date().toLocaleString()
        },
        error: function (err) {
            //rollback
        }
    })
}
function likeLoging(id, isLike){
    $.ajax({
        url: '/api/log',
        type: 'POST',
        data: {
            type: 'like',
            id: id,
            time: new Date().toLocaleString()
        },
        error: function (err) {
            //rollback
        }
    })
}