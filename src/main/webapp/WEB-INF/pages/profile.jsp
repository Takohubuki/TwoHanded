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
    <title>User Profile</title>
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
                    <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
                </div>
            </div>


            <ul class="sidebar-menu" data-widget="tree">
                <li class="header">NAVIGATION</li>
                <li><a href="javascript:updateprofile()"><i class="fa fa-book"></i> <span>修改资料</span></a></li>
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
                    </ul>
                </li>
                <li>
                    <a href="javascript:allorder()">
                        <i class="fa fa-dashboard"></i> <span>所有订单</span>
                    </a>
                </li>
                <li><a href="${pageContext.request.contextPath}/user/logout"><i class="fa fa-circle-o text-red"></i> <span>注销</span></a></li>
<%--                <li><a href="#"><i class="fa fa-circle-o text-yellow"></i> <span>Warning</span></a></li>--%>
<%--                <li><a href="#"><i class="fa fa-circle-o text-aqua"></i> <span>Information</span></a></li>--%>
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


        </section>
        <!-- /.content -->
    </div>



    <!-- Add the sidebar's background. This div must be placed
         immediately after the control sidebar -->
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
<!-- AdminLTE for demo purposes -->
<script src="${pageContext.request.contextPath}/js/demo.js"></script>

<script type="text/javascript">
    function myWts() {
        $("#page").load("${pageContext.request.contextPath}/user/publish/wts");
    }
    function myWtb() {
        $("#page").load("${pageContext.request.contextPath}/user/publish/wtb");
    }
    function updateprofile() {
        $("#page").load("${pageContext.request.contextPath}/user/updateprofile");
    }
    function allorder() {
        $("#page").load("${pageContext.request.contextPath}/user/allorder");
    }
</script>
</body>
</html>
