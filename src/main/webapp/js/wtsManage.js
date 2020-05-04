function validateTime(startTime, endTime) {
    if (startTime === undefined || endTime === undefined) {
        return true;
    }
    let time1 = new Date(startTime).getTime();
    let time2 = new Date(endTime).getTime();
    return time1 > time2;
}

function getWtsItemByKind(kindList) {
    $.ajax({
        url: '/manage/manageWtsByKind',
        async: false,
        data: {
            'kindList': kindList.toString().trim()
        },
        success: function (result) {
            reloadDatatable(result);
        }
    })
}

function getWtsItemByTime(startTime, endTime) {
    $.ajax({
        url: '/manage/manageWtsByTime',
        async: false,
        data: {
            'startTime': startTime,
            'endTime': endTime
        },
        success: function (result) {
            reloadDatatable(result);
        }
    })
}

function getWtsItemByKindAndTime(startTime, endTime, kindList) {
    $.ajax({
        url: '/manage/manageWtsByKindAndTime',
        async: false,
        data: {
            'startTime': startTime,
            'endTime': endTime,
            'kindList': kindList.toString().trim()
        },
        success: function (result) {
            reloadDatatable(result);
        }
    })

}

$(function () {
    let startTime;
    let endTime;
    let kindList;
    let html1 = '';
    let html2 = '';
    $.ajax({
        url: '/manage/itemKind',
        datatype: 'json',
        async: true,
        success: function (result) {
            console.log(result);
            for (let x in result) {
                html1 = html1 + '<div class="radio"><label><input type="radio" value="' + result[x] + '">' + result[x] + '</label></div>';
                html2 = html2 + '<option value="' + result[x] + '">' + result[x] + '</option>';
            }
            $('#modal-default1').find('.modal-body').html(html1);
            $('#manageWtsByKind').html(html2)
        },
        error: function (result) {
            console.log(result)
        }
    });

    //Initialize Select2 Elements
    $('.select2').select2();
    //Date picker
    $('.datepicker').datepicker({
        format: 'yyyy-mm-dd',
        autoclose: true
    });
    $('.datepicker').on('change', function () {
        startTime = $('#startTime').val();
        endTime = $('#endTime').val();
    });

    $('#example2').DataTable({
        'paging': true,
        'lengthChange': false,
        'searching': true,
        'ordering': true,
        'info': true,
        'autoWidth': false,
        'language': language
    });

    //根据类型查询商品
    $('#manageWtsByKind').on('change', function () {
        kindList = $('#manageWtsByKind').val();
        if (!validateTime(startTime, endTime)) {
            getWtsItemByKindAndTime(startTime, endTime, kindList);
        } else {
            getWtsItemByKind(kindList);
        }
    });

    //添加商品类型
    $('#addItemKind').click(function () {
        hideModal('default1');
        $('#modal-default2').modal('show');
    });
    $('#subNewKind').click(function () {
        let val = $('#newKind').val();
        $.ajax({
            url: '/manage/addItemKind',
            data: {
                'newKind': val
            },
            async: false,
            success: function (result) {
                if (result === 0) {
                    alert('添加成功');
                }
            },
            error: function (result) {
                console.log(result);
            }
        });
        hideModal('default2');
        $('#page').load('/manage/wtsitem');
    });

    $('#manageWtsByTime').click(function () {

        if (validateTime(startTime, endTime)) {
            alert('时间选择有误！');
            return;
        }
        if (kindList !== undefined && kindList.length >= 1) {
            getWtsItemByKindAndTime(startTime, endTime, kindList);
        } else {
            getWtsItemByTime(startTime, endTime);
        }
    })
});

function userDetail(sid) {
    $('#page').load('/user/manageUserProfile?userId=' + sid);
}

function reloadDatatable(result) {
    console.log(result);
    $('#example2').DataTable().destroy();
    $('#example2').DataTable({
        'paging': true,
        'lengthChange': false,
        'searching': true,
        'ordering': true,
        'info': true,
        'autoWidth': false,
        'language': language,
        'data': result,
        'columns': [
            {'data': 'image'},
            {'data': 'name'},
            {'data': 'kind'},
            {'data': 'price'},
            {'data': 'number'},
            {'data': 'serialNum'},
            {'data': 'publishTime'},
            {'data': 'publisher'},
            {
                'data': null, 'render': function (data, type, row, meta) {
                    return '<button type="button" class="btn btn-danger" data-toggle="modal" data-target="#modal-danger" data-id="' + row.serialNum + '">下架</button>';
                }
            }
        ],

        "columnDefs": [{
            "render": function (data, type, row) {
                let html = '';
                html = html + '<img src="/' + data + '" style="width: 80px;height: 75px">';
                return html;
            },
            "targets": 0
        },
            {
                "render": function (data, type, row) {
                    let date = new Date(data);
                    return formatDate(date);
                },
                "targets": 6
            },
            {
                "render": function (data, type, row) {
                    return '<a href="javascript:userDetail(' + data + ')">' + data + '</a>';
                },
                "targets": 7
            }
        ]
    })

}

function formatDate(now) {
    var year = now.getFullYear();
    var month = now.getMonth() + 1;
    var date = now.getDate();
    var hour = now.getHours();
    var minute = now.getMinutes();
    return year + "-" + month + "-" + date + " " + hour + ":" + minute;
}
