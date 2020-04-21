<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<body class="hold-transition skin-blue sidebar-mini">
<!-- Main content -->
<section class="content">
    <div class="row">
        <div class="col-xs-12">
            <div class="box">
                <div class="box-header">
                    <h3 class="box-title">我的出售</h3>
                </div>
                <!-- /.box-header -->
                <div class="box-body">
                    <div id="example2_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
                        <div class="row">
                            <div class="col-sm-12">
                                <table id="example2" class="table table-bordered table-hover dataTable" role="grid" aria-describedby="example2_info">
                                    <thead>
                                    <tr role="row">
                                        <th class="sorting" tabindex="0" aria-controls="example2">
                                            图片
                                        </th>
                                        <th class="sorting" tabindex="1" aria-controls="example2">
                                            名称
                                        </th>
                                        <th class="sorting" tabindex="2" aria-controls="example2">
                                            单价
                                        </th>
                                        <th class="sorting" tabindex="3" aria-controls="example2">
                                            数量
                                        </th>
                                        <th class="sorting" tabindex="4" aria-controls="example2">
                                            商品描述
                                        </th>
                                        <th class="sorting" tabindex="5" aria-controls="example2">
                                            状态
                                        </th>
                                        <th class="sorting" tabindex="6" aria-controls="example2">

                                        </th>

                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="myWts" items="${myWts}">
                                        <tr role="row">
                                            <td class="sorting">
                                                <img src="${pageContext.request.contextPath}/${myWts.image}"
                                                     style="width: 80px;height: 75px">
                                            </td>
                                            <td>
                                                    ${myWts.name}
                                            </td>
                                            <td>
                                                ￥${myWts.price}
                                            </td>
                                            <td>
                                                    ${myWts.number}
                                            </td>
                                            <td>
                                                    ${myWts.describes}
                                            </td>

                                            <c:if test="${myWts.isUndercarriage == true}">
                                                <td>
                                                    已下架
                                                </td>
                                                <td>${myWts.undercarriageReason}</td>
                                            </c:if>

                                            <c:if test="${myWts.isUndercarriage == false}">
                                                <td>
                                                    出售中
                                                </td>
                                                <td>
                                                    <button class="btn btn-primary"
                                                            onclick="updateitem('${myWts.serialNum}')">修改
                                                    </button>
                                                    <button class="btn btn-danger" onclick="getItemId(this)"
                                                            data-toggle="modal" data-target="#modal-danger"
                                                            value="${myWts.serialNum}">下架
                                                    </button>
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
<%--    拒绝弹出框--%>
<div class="modal modal-danger fade" id="modal-danger" tabindex="-1" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">确定下架该商品吗？</h4>
            </div>
            <div class="modal-body">
                输入下架原因：（可以留空）：
                <input type="text" id="denyReason" style="color: black"/>
                <input type="hidden" id="denyId" name="id" class="hidden"/>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-outline pull-left" id="offBtn">确定</button>
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
            'language': language
        });
        $('#offBtn').click(function () {
            let reason = $('#denyReason').val();
            $.ajax({
                url: '/items/offMyItem',
                type: 'post',
                data: {
                    'itemId': itemId,
                    'reason': reason
                },
                success: function (result) {
                    if (result === 'success') {
                        alert('成功下架！');
                    }
                },
                error: function (result) {
                    console.log(result);
                }
            });
            hideModal('danger');
            $('#page').load('/user/publish/wts');

        })
    });

    function getItemId(btn) {
        itemId = btn.value;
        console.log(itemId);
        $('#offItemId').val(itemId);
    }

</script>
</body>
</html>
