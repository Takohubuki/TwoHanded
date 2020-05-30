function getUserId(btn) {
    userId = btn.value;
    let reqUrl = '/manage/';
    if ($(btn).hasClass('activeMember')){
        reqUrl = reqUrl + 'activeMember';
    }if ($(btn).hasClass('shutMember')){
        reqUrl = reqUrl + 'shutMember';
    }if ($(btn).hasClass('delMember')){
        reqUrl = reqUrl + 'delMember';
    }

    $.ajax({
        url: reqUrl,
        async:false,
        data: {
            'sid': userId
        },
        success: function (result) {
            $('#page').load(url);
        }
    })
}

$(function () {
    $('#example2').DataTable().destroy();
    $('#example2').DataTable({
        'paging': true,
        'lengthChange': false,
        'searching': true,
        'ordering': true,
        'info': true,
        'autoWidth': false,
        'language': language
    });

/*
    $('.shutMember').click(function () {
        userId = $(this).val();

        $.ajax({
            url: '/manage/shutMember',
            data: {
                'sid': userId
            },
            success: function (result) {
                $('#page').load(url);
            }
        })
    });

    $('.activeMember').click(function () {
        userId = $(this).val();

        $.ajax({
            url: '/manage/activeMember',
            data: {
                'sid': userId
            },
            success: function (result) {
                $('#page').load(url);
            }
        })
    })
*/

});
