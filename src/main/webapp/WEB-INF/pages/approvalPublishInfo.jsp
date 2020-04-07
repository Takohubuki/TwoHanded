<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Tako
  Date: 2020/3/31
  Time: 16:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>发布信息审核</title>
</head>
<section class="content-header">
    <h1>信息审核</h1>
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
                                            商品图片
                                        </th>
                                        <th class="sorting" tabindex="1" aria-controls="example2">
                                            商品名称
                                        </th>
                                        <th class="sorting" tabindex="2" aria-controls="example2">
                                            商品类型
                                        </th>
                                        <th class="sorting" tabindex="3" aria-controls="example2">
                                            商品单价
                                        </th>
                                        <th class="sorting" tabindex="4" aria-controls="example2">
                                            商品描述
                                        </th>
                                        <th class="sorting" tabindex="5" aria-controls="example2">
                                            发布时间
                                        </th>
                                        <th class="sorting" tabindex="6" aria-controls="example2">
                                            发布者
                                        </th>
                                        <th>
                                            操作
                                        </th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="infoList" items="${infoList}">
                                        <tr role="row">
                                            <td class="sorting">
                                                <img src="${pageContext.request.contextPath}/${infoList.image}"
                                                     style="width: 80px;height: 75px">
                                            </td>
                                            <td class="sorting">
                                                    ${infoList.name}
                                            </td>
                                            <td>
                                                    ${infoList.price}
                                            </td>
                                            <td>
                                                    ${infoList.kind}
                                            </td>
                                            <td>
                                                    ${infoList.describes}
                                            </td>
                                            <td>
                                                <fmt:formatDate value="${infoList.publishTime}"
                                                                pattern="yyyy-MM-dd HH:mm" type="Date"/>
                                            </td>
                                            <td>
                                                    ${infoList.publisher}
                                            </td>
                                            <td>
                                                <button type="button" class="btn btn-info" data-toggle="modal"
                                                        data-target="#modal-info" data-id="${infoList.serialNum}">
                                                    同意
                                                </button>
                                                <button type="button" class="btn btn-warning" data-toggle="modal"
                                                        data-target="#modal-danger" data-id="${infoList.serialNum}">
                                                    拒绝
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

    <%--    同意弹出框--%>
    <div class="modal modal-info fade" id="modal-info" tabindex="-1" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">确认同意发布吗？</h4>
                </div>
                <form id="accessForm">
                    <input type="hidden" name="id" id="accessId" class="hidden"/>
                </form>
                <%--
                                    <div class="modal-body">
                                        <p>One fine body&hellip;</p>
                                    </div>
                --%>
                <div class="modal-footer">
                    <button type="button" class="btn btn-outline pull-left" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-outline" id="accessBtn">确定</button>
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
                    <h4 class="modal-title">确定拒绝吗？</h4>
                </div>
                <div class="modal-body">
                    <form id="denyForm">
                        输入拒绝原因：
                        <label>
                            <input type="text" name="reason"/>
                        </label>
                        <input type="hidden" id="denyId" name="id" class="hidden"/>
                    </form>
                    <%--                    <p>One fine body&hellip;</p>--%>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-outline pull-left" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-outline" id="denyBtn">提交</button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->

</section>
<script>
    function printError(responseText) {
        $('#page').load('/index/blank');
        $('#page').html(responseText);
    }

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
        $('.modal').on('show.bs.modal', function (event) {
            var button = $(event.relatedTarget); // Button that triggered the modal
            var recipient = button.data('id');// Extract info from data-* attributes
            var modal = $(this);
            console.log(recipient);
            modal.find('.hidden').val(recipient);
        });
        $('#accessBtn').click(function () {

            let id = $('#accessId').val();
            $.ajax({
                url: '/manage/accessInfo',
                type: 'post',
                data: {
                    'id': id
                },
                success: function (result) {
                    alert('信息发布成功');
                },
                error: function (result) {
                    console.log(result.responseText);
                }
            });
            $('#modal-info').modal('hide');
            $('#page').load('/manage/approval');

        });
        $('#denyBtn').click(function () {

            let id = $('#accessId').val();
            let reason = $('#denyForm').find('input[name = reason]').val();
            $.ajax({
                url: '/manage/denyInfo',
                type: 'post',
                data: {
                    'id': id,
                    'reason': reason
                },
                success: function () {
                    alert('信息发布成功');
                },
                error: function (result) {
                    console.log(result.responseText);
                }
            });
            $('#modal-info').modal('hide');
            $('#page').load('/manage/approval');

        });

    });

</script>
</html>
