$(function () {
    $('.modal').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget); // Button that triggered the modal
        var recipient = button.data('id');// Extract info from data-* attributes
        var modal = $(this);
        console.log(recipient);
        modal.find('.hidden').val(recipient);
    });

    $('#accessBtn').click(function () {

        let id = $('#accessId').val();
        $.ajax({
            url: '/manage/accessInfo',
            type: 'post',
            data: {
                'id': id
            },
            async: false,
            success: function (result) {
                alert('信息发布成功');
            },
            error: function (result) {
                console.log(result.responseText);
            }
        });
        hideModal('info');
        $('#page').load('/manage/approval');

    });

    $('#denyBtn').click(function () {

        let id = $('#accessId').val();
        let reason = $('#denyForm').find('input[name = reason]').val();
        $.ajax({
            url: '/manage/denyInfo',
            type: 'post',
            data: {
                'id': id,
                'reason': reason
            },
            success: function () {
                alert('信息发布成功');
            },
            error: function (result) {
                console.log(result.responseText);
            }
        });
        hideModal('danger');
        $('#page').load('/manage/approval');

    })
});