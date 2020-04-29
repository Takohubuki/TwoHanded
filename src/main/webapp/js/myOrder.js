$(function () {
    $('#goPayBtn').click(function () {
        let $goPay = $('#goPay');
        $goPay.attr('action', '/order/payLater');
        $goPay.attr('method', 'post');
        $goPay.submit();
    });

    $('#cfmBtn').click(function () {
        $.ajax({
            url: '/order/cfmGetItem',
            type: 'post',
            async: false,
            data: {
                'orderId': orderId,
                'itemId': itemId
            },
            success: function (result) {
            },
            error: function (result) {
                console.log(result.responseText);
            }
        });
        hideModal('info1');
        $('#page').load('/order/myOrder');

    });
    $('#denyBtn').click(function () {
        $.ajax({
            url: '/order/cancel',
            type: 'post',
            async: false,
            data: {
                'orderId': orderId
            },
            success: function (result) {
                alert('成功取消订单！');
            },
            error: function (result) {
                console.log(result);
            }
        });
        hideModal('danger');
        $('#page').load('/order/myOrder');
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
        hideModal('danger1');
        $('#page').load(pagePath);
    });

    $('#submitComment').click(function () {
        let comment = $('#commentDiv').find('input[name = comment]:checked').val();
        console.log(comment);
        console.log(orderId);
        $.ajax({
            url: '/user/comment',
            async: false,
            data: {
                'itemId': itemId,
                'orderId': orderId,
                'comment': comment
            },
            success: function (result) {
                if (result === '0') {
                    alert('评价成功');
                }
            },
            error: function (result) {
                console.log(result)
            }
        });
        hideModal('info3');
        $('#page').load('/order/myOrder');
    })

});

function getOrderId(cfmBtn) {
    itemId = $(cfmBtn).attr('itemid');
    orderId = cfmBtn.value;
    $('#orderToPay').val(orderId);
}
