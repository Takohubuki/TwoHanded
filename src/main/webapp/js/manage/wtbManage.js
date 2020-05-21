
function validateTime(startTime, endTime) {
    if (startTime === undefined || endTime === undefined) {
        return true;
    }
    let time1 = new Date(startTime).getTime();
    let time2 = new Date(endTime).getTime();
    return time1 > time2;
}

function getWtsItemByTime(startTime, endTime) {
    $.ajax({
        url: '/manage/manageWtbByTime',
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

$(function () {
    let startTime;
    let endTime;
    let wtbDatePickerConfig = {
        language: "zh-CN",
        todayHighlight: true,
        format: 'yyyy-mm-dd',
        autoclose: true,
        startView: 'days',
        maxViewMode:'years',
        minViewMode:'days',
        startDate:moment().subtract(47,'month').toDate(),
        endDate:moment().toDate()
    };

    //Date picker
    $('.datepicker').datepicker(wtbDatePickerConfig);
    $('.datepicker').on('change', function () {
        startTime = $('#startTime').val();
        endTime = $('#endTime').val();
    });

    $('#wtbDataTable').DataTable({
        'paging': true,
        'lengthChange': false,
        'searching': true,
        'ordering': true,
        'info': true,
        'autoWidth': false,
        'language': language
    });


    $('#manageWtsByTime').click(function () {

        if (validateTime(startTime, endTime)) {
            alert('时间选择有误！');
            return;
        }
        getWtsItemByTime(startTime, endTime);
    })
});

function userDetail(sid) {
    $('#page').load('/user/manageUserProfile?userId=' + sid);
}

function reloadDatatable(result) {
    console.log(result);
    $('#wtbDataTable').DataTable().destroy();
    $('#wtbDataTable').DataTable({
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
                html = html + '<img src=' + data + '"/" style="width: 80px;height: 75px">';
                return html;
            },
            "targets": 0
        },
            {
                "render": function (data, type, row) {

                    let html = '已有' + data + '人愿意出售';
                    return html;
                },
                "targets": 3
            },
            {
                "render": function (data, type, row) {
                    let date = new Date(data);
                    return formatDate(date);
                },
                "targets": 5
            },
            {
                "render": function (data, type, row) {
                    return '<a href="javascript:userDetail(' + data + ')">' + data + '</a>';
                },
                "targets": 6
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
