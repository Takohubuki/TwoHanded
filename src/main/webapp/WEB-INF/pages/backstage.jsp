<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>HBU二手交易平台后台管理系统</title>
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
<body class="hold-transition skin-purple-light sidebar-mini">
<div class="wrapper">
    <header class="main-header">
        <a href="#" class="logo">HBU二手交易后台管理系统</a>
        <nav class="navbar navbar-static-top">
            <div class="navbar-custom-menu">
                <ul class="nav navbar-nav">
                    <li>
                        <a href="#">${manager.username}</a>
                    </li>
                    <li>
                        <a class="navbar-link" href="${pageContext.request.contextPath}/manage/logout" role="button">注销</a>
                    </li>
                </ul>
            </div>
        </nav>
    </header>
    <!-- Left side column. contains the logo and sidebar -->
    <aside class="main-sidebar">
        <!-- sidebar: style can be found in sidebar.less -->
        <section class="sidebar">

            <ul class="sidebar-menu" data-widget="tree">
                <li class="header">NAVIGATION</li>
                <li class="">
                    <a href="${pageContext.request.contextPath}/manage/gen_sit">
                        <i class="fa fa-book"></i>  <span>概况总览</span>
                    </a>
                </li>
                <li class="">
                    <a href="javascript:member_manage()">
                        <i class="fa fa-book"></i> <span>用户管理</span>
                    </a>
                </li>
                <li class="treeview">
                    <a href="#">
                        <i class="fa fa-dashboard"></i> <span>商品管理</span>
                        <span class="pull-right-container">
                            <i class="fa fa-angle-left pull-right"></i>
                        </span>
                    </a>
                    <ul class="treeview-menu">
                        <li>
                            <a href="javascript:wtsItem()"><i class="fa fa-circle-o"></i>出售商品</a>
                        </li>
                        <li>
                            <a href="javascript:wtbItem()"><i class="fa fa-circle-o"></i>求购信息</a>
                        </li>
                    </ul>
                </li>
                <li class="">
                    <a href="javascript:order_manage()">
                        <i class="fa fa-dashboard"></i> <span>订单管理</span>
                    </a>
                </li>
                <li class="">
                    <a href="javascript:publishInfo()">
                        <i class="fa fa-circle-o"></i>
                        待审核
                        <span class="pull-right-container">
                            <span class="label label-danger pull-right">${generalSit.infoToHandle}</span>
                        </span>
                    </a>
                    <%--
                                            <a href="#">
                                                <i class="fa fa-dashboard"></i> <span>信息审核</span>
                                                <span class="pull-right-container">
                                                    <i class="fa fa-angle-left pull-right"></i>
                                                    <span class="label label-primary pull-right">${generalSit.infoToHandle + 5}</span>
                                                </span>
                                            </a>
                                            <ul class="treeview-menu">
                                                <li>
                                                    <a href="javascript:getPassword()">
                                                        <i class="fa fa-circle-o"></i>
                                                        用户密码找回
                                                        <span class="pull-right-container">
                                                            <span class="label label-primary pull-right">5</span>
                                                        </span>
                                                    </a>

                                                </li>
                                                <li>
                                                    <a href="javascript:publishInfo()">
                                                        <i class="fa fa-circle-o"></i>
                                                        信息发布
                                                        <span class="pull-right-container">
                                                            <span class="label label-primary pull-right">${generalSit.infoToHandle}</span>
                                                        </span>
                                                    </a>
                                                </li>
                                            </ul>
                    --%>
                </li>

            </ul>
        </section>
        <!-- /.sidebar -->
    </aside>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper" id="page">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>今日平台概况</h1>
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-3 col-xs-6">
                        <div class="small-box bg-red-gradient">
                            <div class="inner">
                                <h3>${generalSit.member_sum}</h3>
                                <p>注册用户数</p>
                            </div>
                            <div class="icon">
                                <i class="fa fa-user"></i>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-xs-6">
                        <div class="small-box bg-aqua">
                            <div class="inner">
                                <h3>${generalSit.item_wts_sum}</h3>
                                <p>在售商品数</p>
                            </div>
                            <div class="icon">
                                <i class="fa fa-shopping-cart"></i>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-xs-6">
                        <div class="small-box bg-yellow-active">
                            <div class="inner">
                                <h3>${generalSit.item_wtb_sum}</h3>
                                <p>求购信息数</p>
                            </div>
                            <div class="icon">
                                <i class="fa fa-shopping-cart"></i>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-xs-6">
                        <div class="small-box bg-green">
                            <div class="inner">
                                <h3>${generalSit.order_today}</h3>
                                <p>今日完成订单</p>
                            </div>
                            <div class="icon">
                                <i class="ion ion-document"></i>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="row">
                    <div class="col-lg-3 col-xs-6">
                        <div class="small-box bg-yellow">
                            <div class="inner">
                                <h3>${generalSit.loginToday}</h3>
                                <p>今日登录用户数</p>
                            </div>
                            <div class="icon">
                                <i class="fa fa-user"></i>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-xs-6">
                        <div class="small-box bg-aqua">
                            <div class="inner">
                                <h3>${generalSit.item_wts_sum_today}</h3>
                                <p>今日发布出售数</p>
                            </div>
                            <div class="icon">
                                <i class="fa fa-phone"></i>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-xs-6">
                        <div class="small-box bg-light-blue-gradient">
                            <div class="inner">
                                <h3>${generalSit.item_wtb_sum_today}</h3>
                                <p>今日发布求购数</p>
                            </div>
                            <div class="icon">
                                <i class="fa fa-book"></i>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-xs-6">
                        <div class="small-box bg-blue-active">
                            <div class="inner">
                                <h3>${generalSit.order_total}</h3>
                                <p>完成订单总数</p>
                            </div>
                            <div class="icon">
                                <i class="fa fa-bar-chart"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- /.content -->
    </div>
    <div class="control-sidebar-bg"></div>
</div>
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
<script src="${pageContext.request.contextPath}/js/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/js/dataTables.js"></script>
<script src="${pageContext.request.contextPath}/js/ordersRowspan.js"></script>
<script src="${pageContext.request.contextPath}/js/modal.js"></script>

<script>
    function offitem(item_id) {
        $("#page").load("${pageContext.request.contextPath}/manage/offitem?item_id=" + item_id);
    }

    function shutmember(sid) {
        $("#page").load("${pageContext.request.contextPath}/manage/shutmember?sid=" + sid);
    }

    function activemember(sid) {
        $("#page").load("${pageContext.request.contextPath}/manage/activemember?sid=" + sid);
    }

    function member_manage() {
        $("#page").load("${pageContext.request.contextPath}/manage/member");
    }
    function item_manage() {
        $("#page").load("${pageContext.request.contextPath}/manage/item");
    }
    function order_manage() {
        $("#page").load("${pageContext.request.contextPath}/manage/manageOrder");
    }
    function wtsItem() {
        $("#page").load("${pageContext.request.contextPath}/manage/wtsitem");
    }
    function wtbItem() {
        $("#page").load("${pageContext.request.contextPath}/manage/wtbitem");
    }
    function publishInfo() {
        $('#page').load("${pageContext.request.contextPath}/manage/approval");
    }

</script>
</body>
</html>
