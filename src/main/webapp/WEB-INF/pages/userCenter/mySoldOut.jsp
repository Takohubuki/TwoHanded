<%--
  Created by IntelliJ IDEA.
  User: Tako
  Date: 2020/4/16
  Time: 22:22
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<body class="hold-transition skin-blue sidebar-mini">
<!-- Main content -->
<section class="content">
    <div class="row">
        <div class="col-xs-12">
            <div class="box">
                <div class="box-header">
                    <h3 class="box-title">出售记录</h3>
                </div>
                <!-- /.box-header -->
                <div class="box-body">
                    <div id="orderDataTable_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
                        <div class="row">

                        </div>
                        <div class="row">
                            <div class="col-sm-12">
                                <table id="orderDataTable" class="table table-bordered table-hover dataTable" role="grid"
                                       aria-describedby="orderDataTable_info">
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
                                            购买数量
                                        </th>
                                        <th class="sorting" tabindex="4" aria-controls="orderDataTable">
                                            单种商品总价
                                        </th>
                                        <th class="sorting" tabindex="5" aria-controls="orderDataTable">
                                            订单状态
                                        </th>
                                        <th class="sorting" tabindex="6" aria-controls="orderDataTable">
                                            买家
                                        </th>
                                        <th class="sorting" tabindex="7" aria-controls="orderDataTable">
                                            下单时间
                                        </th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="soldList" items="${soldList}">
                                        <tr role="row">
                                            <td class="sorting">
                                                    ${soldList.orderId}
                                            </td>
                                            <td>
                                                    ${soldList.item.name}
                                            </td>
                                            <td>
                                                <img src="${pageContext.request.contextPath}/${soldList.item.image}"
                                                     style="width: 80px;height: 75px">
                                            </td>
                                            <td>
                                                    ${soldList.itemNum}
                                            </td>
                                            <td>
                                                    ${soldList.sumPrice}
                                            </td>
                                            <c:if test="${soldList.isCanceled == true}">
                                                <td>
                                                    已取消
                                                </td>
                                            </c:if>
                                            <c:if test="${soldList.isCanceled == false && soldList.isPaid == false}">
                                                <td>
                                                    待付款(24小时内未付款自动取消订单！)
                                                </td>
                                            </c:if>

                                            <c:if test="${soldList.isPaid == true && soldList.isReceived == false && soldList.isCanceled == false}">
                                                <td>
                                                    待确认收货
                                                </td>
                                            </c:if>
                                            <c:if test="${soldList.isPaid == true && soldList.isReceived == true && soldList.isCanceled == false}">
                                                <td>
                                                    已收货
                                                </td>
                                            </c:if>
                                            <td>
                                                    ${soldList.buyer.username}
                                            </td>
                                            <td>
                                                <fmt:formatDate value="${soldList.createTime}"
                                                                pattern="yyyy-MM-dd HH:mm"/>
                                                <button type="button" class="close" value="${soldList.orderId}"
                                                        aria-label="Close" onclick="getOrderId(this)"
                                                        data-toggle="modal" data-target="#modal-danger1">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
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
                <button type="button" class="btn btn-outline pull-left" id="delBtn" value="S">确定</button>
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
        pagePath = '/user/mySoldOut';
        $('#orderDataTable').DataTable({
            'paging': true,
            'lengthChange': false,
            'searching': true,
            'ordering': true,
            'info': true,
            'autoWidth': false,
            'language': language,
            "createdRow": function (row, data, dataIndex) {
                mySoldOutHide(0);
            }
        });
    });
</script>
<script src="${pageContext.request.contextPath}/js/myOrder.js"></script>

</body>
</html>
