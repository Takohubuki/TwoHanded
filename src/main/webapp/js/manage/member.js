function getUserId(btn) {
    userId = btn.value;
    let url = '/manage/';
    if ($(btn).hasClass('activeMember')){
        url = url + 'activeMember';
    }if ($(btn).hasClass('shutMember')){
        url = url + 'shutMember';
    }if ($(btn).hasClass('delMember')){
        url = url + 'delMember';
    }

    $.ajax({
        url: url,
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
