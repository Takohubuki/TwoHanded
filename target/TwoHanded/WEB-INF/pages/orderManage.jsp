<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<section class="content-header">
    <h1>订单管理</h1>
</section>
<section class="content">
    <div class="row">
        <div class="col-xs-12">
            <div class="box">
                <div class="box-body">
                    <div id="example2_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
                        <div class="row">
                            <div class="col-sm-12">
                                <table id="example2" class="table table-bordered table-hover dataTable" role="grid" aria-describedby="example2_info">
                                    <thead>
                                    <tr role="row">
                                        <th class="sorting" tabindex="0" aria-controls="example2">
                                            订单编号
                                        </th>
                                        <th class="sorting" tabindex="1" aria-controls="example2">
                                            买家ID
                                        </th>
                                        <th class="sorting" tabindex="2" aria-controls="example2">
                                            商品名称
                                        </th>
                                        <th class="sorting" tabindex="3" aria-controls="example2">
                                            商品数量
                                        </th>
                                        <th class="sorting" tabindex="4" aria-controls="example2">
                                            单种商品总价
                                        </th>
                                        <th class="sorting" tabindex="5" aria-controls="example2">
                                            下单时间
                                        </th>
                                        <th class="sorting" tabindex="5" aria-controls="example2">
                                            订单状态
                                        </th>

                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="orderlist" items="${orderlist}">
                                        <tr role="row">
                                            <td class="sorting">
                                                ${orderlist.orderId}
                                            </td>
                                            <td>
                                                ${orderlist.buyerId}
                                            </td>
                                            <td>
                                                    ${orderlist.item.name}
                                            </td>
                                            <td>
                                                    ${orderlist.itemNum}
                                            </td>
                                            <td>
                                                    ${orderlist.sumPrice}
                                            </td>
                                            <td>
                                                <fmt:formatDate value="${orderlist.createTime}"
                                                                pattern="yyyy-MM-dd HH:mm:ss" type="Date"/>
                                            </td>
                                            <c:if test="${orderlist.isCanceled == true}">
                                                <td>
                                                    已取消
                                                </td>
                                            </c:if>
                                            <c:if test="${orderlist.isCanceled == false && orderlist.isPaid == false}">
                                                <td>
                                                    待付款(24小时内未付款自动取消订单！)
                                                </td>
                                            </c:if>

                                            <c:if test="${orderlist.isPaid == true && orderlist.isReceived == false && orderlist.isCanceled == false}">
                                                <td>
                                                    待确认收货
                                                </td>
                                            </c:if>
                                            <c:if test="${orderlist.isPaid == true && orderlist.isReceived == true && orderlist.isCanceled == false}">
                                                <td>
                                                    完成
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

</section>
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
                manageHide(0);
            }
        })
    });

</script>
</html>
