$(function () {
    let kindList = [];
    let html1 = '';
    let html2 = '';
    $.ajax({
        url: '/manage/itemKind',
        datatype: 'json',
        async: true,
        success: function (result) {
            console.log(result);
            for (let x in result) {
                kindList.push(x);
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
    $('#datepicker').datepicker({
        autoclose: true
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

    $('#manageWtsByKind').on('change', function () {
        let kindList = $('#manageWtsByKind').val();
        console.log(kindList);
        $.ajax({
            url: '/manage/manageWtsByKind',
            async: false,
            data: {
                'kindList': kindList.toString().trim()
            },
            success: function (result) {
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
        })
    });
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
});

function userDetail(sid) {
    $('#page').load('/user/manageUserProfile?userId=' + sid);
}

function formatDate(now) {
    var year = now.getFullYear();
    var month = now.getMonth() + 1;
    var date = now.getDate();
    var hour = now.getHours();
    var minute = now.getMinutes();
    return year + "-" + month + "-" + date + " " + hour + ":" + minute;
}
