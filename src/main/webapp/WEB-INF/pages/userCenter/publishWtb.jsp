<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%--
  Created by IntelliJ IDEA.
  User: Tako
  Date: 2019/7/11
  Time: 14:42
  To change this template use File | Settings | File Templates.
--%>
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
                        <h3 class="box-title">我的求购</h3>
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
                                                    期望价格
                                                </th>
                                                <th class="sorting" tabindex="3" aria-controls="example2">
                                                    描述
                                                </th>
                                                <th class="sorting" tabindex="4" aria-controls="example2">

                                                </th>
                                                <th tabindex="5" aria-controls="example2">
                                                    发布时间
                                                </th>
                                                <th tabindex="6" aria-controls="example2">
                                                    操作
                                                </th>

                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="myWtb" items="${myWtb}">
                                                <tr role="row">
                                                    <td class="sorting">
                                                        <img src="${pageContext.request.contextPath}/${myWtb.image}"
                                                             style="width: 80px;height: 75px">
                                                    </td>
                                                    <td>
                                                            ${myWtb.name}
                                                    </td>
                                                    <td>
                                                            ${myWtb.price}
                                                    </td>
                                                    <td>
                                                            ${myWtb.describes}
                                                    </td>
                                                    <td>
                                                        已有${myWtb.number}人愿意出售
                                                    </td>
                                                    <td>
                                                        <fmt:formatDate value="${myWtb.publishTime}"
                                                                        pattern="yyyy-MM-dd HH:mm:ss" type="Date"/>

                                                    </td>
                                                    <td>
                                                        <button class="btn btn-primary"
                                                                onclick="updateitem('${myWtb.serialNum}')">修改
                                                        </button>
                                                        <button class="btn btn-danger" onclick="getItemId(this)"
                                                                data-toggle="modal" data-target="#modal-danger"
                                                                value="${myWtb.serialNum}">下架
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
    <div class="modal modal-danger fade" id="modal-danger" tabindex="-1" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">确定撤下该信息吗？</h4>
                </div>
                <div class="modal-body">
                    原因：（可以留空）：
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
            pagePath = '/user/publish/wtb';
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
    <script src="${pageContext.request.contextPath}/js/myPublish.js"></script>

</body>
</html>
