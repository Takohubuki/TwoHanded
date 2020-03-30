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

                                        </th>
                                        <th class="sorting" tabindex="3" aria-controls="example2">
                                            数量
                                        </th>
                                        <th class="sorting" tabindex="4" aria-controls="example2">
                                            单价
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
                                            <c:if test="${order_list.isReceived == false && order_list.isCanceled == false}">
                                                <td>
                                                    待确认收货
                                                </td>
                                                <td>
                                                    <button class="btn btn-primary operation">确认收货</button>
                                                </td>
                                            </c:if>
                                            <c:if test="${order_list.isPaid == true && order_list.isReceived == true && order_list.isCanceled == false}">
                                                <td>
                                                    已付款
                                                </td>
                                                <td>
                                                    <button class="btn btn-primary ">评价</button>
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

<script>
    $(function () {
        $('#example1').DataTable();
        $('#example2').DataTable({
            'paging'      : true,
            'lengthChange': false,
            'searching'   : true,
            'ordering'    : true,
            'info'        : true,
            'autoWidth'   : false,
            'language'    : language,
            "createdRow"  : function( row, data, dataIndex ) {
                hide(0);
            }
        })
    });
</script>
</body>
</html>
