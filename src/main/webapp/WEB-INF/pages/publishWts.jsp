<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title></title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.7 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/icons/ionicons.css">
    <!-- DataTables -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/dataTables.bootstrap.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/AdminLTE.css">
    <!-- AdminLTE Skins. Choose a skin from the css/skins
         folder instead of downloading all of them to reduce the load. -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/_all-skins.css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->

    <!-- Google Font -->
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>
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
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="mywts" items="${mywts}">
                                        <tr role="row">
                                            <td class="sorting">
                                                <img src="${pageContext.request.contextPath}/${mywts.image}" style="width: 80px;height: 75px">
                                            </td>
                                            <td>
                                                    ${mywts.name}
                                            </td>
                                            <td>
                                                    ${mywts.price}
                                            </td>
                                            <td>
                                                    ${mywts.quality}
                                            </td>
                                            <td>
                                                    ${mywts.conditions}
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

<!-- jQuery 3 -->
<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
<!-- DataTables -->
<script src="${pageContext.request.contextPath}/js/jquery.dataTables.js"></script>
<script src="${pageContext.request.contextPath}/js/dataTables.bootstrap.js"></script>
<!-- SlimScroll -->
<script src="${pageContext.request.contextPath}/js/jquery.slimscroll.js"></script>
<!-- FastClick -->
<script src="${pageContext.request.contextPath}/js/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="${pageContext.request.contextPath}/js/adminlte.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="${pageContext.request.contextPath}/js/demo.js"></script>
<!-- page script -->
<script>
    $(function () {
        $('#example1').DataTable()
        $('#example2').DataTable({
            'paging'      : true,
            'lengthChange': false,
            'searching'   : false,
            'ordering'    : true,
            'info'        : true,
            'autoWidth'   : false
        })
    })
    function offmyitem(item_id) {
        $("#page").load("${pageContext.request.contextPath}/user/offmyitem?item_id="+item_id);
    }
    function updateitem(item_id) {
        $("#page").load("${pageContext.request.contextPath}/items/update?item_id="+item_id);
        <%--$.post("${pageContext.request.contextPath}/items/update",--%>
        <%--    {--%>
        <%--        item_id:string--%>
        <%--    },--%>
        <%--    function () {--%>
        <%--    alert("error!")--%>
        <%--})--%>
    }
</script>
</body>
</html>
