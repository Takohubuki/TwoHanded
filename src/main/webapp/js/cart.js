let oldNum = 0;
let num = 0;
let id = '';
let itemNum = 0;
let atLeastOne = false;


$(function () {
    //增加数量
    $(".cart_quantity_up").click(function () {
        num = $(this).parent().parent().find("input").val();
        id = $(this).parent().parent().find("input").attr("dataValue");
        itemNum = $(this).parent().attr("itemNum");
        console.log(itemNum);

        if (num === itemNum){
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
            if (parseInt(num) > parseInt(itemNum)){
                alert("添加失败！超过库存");
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
            let price = document.getElementById(id).getAttribute("price");
            document.getElementById(id).innerHTML = parseInt(price) * parseInt(num) + "";
            $('#' + 'cbox_' + id).val(id + '_' + num);
        },
        error : function(e){
            console.log(e.status);
            console.log(e.responseText);
        }
    })
}


function check(){

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
