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