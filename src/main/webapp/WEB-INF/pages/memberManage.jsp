<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<section class="content-header">
    <h1>用户管理</h1>
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
                                            学号
                                        </th>
                                        <th class="sorting" tabindex="1" aria-controls="example2">
                                            用户名
                                        </th>
                                        <th class="sorting" tabindex="2" aria-controls="example2">
                                            姓名
                                        </th>
                                        <th class="sorting" tabindex="3" aria-controls="example2">
                                            寝室
                                        </th>
                                        <th class="sorting" tabindex="4" aria-controls="example2">
                                            联系电话
                                        </th>
                                        <th class="sorting" tabindex="5" aria-controls="example2">
                                            注册时间
                                        </th>
                                        <th class="sorting" tabindex="6" aria-controls="example2">
                                            封禁状态
                                        </th>
                                        <th>
                                            操作
                                        </th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="memberlist" items="${memberlist}">
                                        <tr role="row">
                                            <td class="sorting">
                                                    ${memberlist.sid}
                                            </td>
                                            <td>
                                                    ${memberlist.username}
                                            </td>
                                            <td>
                                                    ${memberlist.name}
                                            </td>
                                            <td>
                                                    ${memberlist.dormitory}
                                            </td>
                                            <td>
                                                    ${memberlist.phone}
                                            </td>
                                            <td>
                                                <fmt:formatDate value="${memberlist.signinTime}" pattern="yyyy-MM-dd HH:mm:ss" type="Date" />

                                            </td>
                                            <td>
                                                <c:if test="${memberlist.isActive == false}">
                                                    封禁
                                                </c:if>
                                                <c:if test="${memberlist.isActive == true}">
                                                    正常
                                                </c:if>
                                            </td>
                                            <td>
                                                <a href="javascript:shutmember(${memberlist.sid})" role="button" class="btn btn-primary">
                                                    禁用
                                                </a>
                                                <a href="javascript:activemember(${memberlist.sid})" role="button" class="btn btn-primary">
                                                    启用
                                                </a>
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
