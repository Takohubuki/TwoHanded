<%--
  Created by IntelliJ IDEA.
  User: Tako
  Date: 2020/4/16
  Time: 22:22
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                    <div id="example2_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
                        <div class="row">

                        </div>
                        <div class="row">
                            <div class="col-sm-12">
                                <table id="example2" class="table table-bordered table-hover dataTable" role="grid"
                                       aria-describedby="example2_info">
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
                                            购买数量
                                        </th>
                                        <th class="sorting" tabindex="4" aria-controls="example2">
                                            单种商品总价
                                        </th>
                                        <th class="sorting" tabindex="5" aria-controls="example2">
                                            订单状态
                                        </th>
                                        <th class="sorting" tabindex="6" aria-controls="example2">
                                            买家
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
                                                    ${soldList.buyerId}
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
    });
</script>
</body>
</html>
