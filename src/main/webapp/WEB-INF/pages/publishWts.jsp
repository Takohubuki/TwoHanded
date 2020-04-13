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

                        </div>
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
                                            成色
                                        </th>
                                        <th class="sorting" tabindex="5" aria-controls="example2">
                                            状态
                                        </th>
                                        <th class="sorting" tabindex="6" aria-controls="example2">
                                            操作
                                        </th>

                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="mywts" items="${mywts}">
                                        <tr role="row">
                                            <td class="sorting">
                                                <img src="${pageContext.request.contextPath}/${mywts.image}"
                                                     style="width: 80px;height: 75px">
                                            </td>
                                            <td>
                                                    ${mywts.name}
                                            </td>
                                            <td>
                                                ￥${mywts.price}
                                            </td>
                                            <td>
                                                    ${mywts.number}
                                            </td>
                                            <td>
                                                    ${mywts.quality}
                                            </td>
                                            <td>
                                                <c:if test="${mywts.isUndercarriage == true}">
                                                    下架
                                                </c:if>
                                                <c:if test="${mywts.isUndercarriage == false}">
                                                    出售中
                                                </c:if>
                                            </td>

                                            <td>
                                                <a href="javascript:updateitem('${mywts.serialNum}')">修改</a>
                                                <a href="javascript:offmyitem('${mywts.serialNum}')">下架</a>
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
            'paging'      : true,
            'lengthChange': false,
            'searching'   : true,
            'ordering'    : true,
            'info'        : true,
            'autoWidth'   : false,
            'language'    : language
        })
    });

</script>
</body>
</html>
