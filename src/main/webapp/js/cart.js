let oldNum = 0;
let num = 0;
let id = '';
let itemNum = 0;
let atLeastOne = false;

$(function () {

    //添加到购物车
    $("input[name = addcart]").click(function () {
        console.log(member);
        if (member === "null") {
            alert("请先登录！");
        } else if (member_status === 'V') {
            alert('您还未通过实名认证！');
        } else {
            $.ajax({
                url: "/order/addcart",
                type: "POST",
                data: {
                    'serialNum': $(this).parent().find('input[name = itemId]').val(),
                    'publisher': $(this).parent().find('input[name = publisher]').val()
                },
                success: function (result) {
                    console.log(result);
                    if (result === '0') {
                        alert('添加成功！')
                    }
                    if (result === '1') {
                        alert('不能购买自己发布的商品！');
                    }
                },
                error: function (e) {
                    console.log(e.status);
                    console.log(e.responseText);
                }
            });
        }
    });

    //回应求购信息
    $("input[name = wts]").click(function () {
        console.log(member);
        if (member === "null") {
            alert("请先登录！");
        } else {
            $.ajax({
                url: "/items/wtsItem",
                type: "POST",
                async: false,
                data: {
                    'serialNum': $(this).parent().find('input[name = itemId]').val(),
                },
                success: function (result) {
                    console.log(result);
                    if (result === '0') {
                        alert('成功通知发布人！')
                    }
                    if (result === '1') {
                        alert('这是你发布的求购！');
                    }
                },
                error: function (e) {
                    console.log(e.status);
                    console.log(e.responseText);
                }
            });
        }
    });

    //增加数量
    $(".cart_quantity_up").click(function () {
        num = $(this).parent().parent().find("input").val();
        id = $(this).parent().parent().find("input").attr("dataValue");
        itemNum = $(this).parent().attr("itemNum");
        console.log(itemNum);

        if (num === itemNum) {
            return;
        }
        num = parseInt(num) + 1;
        $(this).parent().parent().find("input").val(num);
        changeNum(id, num);
    });
    //减少商品数量
    $(".cart_quantity_down").click(function () {
        num = $(this).parent().parent().find("input").val();
        id = $(this).parent().parent().find("input").attr("dataValue");
        num = parseInt(num) - 1;
        if (num <= 0){
            return;
        }
        $(this).parent().parent().find("input").val(num);
        changeNum(id, num);
    });
    //文本框修改商品数量
    $(".quantity_text").blur(function () {
        num = $(this).val();
        if (oldNum !== num){
            itemNum = $(".cart_quantity_up").parent().attr("itemNum");
            if (isInteger(num)){
                alert("修改失败！必须输入整数！");
                $(this).val(oldNum);
                return;
            }
            if (parseInt(num) > parseInt(itemNum)){
                alert("修改失败！不能超过卖家设定的数量！");
                $(this).val(oldNum);
                return;
            }
            if (parseInt(num) <= 0){
                alert("修改失败！");
                $(this).val(oldNum);
                return;
            }
            id = $(this).attr("dataValue");
            changeNum(id, num);
        }
    });
    $(".quantity_text").focus(function () {
        oldNum = $(this).val();
    });
    $('#check-goods-all').on('change', function() {
        if(this.checked) {
            $('input[name = cbox]').prop('checked', true);
            $('#checked-all-bottom').prop('checked', true);
        } else {
            $('input[name = cbox]').prop('checked', false);
            $('#checked-all-bottom').prop('checked', false);
        }
    });
    $('#payMethod').click(function () {
        let method = $('select').val();
        payMethod(method);
    });
    //取消订单
    $('#cancelOrder').click(function () {
        $('#payForm').attr('action', '/order/cancel');
        $('#payForm').submit();
    });
    //删除购物车
    $('.item-delete').click(function () {
        id = $(this).val();
        delCart(id);
    })
});

//删除购物车商品
function delCart(id) {
    $.ajax({
        url : "/order/delCart",
        type : "POST",
        data : {
            'id' : id,
        },
        success : function(result) {
            console.log(result);
            window.location.reload();
        },
        error : function(e){
            console.log(e.status);
            console.log(e.responseText);
        }
    })

}

//修改购物车内商品数量
function changeNum(id, num) {
    console.log(id);
    console.log(num);
    $.ajax({
        url : "/order/updateCartNum",
        type : "POST",
        data : {
            'id' : id,
            'num' : num
        },
        success : function(result) {
            console.log(result);
            let id = $('#' + id);
            let price = id.attr('price');
            id.html(parseInt(price) * parseInt(num) + '');
            // let price = document.getElementById(id).getAttribute("price");
            // document.getElementById(id).innerHTML = parseInt(price) * parseInt(num) + "";
            $('#' + 'cbox_' + id).val(id + '_' + num);
        },
        error : function(e){
            console.log(e.status);
            console.log(e.responseText);
        }
    })
}

function checkMember() {
    if (member_status === 'V'){
        alert('您尚未实名，无法完成下单');
        return false;
    }
    if (member_status === 'S'){
        alert('您已被封禁，无法完成下单');
        return false;
    }
    return true;
}

//结算
function check(){
    if (!checkMember()){
        return;
    }

    atLeastOne = false;

    $(".cbox").each(function() {
        var isCheck = $(this).prop("checked");
        if(isCheck === true){
            atLeastOne = true;
        }
    });
    if (atLeastOne === true){
        $("#form").attr("action", "/order/checkout");
        $("#form").submit();
    }else {
        alert("未选择任何商品");
    }
}

function payMethod(payMethod) {
    $("#payForm").attr("action", "/order/" + payMethod);
    $("#payForm").submit();
}
