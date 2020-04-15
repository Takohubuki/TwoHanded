<%--
  Created by IntelliJ IDEA.
  User: Tako
  Date: 2019/7/9
  Time: 15:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>个人中心</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.7 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/icons/ionicons.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/AdminLTE.css">
    <!-- AdminLTE Skins. Choose a skin from the css/skins
         folder instead of downloading all of them to reduce the load. -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/_all-skins.css">
    <!-- DataTables -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/dataTables.bootstrap.css">

    <!-- Google Font -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

    <header class="main-header">
        <!-- Logo -->
        <a href="${pageContext.request.contextPath}/index/backindex" class="logo">
            <!-- mini logo for sidebar mini 50x50 pixels -->
            <span class="logo-mini"><b>H</b>RB</span>
            <!-- logo for regular state and mobile devices -->
            <span class="logo-lg"><b>HRBU</b></span>
        </a>

    </header>
    <!-- Left side column. contains the logo and sidebar -->
    <aside class="main-sidebar">
        <!-- sidebar: style can be found in sidebar.less -->
        <section class="sidebar">
            <!-- Sidebar user panel -->
            <div class="user-panel">
                <div class="pull-left image">
                    <img id="avatar" src="${pageContext.request.contextPath}/images/avatar/${member.avatar}" class="img-circle" alt="User Image" style="height: 45px;width: 45px">
                </div>
                <div class="pull-left info">
                    <p>${member.username}</p>
                    <a href="#"><i class="fa fa-circle text-success"></i> 在线</a>
                </div>
            </div>


            <ul class="sidebar-menu" data-widget="tree">
                <li class="header">NAVIGATION</li>
                <li><a href="${pageContext.request.contextPath}/user/profile"><i class="fa fa-user"></i>
                    <span>用户概况</span></a></li>
                <li><a href="javascript:updateProfile()"><i class="fa fa-book"></i> <span>修改资料</span></a></li>
                <li class="treeview">
                    <a href="#">
                        <i class="fa fa-dashboard"></i> <span>我的发布</span>
                        <span class="pull-right-container">
                            <i class="fa fa-angle-left pull-right"></i>
                        </span>
                    </a>
                    <ul class="treeview-menu">
                        <li>
                            <a href="javascript:myWts()"><i class="fa fa-circle-o"></i>我的出售</a>
                        </li>
                        <li>
                            <a href="javascript:myWtb()"><i class="fa fa-circle-o"></i>我的求购</a>
                        </li>
                        <li>
                            <a href="javascript:waitToPass()">
                                <i class="fa fa-pencil"></i>
                                审核中
                                <span class="pull-right-container">
                                    <span class="label label-danger pull-right">5</span>
                                </span>
                            </a>
                        </li>

                    </ul>
                </li>
                <li class="treeview">
                    <a href="#">
                        <i class="fa fa-sticky-note"></i> <span>我的订单</span>
                        <span class="pull-right-container">
                            <i class="fa fa-angle-left pull-right"></i>
                        </span>
                    </a>
                    <ul class="treeview-menu">
                        <li>
                            <a href="javascript:allOrder()">
                                <i class="fa fa-paste"></i> <span>购买记录</span>
                            </a>
                        </li>
                        <li>
                            <a href="javascript:soldItem()"><i class="fa fa-shopping-cart"></i>出售记录</a>
                        </li>
                    </ul>
                </li>

                <li><a href="${pageContext.request.contextPath}/user/logout"><i class="fa fa-circle-o text-red"></i> <span>注销</span></a></li>
            </ul>
        </section>
        <!-- /.sidebar -->
    </aside>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper" id="page">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                个人中心
            </h1>

        </section>

        <!-- Main content -->
        <section class="content">
            <div class="row">
                <div class="box box-default">
                    <div class="box-header">
                        <h3 class="box-title">账号概况</h3>
                    </div>
                    <div class="box-body">
                        <div class="col-md-3 col-sm-6 col-xs-12">
                            <div class="info-box bg-green">
                                <span class="info-box-icon"><i class="fa fa-thumbs-o-up"></i></span>

                                <div class="info-box-content">
                                    <span class="info-box-text">好评数</span>
                                    <span class="info-box-number">${member.positiveComment}</span>

                                    <%--                            <div class="progress">--%>
                                    <%--                                <div class="progress-bar" style="width: 70%"></div>--%>
                                    <%--                            </div>--%>
                                    <%--                            <span class="progress-description">--%>
                                    <%--                                70% Increase in 30 Days--%>
                                    <%--                            </span>--%>
                                </div>
                                <!-- /.info-box-content -->
                            </div>
                            <!-- /.info-box -->
                        </div>
                        <div class="col-md-3 col-sm-6 col-xs-12">
                            <div class="info-box bg-red">
                                <span class="info-box-icon"><i class="fa fa-thumbs-o-down"></i></span>

                                <div class="info-box-content">
                                    <span class="info-box-text">差评数</span>
                                    <span class="info-box-number">${member.negativeComment}</span>

                                    <%--                            <div class="progress">--%>
                                    <%--                                <div class="progress-bar" style="width: 70%"></div>--%>
                                    <%--                            </div>--%>
                                    <%--                            <span class="progress-description">--%>
                                    <%--                                70% Increase in 30 Days--%>
                                    <%--                            </span>--%>
                                </div>
                                <!-- /.info-box-content -->
                            </div>
                            <!-- /.info-box -->
                        </div>
                        <div class="col-md-3 col-sm-6 col-xs-12">
                            <div class="info-box bg-red">
                                <span class="info-box-icon"><i class="fa fa-thumbs-o-down"></i></span>

                                <div class="info-box-content">
                                    <span class="info-box-text">卖出商品件数</span>
                                    <span class="info-box-number">${member.negativeComment}</span>

                                    <%--                            <div class="progress">--%>
                                    <%--                                <div class="progress-bar" style="width: 70%"></div>--%>
                                    <%--                            </div>--%>
                                    <%--                            <span class="progress-description">--%>
                                    <%--                                70% Increase in 30 Days--%>
                                    <%--                            </span>--%>
                                </div>
                                <!-- /.info-box-content -->
                            </div>
                            <!-- /.info-box -->
                        </div>
                    </div>
                </div>
            </div>

            <%--通知信息展示--%>
            <div class="row">
                <div class="col-md-2">
                </div>
                <div class="col-md-8">
                    <div class="box box-default">
                        <div class="box-header with-border">
                            <h3 class="box-title">最新消息</h3>
                        </div>
                        <div class="box-body">
                            <div class="alert alert-success alert-dismissible">
                                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;
                                </button>
                                <h4><i class="icon fa fa-check"></i> 审核通过！</h4>
                                管理员已经同意您的商品：二手游戏机上架。
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-2">
                </div>
            </div>

        </section>
        <!-- /.content -->
    </div>
    <div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->

<!-- jQuery 3 -->
<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
<!-- FastClick -->
<script src="${pageContext.request.contextPath}/js/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="${pageContext.request.contextPath}/js/adminlte.js"></script>
<!-- DataTables -->
<script src="${pageContext.request.contextPath}/js/jquery.dataTables.js"></script>
<script src="${pageContext.request.contextPath}/js/dataTables.bootstrap.js"></script>

<!-- AdminLTE for demo purposes -->
<script src="${pageContext.request.contextPath}/js/dataTables.js"></script>
<!-- SlimScroll -->
<script src="${pageContext.request.contextPath}/js/ordersRowspan.js"></script>
<script src="${pageContext.request.contextPath}/js/modal.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.9/dist/js/bootstrap-select.min.js"></script>


<script type="text/javascript">
    let orderId;

    function offMyItem(item_id) {
        $("#page").load("${pageContext.request.contextPath}/user/offmyitem?item_id=" + item_id);
    }

    function updateitem(item_id) {
        $("#page").load("${pageContext.request.contextPath}/items/update?item_id=" + item_id);
    }

    function myWts() {
        $("#page").load("${pageContext.request.contextPath}/user/publish/wts");
    }
    function myWtb() {
        $("#page").load("${pageContext.request.contextPath}/user/publish/wtb");
    }

    function updateProfile() {
        $("#page").load("${pageContext.request.contextPath}/user/updateprofile");
    }

    function allOrder() {
        $("#page").load("${pageContext.request.contextPath}/order/myOrder");
    }
</script>
</body>
</html>
