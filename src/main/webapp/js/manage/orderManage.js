
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
        url: '/manage/manageOrderByTime',
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
    let orderId;

    let wtsDateConfig = {
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
    $('.datepicker').datepicker(wtsDateConfig);
    $('.datepicker').on('change', function () {
        startTime = $('#startTime').val();
        endTime = $('#endTime').val();
    });

    $('#manageWtsByTime').click(function () {

        if (validateTime(startTime, endTime)) {
            alert('时间选择有误！');
            return;
        }
        getWtsItemByTime(startTime, endTime);
    });

    $('#orderDataTable').DataTable({
        'paging': true,
        'lengthChange': false,
        'searching': true,
        'ordering': true,
        'info': true,
        'autoWidth': false,
        'language': language,
        "createdRow": function (row, data, dataIndex) {
            manageHide(0);
        }
    });

    $('#delBtn').click(function () {
        let type = $('#delBtn').val();
        $.ajax({
            url: '/order/hideOrder',
            type: 'post',
            async: false,
            data: {
                'orderId': orderId,
                'type': type
            },
            success: function (result) {
                console.log(result);
            },
            error: function (result) {
                console.log(result);
            }
        });
        hideModal('danger');
        $('#page').load(url);
    });

    $('#delOrderSwitch').on('change', function () {
        if (this.checked) {
            $.ajax({
                url: '/manage/delOrderSwitch',
                data: {
                    'flag': 'on'
                },
                success: function (result) {
                    console.log(result);
                },
                error: function (result) {
                    console.log(result);
                }

            })
        } else {
            $.ajax({
                url: '/manage/delOrderSwitch',
                data: {
                    'flag': 'off'
                },
                success: function (result) {
                    console.log(result);
                },
                error: function (result) {
                    console.log(result);
                }

            })
        }
    })

});

function reloadDatatable(result) {
    console.log(result);
    $('#wtsDataTable').DataTable().destroy();
    $('#wtsDataTable').DataTable({
        'paging': true,
        'lengthChange': false,
        'searching': true,
        'ordering': true,
        'info': true,
        'autoWidth': false,
        'language': language,
        'data': result,
        'columns': [
            {'data': 'orderId'},
            {'data': 'buyId'},
            {'data': 'item.name'},
            {'data': 'itemNum'},
            {'data': 'number'},
            {'data': 'sumPrice'},
            {'data': 'status'},
            {'data': 'createTime'},
        ],
        "columnDefs": [
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
                "targets": 1
            }
        ],
        "createdRow": function (row, data, dataIndex) {
            manageHide(0);
        }

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

function getOrderId(Btn) {
    orderId = Btn.value;
}
