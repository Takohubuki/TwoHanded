$(function () {
    $('#offBtn').click(function () {
        let reason = $('#denyReason').val();
        $.ajax({
            url: '/items/offMyItem',
            type: 'post',
            data: {
                'itemId': itemId,
                'reason': reason
            },
            success: function (result) {
                if (result === 'success') {
                    alert('成功下架！');
                }
            },
            error: function (result) {
                console.log(result);
            }
        });
        hideModal('danger');
        $('#page').load(pagePath);

    });

});

function getItemId(btn) {
    itemId = btn.value;
    console.log(itemId);
    $('#offItemId').val(itemId);
}
