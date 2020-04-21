<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Tako
  Date: 2019/7/18
  Time: 13:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<body class="hold-transition skin-blue sidebar-mini">
<!-- Main content -->
<section class="content">
    <div class="row">
        <div class="col-xs-12">
            <div class="box">
                <div class="box-header">
                    <h3 class="box-title">我的订单</h3>
                </div>
                <!-- /.box-header -->
                <div class="box-body">
                    <div id="example2_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
                        <div class="row">

                        </div>
                        <div class="row">
                            <div class="col-sm-12">
                                <table id="example2" class="table table-bordered table-hover dataTable" role="grid" aria-describedby="example2_info">
                                    <thead>
                                    <tr role="row">
                                        <th class="sorting" tabindex="0" aria-controls="example2">
                                            订单编号
                                        </th>
                                        <th class="sorting" tabindex="1" aria-controls="example2">
                                            名称
                                        </th>
                                        <th class="sorting" tabindex="2" aria-controls="example2">
                                            商品图片
                                        </th>
                                        <th class="sorting" tabindex="3" aria-controls="example2">
                                            数量
                                        </th>
                                        <th class="sorting" tabindex="4" aria-controls="example2">
                                            单种商品总价
                                        </th>
                                        <th class="sorting" tabindex="5" aria-controls="example2">
                                            订单状态
                                        </th>
                                        <th class="sorting" tabindex="6" aria-controls="example2">
                                            操作
                                        </th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="order_list" items="${my_order_list}">
                                        <tr role="row">
                                            <td class="sorting">
                                                ${order_list.orderId}
                                            </td>
                                            <td>
                                                ${order_list.item.name}
                                            </td>
                                            <td>
                                                <img src="${pageContext.request.contextPath}/${order_list.item.image}" style="width: 80px;height: 75px">
                                            </td>
                                            <td>
                                                ${order_list.itemNum}
                                            </td>
                                            <td>
                                                    ${order_list.sumPrice}
                                            </td>
                                            <c:if test="${order_list.isCanceled == true}">
                                                <td>
                                                    已取消
                                                </td>
                                                <td>

                                                </td>
                                            </c:if>
                                            <c:if test="${order_list.isCanceled == false && order_list.isPaid == false}">
                                                <td>
                                                    待付款(24小时内未付款自动取消订单！)
                                                </td>
                                                <td>
                                                    <button class="btn btn-primary operation"
                                                            value="${order_list.orderId}" onclick="getOrderId(this)"
                                                            data-toggle="modal" data-target="#modal-info2">去支付
                                                    </button>
                                                    <button class="btn btn-danger operation"
                                                            value="${order_list.orderId}" onclick="getOrderId(this)"
                                                            data-toggle="modal" data-target="#modal-danger">取消订单
                                                    </button>
                                                </td>
                                            </c:if>

                                            <c:if test="${order_list.isPaid == true && order_list.isReceived == false && order_list.isCanceled == false}">
                                                <td>
                                                    待确认收货
                                                </td>
                                                <td>
                                                    <button class="btn btn-primary operation"
                                                            value="${order_list.orderId}" itemid="${order_list.itemId}"
                                                            onclick="getOrderId(this)"
                                                            data-toggle="modal" data-target="#modal-info1">确认收货
                                                    </button>
                                                </td>
                                            </c:if>
                                            <c:if test="${order_list.isPaid == true && order_list.isReceived == true && order_list.isCanceled == false && order_list.isChecked == false}">
                                                <td>
                                                    已收货
                                                </td>
                                                <td>
                                                    <button class="btn btn-primary commentBtn"
                                                            value="${order_list.orderId}" itemid="${order_list.itemId}"
                                                            data-toggle="modal" data-target="#modal-info3"
                                                            onclick="getOrderId(this)">评价
                                                    </button>
                                                </td>
                                            </c:if>

                                            <c:if test="${order_list.isPaid == true && order_list.isReceived == true && order_list.isCanceled == false && order_list.isChecked == true}">
                                                <td>
                                                    已评价
                                                </td>
                                                <td>

                                                </td>
                                            </c:if>

                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                </div>
                <!-- /.box-body -->
            </div>
            <!-- /.box -->
        </div>
        <!-- /.col -->
    </div>
    <!-- /.row -->
</section>
<!-- /.content -->
<div class="control-sidebar-bg"></div>

<%--    同意弹出框--%>
<div class="modal modal-info fade" id="modal-info1" tabindex="-1" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">是否确认收货？</h4>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-outline pull-left" id="cfmBtn">确定</button>
                <button type="button" class="btn btn-outline pull-right" data-dismiss="modal">取消</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->

<%--    前往支付弹出框--%>
<div class="modal modal-info fade" id="modal-info2" tabindex="-1" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">是否前去支付？</h4>
            </div>
            <form id="goPay">
                <input type="hidden" name="orderId" id="orderToPay"/>
            </form>
            <div class="modal-footer">
                <button type="button" class="btn btn-outline pull-left" id="goPayBtn">确定</button>
                <button type="button" class="btn btn-outline pull-right" data-dismiss="modal">取消</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->


<%--    拒绝弹出框--%>
<div class="modal modal-danger fade" id="modal-danger" tabindex="-1" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">确定取消下单吗？</h4>
            </div>
            <div class="modal-body">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-outline pull-left" id="denyBtn">确定</button>
                <button type="button" class="btn btn-outline pull-right" data-dismiss="modal">取消</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->

<%--    同意弹出框--%>
<div class="modal modal-info fade" id="modal-info3" tabindex="-1" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">评价卖家</h4>
            </div>
            <div class="modal-body">
                <div class="form-group" id="commentDiv">
                    <label>
                        <input type="radio" value="good" class="" name="comment"/>
                        好评
                    </label>
                    <br>
                    <label>
                        <input type="radio" value="bad" class="" name="comment"/>
                        差评
                    </label>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-outline pull-left" id="submitComment">确定</button>
                <button type="button" class="btn btn-outline pull-right" data-dismiss="modal">取消</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->

<script>
    $(function () {
        $('#example1').DataTable();
        $('#example2').DataTable({
            'paging': true,
            'lengthChange': false,
            'searching': true,
            'ordering': true,
            'info': true,
            'autoWidth': false,
            'language': language,
            "createdRow": function (row, data, dataIndex) {
                userHide(0);
            }
        });

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

</script>
</body>
</html>
