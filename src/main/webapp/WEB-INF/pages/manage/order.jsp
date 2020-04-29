<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<section class="content-header">
    <h1>订单管理</h1>
    <label for="delOrderSwitch">自动删除订单</label>
    <input type="checkbox" id="delOrderSwitch">
</section>
<section class="content">
    <div class="row">
        <div class="col-xs-12">
            <div class="box">
                <div class="box-body">
                    <div id="example2_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
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
                                            订单状态
                                        </th>
                                        <th class="sorting" tabindex="6" aria-controls="example2">
                                            下单时间
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
                                            <c:if test="${orderlist.status == 'C'}">
                                                <td>
                                                    已取消
                                                </td>
                                            </c:if>
                                            <c:if test="${orderlist.status == 'U'}">
                                                <td>
                                                    待付款(24小时内未付款自动取消订单！)
                                                </td>
                                            </c:if>

                                            <c:if test="${orderlist.status == 'P'}">
                                                <td>
                                                    待确认收货
                                                </td>
                                            </c:if>
                                            <c:if test="${orderlist.status == 'R' || orderlist.status == 'V'}">
                                                <td>
                                                    完成
                                                </td>
                                            </c:if>
                                            <td>
                                                <fmt:formatDate value="${orderlist.createTime}"
                                                                pattern="yyyy-MM-dd HH:mm" type="Date"/>
                                                <c:if test="${orderlist.display == 'D'}">
                                                    <button type="button" class="close" value="${orderlist.orderId}"
                                                            aria-label="Close" onclick="getOrderId(this)"
                                                            data-toggle="modal" data-target="#modal-danger">
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

    <div class="modal modal-danger fade" id="modal-danger" tabindex="-1" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">确定删除订单吗？</h4>
                </div>
                <%--<div class="modal-body">
                    <p>删除之后将不再显示该订单</p>
                </div>--%>
                <div class="modal-footer">
                    <button type="button" class="btn btn-outline pull-left" id="delBtn" value="D">确定</button>
                    <button type="button" class="btn btn-outline pull-right" data-dismiss="modal">取消</button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->

</section>
<script>
    $(function () {
        let flag = ${delOrderSwitch};
        if (flag) {
            $('#delOrderSwitch').prop('checked', true);
        }
        let orderId;
        url = '/manage/manageOrder';
        $('#example2').DataTable({
            'paging': true,
            'lengthChange': false,
            'searching': true,
            'ordering': true,
            'info': true,
            'autoWidth': false,
            'language': language,
            "createdRow": function (row, data, dataIndex) {
                manageHide(0);
            }
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
            hideModal('danger');
            $('#page').load(url);
        });

        $('#delOrderSwitch').on('change', function () {
            if (this.checked) {
                $.ajax({
                    url: '/manage/delOrderSwitch',
                    data: {
                        'flag': 'on'
                    },
                    success: function (result) {
                        console.log(result);
                    },
                    error: function (result) {
                        console.log(result);
                    }

                })
            } else {
                $.ajax({
                    url: '/manage/delOrderSwitch',
                    data: {
                        'flag': 'off'
                    },
                    success: function (result) {
                        console.log(result);
                    },
                    error: function (result) {
                        console.log(result);
                    }

                })
            }
        })
    });

    function getOrderId(Btn) {
        orderId = Btn.value;
    }

</script>
</html>
