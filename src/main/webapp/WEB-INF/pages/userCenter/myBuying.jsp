<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
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
                    <div id="orderDataTable_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
                        <div class="row">

                        </div>
                        <div class="row">
                            <div class="col-sm-12">
                                <table id="orderDataTable" class="table table-bordered table-hover dataTable" role="grid" aria-describedby="orderDataTable_info">
                                    <thead>
                                    <tr role="row">
                                        <th class="sorting" tabindex="0" aria-controls="orderDataTable">
                                            订单编号
                                        </th>
                                        <th class="sorting" tabindex="1" aria-controls="orderDataTable">
                                            名称
                                        </th>
                                        <th class="sorting" tabindex="2" aria-controls="orderDataTable">
                                            商品图片
                                        </th>
                                        <th class="sorting" tabindex="3" aria-controls="orderDataTable">
                                            数量
                                        </th>
                                        <th class="sorting" tabindex="4" aria-controls="orderDataTable">
                                            单种商品总价
                                        </th>
                                        <th class="sorting" tabindex="5" aria-controls="orderDataTable">
                                            订单状态
                                        </th>
                                        <th class="sorting" tabindex="6" aria-controls="orderDataTable">
                                            操作
                                        </th>
                                        <th class="sorting" tabindex="7" aria-controls="orderDataTable">
                                            下单时间
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
                                                <a href="${pageContext.request.contextPath}/items/singleitem?itemId=${order_list.item.serialNum}">${order_list.item.name}</a>
                                            </td>
                                            <td>
                                                <img src="${pageContext.request.contextPath}/${order_list.item.image}"
                                                     style="width: 80px;height: 75px">
                                            </td>
                                            <td>
                                                    ${order_list.itemNum}
                                            </td>
                                            <td>
                                                    ${order_list.sumPrice}
                                            </td>
                                            <c:if test="${order_list.status == 'C'}">
                                                <td>
                                                    已取消
                                                </td>
                                                <td>

                                                </td>
                                            </c:if>
                                            <c:if test="${order_list.status == 'U'}">
                                                <td>
                                                    待付款(建议在3天内完成线下验货并付款，过期自动取消)
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

                                            <c:if test="${order_list.status == 'P'}">
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
                                            <c:if test="${order_list.status == 'R'}">
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

                                            <c:if test="${order_list.status == 'V'}">
                                                <td>
                                                    已评价
                                                </td>
                                                <td>
                                                </td>
                                            </c:if>
                                            <td>
                                                <fmt:formatDate value="${order_list.createTime}"
                                                                pattern="yyyy-MM-dd HH:mm" type="Date"/>

                                                <c:if test="${order_list.status == 'V' || order_list.status == 'R' || order_list.status == 'C'}">
                                                    <button type="button" class="close" value="${order_list.orderId}"
                                                            aria-label="Close" onclick="getOrderId(this)"
                                                            data-toggle="modal" data-target="#modal-danger1">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </c:if>
                                            </td>
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

<div class="modal modal-danger fade" id="modal-danger1" tabindex="-1" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">确定删除订单吗？</h4>
            </div>
            <div class="modal-body">
                <p>删除之后将不再显示该订单</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-outline pull-left" id="delBtn" value="B">确定</button>
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
        pagePath = '/order/myOrder';
        $('#orderDataTable').DataTable({
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
    });

</script>
<script src="${pageContext.request.contextPath}/js/myOrder.js"></script>
</body>
</html>
