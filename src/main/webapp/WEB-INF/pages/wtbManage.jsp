<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<section class="content-header">
    <h1>商品管理</h1>
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
                                            期望价格
                                        </th>
                                        <th class="sorting" tabindex="3" aria-controls="example2">

                                        </th>
                                        <th class="sorting" tabindex="4" aria-controls="example2">
                                            是否下架
                                        </th>
                                        <th class="sorting" tabindex="5" aria-controls="example2">
                                            商品编号
                                        </th>
                                        <th class="sorting" tabindex="6" aria-controls="example2">
                                            发布时间
                                        </th>
                                        <th class="sorting" tabindex="7" aria-controls="example2">
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
                                                <img src="${pageContext.request.contextPath}/${itemlist.image}"
                                                     style="width: 80px;height: 75px">
                                            </td>
                                            <td>
                                                    ${itemlist.name}
                                            </td>
                                            <td>
                                                    ${itemlist.price}
                                            </td>
                                            <td>
                                                    ${itemlist.number}人愿意出售
                                            </td>
                                            <td>
                                                <c:if test="${itemlist.isUndercarriage == false}">
                                                    发布中
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
                <form id="denyForm">
                    输入下架原因：
                    <input type="text" name="reason"/>
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

<script>
    url = '/manage/wtbitem';
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
        })
    });

</script>
<script src="${pageContext.request.contextPath}/js/approvalPublishInfo.js"></script>

</html>
