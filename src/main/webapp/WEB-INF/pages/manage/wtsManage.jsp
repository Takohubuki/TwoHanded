<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<section class="content-header">
    <h1>商品管理</h1>
    <button class="btn btn-primary" data-toggle="modal" data-target="#modal-default1" id="itemKindMange">分类管理</button>
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
                                            库存量
                                        </th>
                                        <th class="sorting" tabindex="5" aria-controls="example2">
                                            是否下架
                                        </th>
                                        <th class="sorting" tabindex="6" aria-controls="example2">
                                            商品编号
                                        </th>
                                        <th class="sorting" tabindex="7" aria-controls="example2">
                                            发布时间
                                        </th>
                                        <th class="sorting" tabindex="8" aria-controls="example2">
                                            发布者
                                        </th>
                                        <th>
                                            操作
                                        </th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="itemlist" items="${itemlist}">
                                        <tr role="row">
                                            <td class="sorting">
                                                <img src="${pageContext.request.contextPath}/${itemlist.image}" style="width: 80px;height: 75px">
                                            </td>
                                            <td>
                                                ${itemlist.name}
                                            </td>
                                            <td>
                                                ${itemlist.kind}
                                            </td>
                                            <td>
                                                ${itemlist.price}
                                            </td>
                                            <td>
                                                ${itemlist.number}
                                            </td>
                                            <td>
                                                <c:if test="${itemlist.isUndercarriage == false}">
                                                    出售中
                                                </c:if>
                                                <c:if test="${itemlist.isUndercarriage == true}">
                                                    已下架
                                                </c:if>
                                            </td>
                                            <td>
                                                    ${itemlist.serialNum}
                                            </td>
                                            <td>
                                                <fmt:formatDate value="${itemlist.publishTime}"
                                                                pattern="yyyy-MM-dd HH:mm:ss" type="Date"/>
                                            </td>
                                            <td>
                                                    ${itemlist.publisher}
                                            </td>
                                            <td>
                                                <button type="button" class="btn btn-danger" data-toggle="modal"
                                                        data-target="#modal-danger" data-id="${itemlist.serialNum}">
                                                    下架
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

</section>
<%--    拒绝弹出框--%>
<div class="modal modal-danger fade" id="modal-danger" tabindex="-1" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">确定要下架商品吗？</h4>
            </div>
            <div class="modal-body">
                输入下架原因：（可以留空）：
                <input type="text" id="denyReason" style="color: black"/>
                <input type="hidden" id="denyId" name="id" class="hidden"/>
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

<div class="modal fade" id="modal-default1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">现有分类</h4>
            </div>
            <div class="modal-body">

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary pull-left" id="addItemKind">添加</button>
                <button type="button" class="btn btn-default pull-right" data-dismiss="modal">关闭</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->

<div class="modal fade" id="modal-default2">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">添加分类</h4>
            </div>
            <div class="modal-body">
                <input type="text" placeholder="输入要添加的分类" id="newKind">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary pull-left" id="subNewKind">确定</button>
                <button type="button" class="btn btn-default pull-right" data-dismiss="modal">关闭</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->

<script>
    url = '/manage/wtsitem';
    $(function () {
        $('#example2').DataTable({
            'paging': true,
            'lengthChange': false,
            'searching': true,
            'ordering': true,
            'info': true,
            'autoWidth': false,
            'language': language
        });
        $('#itemKindMange').click(function () {
            let html = '';
            $.ajax({
                url: '/manage/itemKind',
                datatype: 'json',
                async: false,
                success: function (result) {
                    console.log(result);
                    for (let x in result) {
                        html = html + '<div class="radio"><label><input type="radio" value="' + result[x] + '">' + result[x] + '</label></div>';
                    }
                    $('#modal-default1').find('.modal-body').html(html);
                },
                error: function (result) {
                    console.log(result)
                }
            })
        });
        $('#addItemKind').click(function () {
            hideModal('default1');
            $('#modal-default2').modal('show');
        });
        $('#subNewKind').click(function () {
            let val = $('#newKind').val();
            $.ajax({
                url: '/manage/addItemKind',
                data: {
                    'newKind': val
                },
                async: false,
                success: function (result) {
                    if (result === 0) {
                        alert('添加成功');
                    }
                },
                error: function (result) {
                    console.log(result);
                }
            });
            hideModal('default2');
            $('#page').load('/manage/wtsitem');
        });
    });


</script>
<script src="${pageContext.request.contextPath}/js/approvalPublishInfo.js"></script>

</html>
