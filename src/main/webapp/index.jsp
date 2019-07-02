<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sercurity" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" isELIgnored="false"%>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>--%>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>HRBU二手交易</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<%--    <link rel="stylesheet" href="${pageContext.request.contextPath}/bower_components/bootstrap/dist/css/bootstrap.css">--%>
<%--    <!-- Font Awesome -->--%>
<%--    <link rel="stylesheet" href="${pageContext.request.contextPath}/bower_components/font-awesome/css/font-awesome.min.css">--%>
<%--    <!-- Ionicons -->--%>
<%--    <link rel="stylesheet" href="${pageContext.request.contextPath}/bower_components/Ionicons/css/ionicons.min.css">--%>
<%--    <!-- Theme style -->--%>
<%--    <link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/AdminLTE.css">--%>
<%--    <!-- AdminLTE Skins. We have chosen the skin-blue for this starter--%>
<%--          page. However, you can choose any other skin. Make sure you--%>
<%--          apply the skin class to the body tag so the changes take effect. -->--%>
<%--    <link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/skins/_all-skins.css">--%>

<%--    <!-- Latest compiled and minified JavaScript -->--%>
<%--    <script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.9/dist/js/bootstrap-select.min.js"></script>--%>
<%--    <!-- jQuery 3 -->--%>
<%--    <script src="${pageContext.request.contextPath}/bower_components/jquery/dist/jquery.min.js"></script>--%>
<%--    <!-- Bootstrap 3.3.7 -->--%>
<%--    <script src="${pageContext.request.contextPath}/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>--%>
<%--    <!-- AdminLTE App -->--%>
<%--    <script src="${pageContext.request.contextPath}/dist/js/adminlte.min.js"></script>--%>

<%--</head>--%>

<%--<body class="hold-transition skin-blue sidebar-mini sidebar-collapse">--%>
<%--<div class="wrapper">--%>

<%--    <!-- Main Header -->--%>
<%--    <header class="main-header">--%>

<%--        <!-- Logo -->--%>
<%--        <a href="${pageContext.servletContext.contextPath}/index/backindex" class="logo">--%>
<%--            <!-- mini logo for sidebar mini 50x50 pixels -->--%>
<%--            <span class="logo-mini">HRBU</span>--%>
<%--            <!-- logo for regular state and mobile devices -->--%>
<%--            <span class="logo-lg"><b>HRBU</b>二手商城</span>--%>
<%--        </a>--%>

<%--        <!-- Header Navbar -->--%>
<%--        <nav class="navbar navbar-static-top" role="navigation">--%>
<%--            <!-- Sidebar toggle button-->--%>
<%--            <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">--%>
<%--                <span class="sr-only">Toggle navigation</span>--%>
<%--            </a>--%>
<%--            <!-- Navbar Right Menu -->--%>
<%--            <div class="navbar-custom-menu">--%>
<%--                <ul class="nav navbar-nav">--%>

<%--                    <c:if test="${member == null}">--%>
<%--                        <li>--%>
<%--                            <a href="${pageContext.servletContext.contextPath}/user/login" class="btn">登录</a>--%>
<%--                        </li>--%>
<%--                        <li>--%>
<%--                            <a href="${pageContext.servletContext.contextPath}/user/register" class="btn">注册</a>--%>
<%--                        </li>--%>

<%--                    </c:if>--%>
<%--                    <c:if test="${member != null}">--%>
<%--                    <!-- User Account Menu -->--%>
<%--                        <li class="dropdown user user-menu">--%>
<%--                        <!-- Menu Toggle Button -->--%>
<%--                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">--%>
<%--                            <!-- The user image in the navbar-->--%>
<%--                            <img src="${pageContext.request.contextPath}/img/avatar/${member.avatar}" class="user-image" alt="User Image">--%>
<%--                            <!-- hidden-xs hides the username on small devices so only the image appears. -->--%>
<%--                            <span class="hidden-xs">${member.username}</span>--%>
<%--                        </a>--%>
<%--                        <ul class="dropdown-menu">--%>
<%--                            <!-- The user image in the menu -->--%>
<%--                            <li class="user-header">--%>
<%--                                <img src="img/avatar/${member.avatar}" class="img-circle" alt="User Image">--%>

<%--                                <p>--%>
<%--                                    ${member.username}--%>
<%--                                    <small>欢迎！</small>--%>
<%--                                </p>--%>
<%--                            </li>--%>
<%--                            <!-- Menu Body -->--%>
<%--                            <li class="user-body">--%>
<%--                                <div class="row">--%>
<%--                                    <div class="col-xs-4 text-center">--%>
<%--                                        <a href="#">Followers</a>--%>
<%--                                    </div>--%>
<%--                                    <div class="col-xs-4 text-center">--%>
<%--                                        <a href="#">Sales</a>--%>
<%--                                    </div>--%>
<%--                                    <div class="col-xs-4 text-center">--%>
<%--                                        <a href="#">Friends</a>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                                <!-- /.row -->--%>
<%--                            </li>--%>
<%--                            <!-- Menu Footer-->--%>
<%--                            <li class="user-footer">--%>
<%--                                <div class="pull-left">--%>
<%--                                    <a href="#" class="btn btn-default btn-flat">资料</a>--%>
<%--                                </div>--%>
<%--                                <div class="pull-right">--%>
<%--                                    <a href="${pageContext.servletContext.contextPath}/user/logout" class="btn btn-default btn-flat">注销</a>--%>
<%--                                </div>--%>
<%--                            </li>--%>
<%--                        </ul>--%>
<%--                    </li>--%>
<%--                    </c:if>--%>

<%--                </ul>--%>
<%--            </div>--%>
<%--        </nav>--%>
<%--    </header>--%>
<%--    <!-- Left side column. contains the logo and sidebar--%>
<%--            侧边栏-->--%>
<%--    <aside class="main-sidebar">--%>

<%--        <!-- sidebar: style can be found in sidebar.less -->--%>
<%--        <section class="sidebar">--%>

<%--&lt;%&ndash;            <!-- 侧边栏 -->&ndash;%&gt;--%>
<%--&lt;%&ndash;            <div class="user-panel">&ndash;%&gt;--%>
<%--&lt;%&ndash;                <div class="pull-left image">&ndash;%&gt;--%>
<%--&lt;%&ndash;                    <img src="dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">&ndash;%&gt;--%>
<%--&lt;%&ndash;                </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                <div class="pull-left info">&ndash;%&gt;--%>
<%--&lt;%&ndash;                    <p>${member.username}</p>&ndash;%&gt;--%>
<%--&lt;%&ndash;                    <!-- Status -->&ndash;%&gt;--%>
<%--&lt;%&ndash;                    <a href="#"><i class="fa fa-circle text-success"></i> Online</a>&ndash;%&gt;--%>
<%--&lt;%&ndash;                </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;            </div>&ndash;%&gt;--%>

<%--            <!-- search form (Optional) -->--%>
<%--            <form action="#" method="get" class="sidebar-form">--%>
<%--                <div class="input-group">--%>
<%--                    <input type="text" name="q" class="form-control" placeholder="Search...">--%>
<%--                    <span class="input-group-btn">--%>
<%--              <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>--%>
<%--              </button>--%>
<%--            </span>--%>
<%--                </div>--%>
<%--            </form>--%>
<%--            <!-- /.search form -->--%>

<%--            <!-- Sidebar Menu -->--%>
<%--            <ul class="sidebar-menu" data-widget="tree">--%>
<%--                <li class="header">HEADER</li>--%>
<%--                <!-- Optionally, you can add icons to the links -->--%>
<%--                <li class="active"><a href="#"><i class="fa fa-link"></i> <span>Link</span></a></li>--%>
<%--                <li><a href="#"><i class="fa fa-link"></i> <span>Another Link</span></a></li>--%>
<%--                <li class="treeview">--%>
<%--                    <a href="#"><i class="fa fa-link"></i> <span>Multilevel</span>--%>
<%--                        <span class="pull-right-container">--%>
<%--                            <i class="fa fa-angle-left pull-right"></i>--%>
<%--                        </span>--%>
<%--                    </a>--%>
<%--                    <ul class="treeview-menu">--%>
<%--                        <li><a href="#">Link in level 2</a></li>--%>
<%--                        <li><a href="#">Link in level 2</a></li>--%>
<%--                    </ul>--%>
<%--                </li>--%>
<%--            </ul>--%>
<%--            <!-- /.sidebar-menu -->--%>
<%--        </section>--%>
<%--        <!-- /.sidebar -->--%>
<%--    </aside>--%>

<%--    <!-- Content Wrapper. Contains page content -->--%>
<%--    <div class="content-wrapper">--%>
<%--        <!-- Content Header (Page header) -->--%>
<%--        <section class="content-header">--%>
<%--            <h1>--%>
<%--                Page Header--%>
<%--                <small>Optional description</small>--%>
<%--            </h1>--%>
<%--            <ol class="breadcrumb">--%>
<%--                <li><a href="#"><i class="fa fa-dashboard"></i> Level</a></li>--%>
<%--                <li class="active">Here</li>--%>
<%--            </ol>--%>
<%--        </section>--%>

<%--        <!-- Main content -->--%>
<%--        <section class="content container-fluid">--%>
<%--        	<div class="col-md-6">--%>
<%--        		<div class="box box-solid">--%>
<%--        			<div class="box-header width-border">--%>
<%--        				<div class="box-body">--%>
<%--        					<div name="craousel-example-generic" class="craousel slide" data-ride="craousel">--%>
<%--        						--%>
<%--        					</div>--%>
<%--        				</div>--%>
<%--        			</div>--%>
<%--                </div>--%>
<%--            </div>--%>

<%--            <!----------------------------%>
<%--              | Your Page Content Here |--%>
<%--              -------------------------->--%>

<%--        </section>--%>
<%--        <!-- /.content -->--%>
<%--    </div>--%>
<%--    <!-- /.content-wrapper -->--%>

<%--    <!-- Main Footer -->--%>
<%--    <footer class="main-footer">--%>
<%--        <!-- To the right -->--%>
<%--        <div class="pull-right hidden-xs">--%>
<%--            Anything you want--%>
<%--        </div>--%>
<%--        <!-- Default to the left -->--%>
<%--        <strong>Copyright &copy; 2016 <a href="#">Company</a>.</strong> All rights reserved.--%>
<%--    </footer>--%>

<%--</div>--%>
<%--<!-- ./wrapper -->--%>

<%--</body>--%>

<%--</html>--%>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="keywords" content="" />
        <script>
            addEventListener("load", function () {
                setTimeout(hideURLbar, 0);
            }, false);

            function hideURLbar() {
                window.scrollTo(0, 1);
            }
        </script>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
        <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
        <link href="css/font-awesome.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.9/dist/css/bootstrap-select.min.css">
        <link href="css/popuo-box.css" rel="stylesheet" type="text/css" media="all" />
        <link rel="stylesheet" type="text/css" href="css/jquery-ui1.css">
        <link href="http://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800" rel="stylesheet">
    </head>

<body>
<div class="header-most-top">
    <p>哈学院官方唯一指定二手交易平台</p>
</div>
<div class="header-bot">
    <div class="header-bot_inner_wthreeinfo_header_mid">
        <div class="col-md-4 logo_agile">
            <h1>
                <a href="${pageContext.request.contextPath}/index/backindex">
                    <span>H</span>RBU
                    <span>S</span>econdHand
                    <span>P</span>latform
                    <img src="images/logo2.png" alt=" ">
                </a>
            </h1>
        </div>
        <div class="col-md-8 header">
            <ul>
                <c:if test="${member == null}">
                    <li class="navbar-right">
                        <a href="#" data-toggle="modal" data-target="#myModal2">
                            <span class="fa fa-pencil-square-o" aria-hidden="true"></span> 注 册</a>
                    </li>
                    <li class="navbar-right">
                        <a href="#" data-toggle="modal" data-target="#myModal1">
                            <span class="fa fa-unlock-alt" aria-hidden="true"></span> 登 录 </a>
                    </li>
                </c:if>
                <c:if test="${member != null}">
                    <li class="navbar-right">
                        <a href="${pageContext.request.contextPath}/user/logout">
                            <span class="fa fa-pencil-square-o" aria-hidden="true"></span> 注 销</a>
                    </li>
                    <li class="navbar-right">
                        你好！<a href="#" >
                                <img src="${pageContext.request.contextPath}/images/avatar/${member.avatar}" class="img-circle" style="width: 20px;height: 20px">
                                ${member.username}
                    </a>
                    </li>

                </c:if>
            </ul>
            <!--站内搜索模块 -->
            <div class="agileits_search">
                <form action="${pageContext.request.contextPath}/items/search" method="post">
                    <input name="Search" type="search" placeholder="想搜点什么？" required="">
                    <button type="submit" class="btn btn-default" aria-label="Left Align">
                        <span class="fa fa-search" aria-hidden="true"> </span>
                    </button>
                </form>
            </div>
            <!-- //搜索结束 -->
            <!-- 购物车模块 -->
            <div class="top_nav_right">
                <div class="wthreecartaits wthreecartaits2 cart cart box_1">
                    <form action="#" method="post" class="last">
                        <input type="hidden" name="cmd" value="_cart">
                        <input type="hidden" name="display" value="1">
                        <button class="w3view-cart" type="submit" name="submit" value="">
                            <i class="fa fa-cart-arrow-down" aria-hidden="true"></i>
                        </button>
                    </form>
                </div>
            </div>
            <!-- //购物车结束 -->
            <div class="clearfix"></div>
        </div>
        <div class="clearfix"></div>
    </div>
</div>

<!-- 登录模块 -->
<div class="modal fade" id="myModal1" tabindex="-1" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body modal-body-sub_agile">
                <div class="main-mailposi">
                    <span class="fa fa-envelope-o" aria-hidden="true"></span>
                </div>
                <div class="modal_body_left modal_body_left1">
                    <h3 class="agileinfo_sign">登 录 </h3>
                    <p>
                        没有账号？点击注册
                        <a href="#" data-toggle="modal" data-target="#myModal2">
                            去注册</a>
                    </p>
                    <form action="${pageContext.request.contextPath}/user/signin" method="post">
                        <div class="styled-input agile-styled-input-top">
                            <input type="text" placeholder="User Name" name="username" required="">
                        </div>
                        <div class="styled-input">
                            <input type="password" placeholder="Password" name="password" required="">
                        </div>
                        <input type="submit" value="登录">

                    </form>
                    <div class="clearfix"></div>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
        <!-- //Modal content-->
    </div>
</div>
<!-- //登录结束 -->
<!-- 注册模块 -->
<div class="modal fade" id="myModal2" tabindex="-1" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body modal-body-sub_agile">
                <div class="main-mailposi">
                    <span class="fa fa-envelope-o" aria-hidden="true"></span>
                </div>
                <div class="modal_body_left modal_body_left1">
                    <h3 class="agileinfo_sign">注 册</h3>

                    <form action="${pageContext.request.contextPath}/user/signup" method="post">
                        <div class="styled-input agile-styled-input-top">
                            <input type="text" placeholder="学号" name="sid" required="">
                        </div>
                        <div class="styled-input">
                            <input type="text" placeholder="真实姓名" name="name" required="">
                        </div>
                        <div class="styled-input">
                            <input type="text" placeholder="用户名" name="username" required="">
                        </div>
                        <div class="styled-input">
                            <input type="text" placeholder="寝室号 如2公寓202为2202" name="dormitory" required="">
                        </div>
                        <div class="styled-input">
                            <input type="text" placeholder="联系电话" name="phone" required="">
                        </div>
                        <div class="styled-input">
                            <input type="password" placeholder="密码" name="password" id="password1" required="">
                        </div>
                        <div class="styled-input">
                            <input type="password" placeholder="再次输入密码" name="Confirm Password" id="password2" required="">
                        </div>
                        <input type="submit" value="注册">
                    </form>

                </div>
            </div>
        </div>
        <!-- //Modal content-->
    </div>
</div>
<!-- //注册结束 -->
<!-- 导航栏模块 -->
<div class="ban-top">
    <div class="container">

        <div class="top_nav_left">
            <nav class="navbar navbar-default">
                <div class="container-fluid">
                    <!-- Brand and toggle get grouped for better mobile display -->
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
                                aria-expanded="false">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                    </div>
                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse menu--shylock" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav menu__list">
                            <li class="active">
                                <a class="nav-stylehead" href="index.html">主页
                                    <span class="sr-only">(current)</span>
                                </a>
                            </li>
                            <li class="">
                                <a class="nav-stylehead" href="about.html">About Us</a>
                            </li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle nav-stylehead" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">电子产品
                                    <span class="caret"></span>
                                </a>
                                <ul class="dropdown-menu multi-column columns-3">
                                    <div class="agile_inner_drop_nav_info">
                                        <div class="col-sm-4 multi-gd-img">
                                            <ul class="multi-column-dropdown">
                                                <li>
                                                    <a href="product.html">Bakery</a>
                                                </li>
                                                <li>
                                                    <a href="product.html">Baking Supplies</a>
                                                </li>
                                                <li>
                                                    <a href="product.html">Coffee, Tea & Beverages</a>
                                                </li>
                                                <li>
                                                    <a href="product.html">Dried Fruits, Nuts</a>
                                                </li>
                                                <li>
                                                    <a href="product.html">Sweets, Chocolate</a>
                                                </li>
                                                <li>
                                                    <a href="product.html">Spices & Masalas</a>
                                                </li>
                                                <li>
                                                    <a href="product.html">Jams, Honey & Spreads</a>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="col-sm-4 multi-gd-img">
                                            <ul class="multi-column-dropdown">
                                                <li>
                                                    <a href="product.html">Pickles</a>
                                                </li>
                                                <li>
                                                    <a href="product.html">Pasta & Noodles</a>
                                                </li>
                                                <li>
                                                    <a href="product.html">Rice, Flour & Pulses</a>
                                                </li>
                                                <li>
                                                    <a href="product.html">Sauces & Cooking Pastes</a>
                                                </li>
                                                <li>
                                                    <a href="product.html">Snack Foods</a>
                                                </li>
                                                <li>
                                                    <a href="product.html">Oils, Vinegars</a>
                                                </li>
                                                <li>
                                                    <a href="product.html">Meat, Poultry & Seafood</a>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="col-sm-4 multi-gd-img">
                                            <img src="images/nav.png" alt="">
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                </ul>
                            </li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle nav-stylehead" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">衣物
                                    <span class="caret"></span>
                                </a>
                                <ul class="dropdown-menu multi-column columns-3">
                                    <div class="agile_inner_drop_nav_info">
                                        <div class="col-sm-6 multi-gd-img">
                                            <ul class="multi-column-dropdown">
                                                <li>
                                                    <a href="product2.html">Kitchen & Dining</a>
                                                </li>
                                                <li>
                                                    <a href="product2.html">Detergents</a>
                                                </li>
                                                <li>
                                                    <a href="product2.html">Utensil Cleaners</a>
                                                </li>
                                                <li>
                                                    <a href="product2.html">Floor & Other Cleaners</a>
                                                </li>
                                                <li>
                                                    <a href="product2.html">Disposables, Garbage Bag</a>
                                                </li>
                                                <li>
                                                    <a href="product2.html">Repellents & Fresheners</a>
                                                </li>
                                                <li>
                                                    <a href="product2.html"> Dishwash</a>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="col-sm-6 multi-gd-img">
                                            <ul class="multi-column-dropdown">
                                                <li>
                                                    <a href="product2.html">Pet Care</a>
                                                </li>
                                                <li>
                                                    <a href="product2.html">Cleaning Accessories</a>
                                                </li>
                                                <li>
                                                    <a href="product2.html">Pooja Needs</a>
                                                </li>
                                                <li>
                                                    <a href="product2.html">Crackers</a>
                                                </li>
                                                <li>
                                                    <a href="product2.html">Festive Decoratives</a>
                                                </li>
                                                <li>
                                                    <a href="product2.html">Plasticware</a>
                                                </li>
                                                <li>
                                                    <a href="product2.html">Home Care</a>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                </ul>
                            </li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle nav-stylehead" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">生活用品
                                    <span class="caret"></span>
                                </a>
                                <ul class="dropdown-menu multi-column columns-3">
                                    <div class="agile_inner_drop_nav_info">
                                        <div class="col-sm-6 multi-gd-img">
                                            <ul class="multi-column-dropdown">
                                                <li>
                                                    <a href="product2.html">Kitchen & Dining</a>
                                                </li>
                                                <li>
                                                    <a href="product2.html">Detergents</a>
                                                </li>
                                                <li>
                                                    <a href="product2.html">Utensil Cleaners</a>
                                                </li>
                                                <li>
                                                    <a href="product2.html">Floor & Other Cleaners</a>
                                                </li>
                                                <li>
                                                    <a href="product2.html">Disposables, Garbage Bag</a>
                                                </li>
                                                <li>
                                                    <a href="product2.html">Repellents & Fresheners</a>
                                                </li>
                                                <li>
                                                    <a href="product2.html"> Dishwash</a>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="col-sm-6 multi-gd-img">
                                            <ul class="multi-column-dropdown">
                                                <li>
                                                    <a href="product2.html">Pet Care</a>
                                                </li>
                                                <li>
                                                    <a href="product2.html">Cleaning Accessories</a>
                                                </li>
                                                <li>
                                                    <a href="product2.html">Pooja Needs</a>
                                                </li>
                                                <li>
                                                    <a href="product2.html">Crackers</a>
                                                </li>
                                                <li>
                                                    <a href="product2.html">Festive Decoratives</a>
                                                </li>
                                                <li>
                                                    <a href="product2.html">Plasticware</a>
                                                </li>
                                                <li>
                                                    <a href="product2.html">Home Care</a>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                </ul>
                            </li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle nav-stylehead" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">杂物
                                    <span class="caret"></span>
                                </a>
                                <ul class="dropdown-menu multi-column columns-3">
                                    <div class="agile_inner_drop_nav_info">
                                        <div class="col-sm-6 multi-gd-img">
                                            <ul class="multi-column-dropdown">
                                                <li>
                                                    <a href="product2.html">Kitchen & Dining</a>
                                                </li>
                                                <li>
                                                    <a href="product2.html">Detergents</a>
                                                </li>
                                                <li>
                                                    <a href="product2.html">Utensil Cleaners</a>
                                                </li>
                                                <li>
                                                    <a href="product2.html">Floor & Other Cleaners</a>
                                                </li>
                                                <li>
                                                    <a href="product2.html">Disposables, Garbage Bag</a>
                                                </li>
                                                <li>
                                                    <a href="product2.html">Repellents & Fresheners</a>
                                                </li>
                                                <li>
                                                    <a href="product2.html"> Dishwash</a>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="col-sm-6 multi-gd-img">
                                            <ul class="multi-column-dropdown">
                                                <li>
                                                    <a href="product2.html">Pet Care</a>
                                                </li>
                                                <li>
                                                    <a href="product2.html">Cleaning Accessories</a>
                                                </li>
                                                <li>
                                                    <a href="product2.html">Pooja Needs</a>
                                                </li>
                                                <li>
                                                    <a href="product2.html">Crackers</a>
                                                </li>
                                                <li>
                                                    <a href="product2.html">Festive Decoratives</a>
                                                </li>
                                                <li>
                                                    <a href="product2.html">Plasticware</a>
                                                </li>
                                                <li>
                                                    <a href="product2.html">Home Care</a>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                </ul>
                            </li>
                            <li class="">
                                <a class="nav-stylehead" href="faqs.html">Faqs</a>
                            </li>
                            <li class="dropdown">
                                <a class="nav-stylehead dropdown-toggle" href="#" data-toggle="dropdown">Pages
                                    <b class="caret"></b>
                                </a>
                                <ul class="dropdown-menu agile_short_dropdown">
                                    <li>
                                        <a href="icons.html">Web Icons</a>
                                    </li>
                                    <li>
                                        <a href="typography.html">Typography</a>
                                    </li>
                                </ul>
                            </li>
                            <li class="">
                                <a class="nav-stylehead" href="contact.html">Contact</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
        </div>
    </div>
</div>
<!-- //导航栏结束 -->

<!-- 轮播图模块 -->
<div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators-->
    <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1" class=""></li>
        <li data-target="#myCarousel" data-slide-to="2" class=""></li>
        <li data-target="#myCarousel" data-slide-to="3" class=""></li>
    </ol>
    <div class="carousel-inner" role="listbox">
        <div class="item active">
            <div class="container">
                <div class="carousel-caption">
                    <h3>今日
                        <span>精选</span>
                    </h3>
                    <p>
                        <span>10%</span> Cashback</p>
                    <a class="button2" href="product.html">查看详情 </a>
                </div>
            </div>
        </div>
        <div class="item item2">
            <div class="container">
                <div class="carousel-caption">
                    <h3>Healthy
                        <span>Saving</span>
                    </h3>
                    <p>Get Upto
                        <span>30%</span> Off</p>
                    <a class="button2" href="product.html">查看详情 </a>
                </div>
            </div>
        </div>
        <div class="item item3">
            <div class="container">
                <div class="carousel-caption">
                    <h3>Big
                        <span>Deal</span>
                    </h3>
                    <p>Get Best Offer Upto
                        <span>20%</span>
                    </p>
                    <a class="button2" href="product.html">查看详情 </a>
                </div>
            </div>
        </div>
        <div class="item item4">
            <div class="container">
                <div class="carousel-caption">
                    <h3>大家
                        <span>都在看</span>
                    </h3>
                    <p>Get Now
                        <span>40%</span> Discount</p>
                    <a class="button2" href="product.html">查看详情</a>
                </div>
            </div>
        </div>
    </div>
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">上一个</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">下一个</span>
    </a>
</div>
<!-- //轮播图模块 -->

<!-- 展示商品模块 -->
<div class="ads-grid">
    <div class="container">
        <!-- tittle heading -->
        <h3 class="tittle-w3l">最新发布
            <span class="heading-style">
					<i></i>
					<i></i>
					<i></i>
				</span>
        </h3>
        <!-- //tittle heading -->

        <!-- product right -->
        <div class="agileinfo-ads-display center-block">
            <div class="wrapper">
                <!-- first section (nuts) -->
                <div class="product-sec1">
                    <h3 class="heading-tittle">出售</h3>
                    <c:forEach var="newestitems" items="${newestitems}">
                        <div class="col-md-4 product-men">
                            <div class="men-pro-item simpleCart_shelfItem">
                                <div class="men-thumb-item">
                                    <img src="${newestitems.image}" alt="">
                                    <div class="men-cart-pro">
                                        <div class="inner-men-cart-pro">
                                            <a href="${pageContext.request.contextPath}/items/singleitem" class="link-product-add-cart">Quick View</a>
                                        </div>
                                    </div>
                                    <span class="product-new-top">New</span>
                                </div>
                                <div class="item-info-product ">
                                    <h4>
                                        <a href="${pageContext.request.contextPath}/items/singleitem">${newestitems.name}</a>
                                    </h4>
                                    <div class="info-product-price">
                                        <span class="item_price">${newestitems .price}</span>

                                    </div>
                                    <div class="snipcart-details top_brand_home_details item_add single-item hvr-outline-out">
                                        <form action="${pageContext.request.contextPath}/order/addcart" method="post">
                                            <fieldset>
                                                <input type="hidden" name="cmd" value="_cart" />
                                                <input type="hidden" name="add" value="1" />
                                                <input type="hidden" name="business" value=" " />
                                                <input type="hidden" name="item_name" value="Almonds, 100g" />
                                                <input type="hidden" name="amount" value="149.00" />
                                                <input type="hidden" name="discount_amount" value="1.00" />
                                                <input type="hidden" name="currency_code" value="USD" />
                                                <input type="hidden" name="return" value=" " />
                                                <input type="hidden" name="cancel_return" value=" " />
                                                <input type="submit" name="submit" value="Add to cart" class="button" />
                                            </fieldset>
                                        </form>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </c:forEach>
<%--                    <div class="col-md-4 product-men">--%>
<%--                        <div class="men-pro-item simpleCart_shelfItem">--%>
<%--                            <div class="men-thumb-item">--%>
<%--                                <img src="images/m1.jpg" alt="">--%>
<%--                                <div class="men-cart-pro">--%>
<%--                                    <div class="inner-men-cart-pro">--%>
<%--                                        <a href="${pageContext.request.contextPath}/items/singleitem" class="link-product-add-cart">Quick View</a>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                                <span class="product-new-top">New</span>--%>
<%--                            </div>--%>
<%--                            <div class="item-info-product ">--%>
<%--                                <h4>--%>
<%--                                    <a href="single.html">Almonds, 100g</a>--%>
<%--                                </h4>--%>
<%--                                <div class="info-product-price">--%>
<%--                                    <span class="item_price">$149.00</span>--%>

<%--                                </div>--%>
<%--                                <div class="snipcart-details top_brand_home_details item_add single-item hvr-outline-out">--%>
<%--                                    <form action="#" method="post">--%>
<%--                                        <fieldset>--%>
<%--                                            <input type="hidden" name="cmd" value="_cart" />--%>
<%--                                            <input type="hidden" name="add" value="1" />--%>
<%--                                            <input type="hidden" name="business" value=" " />--%>
<%--                                            <input type="hidden" name="item_name" value="Almonds, 100g" />--%>
<%--                                            <input type="hidden" name="amount" value="149.00" />--%>
<%--                                            <input type="hidden" name="discount_amount" value="1.00" />--%>
<%--                                            <input type="hidden" name="currency_code" value="USD" />--%>
<%--                                            <input type="hidden" name="return" value=" " />--%>
<%--                                            <input type="hidden" name="cancel_return" value=" " />--%>
<%--                                            <input type="submit" name="submit" value="Add to cart" class="button" />--%>
<%--                                        </fieldset>--%>
<%--                                    </form>--%>
<%--                                </div>--%>

<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="col-md-4 product-men">--%>
<%--                        <div class="men-pro-item simpleCart_shelfItem">--%>
<%--                            <div class="men-thumb-item">--%>
<%--                                <img src="images/m2.jpg" alt="">--%>
<%--                                <div class="men-cart-pro">--%>
<%--                                    <div class="inner-men-cart-pro">--%>
<%--                                        <a href="single.html" class="link-product-add-cart">Quick View</a>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                                <span class="product-new-top">New</span>--%>

<%--                            </div>--%>
<%--                            <div class="item-info-product ">--%>
<%--                                <h4>--%>
<%--                                    <a href="single.html">Cashew Nuts, 100g</a>--%>
<%--                                </h4>--%>
<%--                                <div class="info-product-price">--%>
<%--                                    <span class="item_price">$200.00</span>--%>

<%--                                </div>--%>
<%--                                <div class="snipcart-details top_brand_home_details item_add single-item hvr-outline-out">--%>
<%--                                    <form action="#" method="post">--%>
<%--                                        <fieldset>--%>
<%--                                            <input type="hidden" name="cmd" value="_cart" />--%>
<%--                                            <input type="hidden" name="add" value="1" />--%>
<%--                                            <input type="hidden" name="business" value=" " />--%>
<%--                                            <input type="hidden" name="item_name" value="Cashew Nuts, 100g" />--%>
<%--                                            <input type="hidden" name="amount" value="200.00" />--%>
<%--                                            <input type="hidden" name="discount_amount" value="1.00" />--%>
<%--                                            <input type="hidden" name="currency_code" value="USD" />--%>
<%--                                            <input type="hidden" name="return" value=" " />--%>
<%--                                            <input type="hidden" name="cancel_return" value=" " />--%>
<%--                                            <input type="submit" name="submit" value="Add to cart" class="button" />--%>
<%--                                        </fieldset>--%>
<%--                                    </form>--%>
<%--                                </div>--%>

<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="col-md-4 product-men">--%>
<%--                        <div class="men-pro-item simpleCart_shelfItem">--%>
<%--                            <div class="men-thumb-item">--%>
<%--                                <img src="images/m3.jpg" alt="">--%>
<%--                                <div class="men-cart-pro">--%>
<%--                                    <div class="inner-men-cart-pro">--%>
<%--                                        <a href="single.html" class="link-product-add-cart">Quick View</a>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                                <span class="product-new-top">New</span>--%>

<%--                            </div>--%>
<%--                            <div class="item-info-product ">--%>
<%--                                <h4>--%>
<%--                                    <a href="single.html">Pista..., 250g</a>--%>
<%--                                </h4>--%>
<%--                                <div class="info-product-price">--%>
<%--                                    <span class="item_price">$520.99</span>--%>

<%--                                </div>--%>
<%--                                <div class="snipcart-details top_brand_home_details item_add single-item hvr-outline-out">--%>
<%--                                    <form action="#" method="post">--%>
<%--                                        <fieldset>--%>
<%--                                            <input type="hidden" name="cmd" value="_cart" />--%>
<%--                                            <input type="hidden" name="add" value="1" />--%>
<%--                                            <input type="hidden" name="business" value=" " />--%>
<%--                                            <input type="hidden" name="item_name" value="Pista, 250g" />--%>
<%--                                            <input type="hidden" name="amount" value="520.99" />--%>
<%--                                            <input type="hidden" name="discount_amount" value="1.00" />--%>
<%--                                            <input type="hidden" name="currency_code" value="USD" />--%>
<%--                                            <input type="hidden" name="return" value=" " />--%>
<%--                                            <input type="hidden" name="cancel_return" value=" " />--%>
<%--                                            <input type="submit" name="submit" value="Add to cart" class="button" />--%>
<%--                                        </fieldset>--%>
<%--                                    </form>--%>
<%--                                </div>--%>

<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
                    <div class="clearfix"></div>
                </div>
                <!-- //first section (nuts) -->
                <!-- second section (nuts special) -->
                <div class="product-sec1 product-sec2">
                    <div class="col-xs-7 effect-bg">
                        <h3 class="">Pure Energy</h3>
                        <h6>Enjoy our all healthy Products</h6>
                        <p>Get Extra 10% Off</p>
                    </div>
                    <h3 class="w3l-nut-middle">Nuts & Dry Fruits</h3>
                    <div class="col-xs-5 bg-right-nut">
                        <img src="images/nut1.png" alt="">
                    </div>
                    <div class="clearfix"></div>
                </div>
                <!-- //second section (nuts special) -->
                <!-- third section (oils) -->
                <div class="product-sec1">
                    <h3 class="heading-tittle">Oils</h3>
                    <div class="col-md-4 product-men">
                        <div class="men-pro-item simpleCart_shelfItem">
                            <div class="men-thumb-item">
                                <img src="images/mk4.jpg" alt="">
                                <div class="men-cart-pro">
                                    <div class="inner-men-cart-pro">
                                        <a href="single.html" class="link-product-add-cart">Quick View</a>
                                    </div>
                                </div>
                                <span class="product-new-top">New</span>
                            </div>
                            <div class="item-info-product ">
                                <h4>
                                    <a href="single.html">Freedom Oil, 1L</a>
                                </h4>
                                <div class="info-product-price">
                                    <span class="item_price">$78.00</span>
                                    <del>$110.00</del>
                                </div>
                                <div class="snipcart-details top_brand_home_details item_add single-item hvr-outline-out">
                                    <form action="#" method="post">
                                        <fieldset>
                                            <input type="hidden" name="cmd" value="_cart" />
                                            <input type="hidden" name="add" value="1" />
                                            <input type="hidden" name="business" value=" " />
                                            <input type="hidden" name="item_name" value="Freedom Sunflower Oil, 1L" />
                                            <input type="hidden" name="amount" value="78.00" />
                                            <input type="hidden" name="discount_amount" value="1.00" />
                                            <input type="hidden" name="currency_code" value="USD" />
                                            <input type="hidden" name="return" value=" " />
                                            <input type="hidden" name="cancel_return" value=" " />
                                            <input type="submit" name="submit" value="Add to cart" class="button" />
                                        </fieldset>
                                    </form>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 product-men">
                        <div class="men-pro-item simpleCart_shelfItem">
                            <div class="men-thumb-item">
                                <img src="images/mk5.jpg" alt="">
                                <div class="men-cart-pro">
                                    <div class="inner-men-cart-pro">
                                        <a href="single.html" class="link-product-add-cart">Quick View</a>
                                    </div>
                                </div>
                                <span class="product-new-top">New</span>

                            </div>
                            <div class="item-info-product ">
                                <h4>
                                    <a href="single.html">Saffola Gold, 1L</a>
                                </h4>
                                <div class="info-product-price">
                                    <span class="item_price">$130.00</span>
                                    <del>$150.00</del>
                                </div>
                                <div class="snipcart-details top_brand_home_details item_add single-item hvr-outline-out">
                                    <form action="#" method="post">
                                        <fieldset>
                                            <input type="hidden" name="cmd" value="_cart" />
                                            <input type="hidden" name="add" value="1" />
                                            <input type="hidden" name="business" value=" " />
                                            <input type="hidden" name="item_name" value="Saffola Gold, 1L" />
                                            <input type="hidden" name="amount" value="130.00" />
                                            <input type="hidden" name="discount_amount" value="1.00" />
                                            <input type="hidden" name="currency_code" value="USD" />
                                            <input type="hidden" name="return" value=" " />
                                            <input type="hidden" name="cancel_return" value=" " />
                                            <input type="submit" name="submit" value="Add to cart" class="button" />
                                        </fieldset>
                                    </form>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 product-men">
                        <div class="men-pro-item simpleCart_shelfItem">
                            <div class="men-thumb-item">
                                <img src="images/mk6.jpg" alt="">
                                <div class="men-cart-pro">
                                    <div class="inner-men-cart-pro">
                                        <a href="single.html" class="link-product-add-cart">Quick View</a>
                                    </div>
                                </div>
                                <span class="product-new-top">New</span>

                            </div>
                            <div class="item-info-product ">
                                <h4>
                                    <a href="single.html">Fortune Oil, 5L</a>
                                </h4>
                                <div class="info-product-price">
                                    <span class="item_price">$399.99</span>
                                    <del>$500.00</del>
                                </div>
                                <div class="snipcart-details top_brand_home_details item_add single-item hvr-outline-out">
                                    <form action="#" method="post">
                                        <fieldset>
                                            <input type="hidden" name="cmd" value="_cart" />
                                            <input type="hidden" name="add" value="1" />
                                            <input type="hidden" name="business" value=" " />
                                            <input type="hidden" name="item_name" value="Fortune Oil, 5L" />
                                            <input type="hidden" name="amount" value="399.99" />
                                            <input type="hidden" name="discount_amount" value="1.00" />
                                            <input type="hidden" name="currency_code" value="USD" />
                                            <input type="hidden" name="return" value=" " />
                                            <input type="hidden" name="cancel_return" value=" " />
                                            <input type="submit" name="submit" value="Add to cart" class="button" />
                                        </fieldset>
                                    </form>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <!-- //third section (oils) -->
                <!-- fourth section (noodles) -->
                <div class="product-sec1">
                    <h3 class="heading-tittle">Pasta & Noodles</h3>
                    <div class="col-md-4 product-men">
                        <div class="men-pro-item simpleCart_shelfItem">
                            <div class="men-thumb-item">
                                <img src="images/mk7.jpg" alt="">
                                <div class="men-cart-pro">
                                    <div class="inner-men-cart-pro">
                                        <a href="single.html" class="link-product-add-cart">Quick View</a>
                                    </div>
                                </div>
                            </div>
                            <div class="item-info-product ">
                                <h4>
                                    <a href="single.html">Yippee Noodles, 65g</a>
                                </h4>
                                <div class="info-product-price">
                                    <span class="item_price">$15.00</span>
                                    <del>$25.00</del>
                                </div>
                                <div class="snipcart-details top_brand_home_details item_add single-item hvr-outline-out">
                                    <form action="#" method="post">
                                        <fieldset>
                                            <input type="hidden" name="cmd" value="_cart" />
                                            <input type="hidden" name="add" value="1" />
                                            <input type="hidden" name="business" value=" " />
                                            <input type="hidden" name="item_name" value="YiPPee Noodles, 65g" />
                                            <input type="hidden" name="amount" value="15.00" />
                                            <input type="hidden" name="discount_amount" value="1.00" />
                                            <input type="hidden" name="currency_code" value="USD" />
                                            <input type="hidden" name="return" value=" " />
                                            <input type="hidden" name="cancel_return" value=" " />
                                            <input type="submit" name="submit" value="Add to cart" class="button" />
                                        </fieldset>
                                    </form>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 product-men">
                        <div class="men-pro-item simpleCart_shelfItem">
                            <div class="men-thumb-item">
                                <img src="images/mk8.jpg" alt="">
                                <div class="men-cart-pro">
                                    <div class="inner-men-cart-pro">
                                        <a href="single.html" class="link-product-add-cart">Quick View</a>
                                    </div>
                                </div>
                                <span class="product-new-top">New</span>

                            </div>
                            <div class="item-info-product ">
                                <h4>
                                    <a href="single.html">Wheat Pasta, 500g</a>
                                </h4>
                                <div class="info-product-price">
                                    <span class="item_price">$98.00</span>
                                    <del>$120.00</del>
                                </div>
                                <div class="snipcart-details top_brand_home_details item_add single-item hvr-outline-out">
                                    <form action="#" method="post">
                                        <fieldset>
                                            <input type="hidden" name="cmd" value="_cart" />
                                            <input type="hidden" name="add" value="1" />
                                            <input type="hidden" name="business" value=" " />
                                            <input type="hidden" name="item_name" value="Wheat Pasta, 500g" />
                                            <input type="hidden" name="amount" value="98.00" />
                                            <input type="hidden" name="discount_amount" value="1.00" />
                                            <input type="hidden" name="currency_code" value="USD" />
                                            <input type="hidden" name="return" value=" " />
                                            <input type="hidden" name="cancel_return" value=" " />
                                            <input type="submit" name="submit" value="Add to cart" class="button" />
                                        </fieldset>
                                    </form>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 product-men">
                        <div class="men-pro-item simpleCart_shelfItem">
                            <div class="men-thumb-item">
                                <img src="images/mk9.jpg" alt="">
                                <div class="men-cart-pro">
                                    <div class="inner-men-cart-pro">
                                        <a href="single.html" class="link-product-add-cart">Quick View</a>
                                    </div>
                                </div>
                                <span class="product-new-top">New</span>

                            </div>
                            <div class="item-info-product ">
                                <h4>
                                    <a href="single.html">Chinese Noodles, 68g</a>
                                </h4>
                                <div class="info-product-price">
                                    <span class="item_price">$11.99</span>
                                    <del>$15.00</del>
                                </div>
                                <div class="snipcart-details top_brand_home_details item_add single-item hvr-outline-out">
                                    <form action="#" method="post">
                                        <fieldset>
                                            <input type="hidden" name="cmd" value="_cart" />
                                            <input type="hidden" name="add" value="1" />
                                            <input type="hidden" name="business" value=" " />
                                            <input type="hidden" name="item_name" value="Chinese Noodles, 68g" />
                                            <input type="hidden" name="amount" value="11.99" />
                                            <input type="hidden" name="discount_amount" value="1.00" />
                                            <input type="hidden" name="currency_code" value="USD" />
                                            <input type="hidden" name="return" value=" " />
                                            <input type="hidden" name="cancel_return" value=" " />
                                            <input type="submit" name="submit" value="Add to cart" class="button" />
                                        </fieldset>
                                    </form>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <!-- //fourth section (noodles) -->
            </div>
        </div>
        <!-- //product right -->
    </div>
</div>
<!-- //展示商品结束 -->
<!-- special offers -->
<div class="featured-section" id="projects">
    <div class="container">
        <!-- tittle heading -->
        <h3 class="tittle-w3l">Special Offers
            <span class="heading-style">
					<i></i>
					<i></i>
					<i></i>
				</span>
        </h3>
        <!-- //tittle heading -->
        <div class="content-bottom-in">
            <ul id="flexiselDemo1">
                <li>
                    <div class="w3l-specilamk">
                        <div class="speioffer-agile">
                            <a href="single.html">
                                <img src="images/s1.jpg" alt="">
                            </a>
                        </div>
                        <div class="product-name-w3l">
                            <h4>
                                <a href="single.html">Aashirvaad, 5g</a>
                            </h4>
                            <div class="w3l-pricehkj">
                                <h6>$220.00</h6>
                                <p>Save $40.00</p>
                            </div>
                            <div class="snipcart-details top_brand_home_details item_add single-item hvr-outline-out">
                                <form action="#" method="post">
                                    <fieldset>
                                        <input type="hidden" name="cmd" value="_cart" />
                                        <input type="hidden" name="add" value="1" />
                                        <input type="hidden" name="business" value=" " />
                                        <input type="hidden" name="item_name" value="Aashirvaad, 5g" />
                                        <input type="hidden" name="amount" value="220.00" />
                                        <input type="hidden" name="discount_amount" value="1.00" />
                                        <input type="hidden" name="currency_code" value="USD" />
                                        <input type="hidden" name="return" value=" " />
                                        <input type="hidden" name="cancel_return" value=" " />
                                        <input type="submit" name="submit" value="Add to cart" class="button" />
                                    </fieldset>
                                </form>
                            </div>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="w3l-specilamk">
                        <div class="speioffer-agile">
                            <a href="single.html">
                                <img src="images/s4.jpg" alt="">
                            </a>
                        </div>
                        <div class="product-name-w3l">
                            <h4>
                                <a href="single.html">Kissan Tomato Ketchup, 950g</a>
                            </h4>
                            <div class="w3l-pricehkj">
                                <h6>$99.00</h6>
                                <p>Save $20.00</p>
                            </div>
                            <div class="snipcart-details top_brand_home_details item_add single-item hvr-outline-out">
                                <form action="#" method="post">
                                    <fieldset>
                                        <input type="hidden" name="cmd" value="_cart" />
                                        <input type="hidden" name="add" value="1" />
                                        <input type="hidden" name="business" value=" " />
                                        <input type="hidden" name="item_name" value="Kissan Tomato Ketchup, 950g" />
                                        <input type="hidden" name="amount" value="99.00" />
                                        <input type="hidden" name="discount_amount" value="1.00" />
                                        <input type="hidden" name="currency_code" value="USD" />
                                        <input type="hidden" name="return" value=" " />
                                        <input type="hidden" name="cancel_return" value=" " />
                                        <input type="submit" name="submit" value="Add to cart" class="button" />
                                    </fieldset>
                                </form>
                            </div>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="w3l-specilamk">
                        <div class="speioffer-agile">
                            <a href="single.html">
                                <img src="images/s2.jpg" alt="">
                            </a>
                        </div>
                        <div class="product-name-w3l">
                            <h4>
                                <a href="single.html">Madhur Pure Sugar, 1g</a>
                            </h4>
                            <div class="w3l-pricehkj">
                                <h6>$69.00</h6>
                                <p>Save $20.00</p>
                            </div>
                            <div class="snipcart-details top_brand_home_details item_add single-item hvr-outline-out">
                                <form action="#" method="post">
                                    <fieldset>
                                        <input type="hidden" name="cmd" value="_cart" />
                                        <input type="hidden" name="add" value="1" />
                                        <input type="hidden" name="business" value=" " />
                                        <input type="hidden" name="item_name" value="Madhur Pure Sugar, 1g" />
                                        <input type="hidden" name="amount" value="69.00" />
                                        <input type="hidden" name="discount_amount" value="1.00" />
                                        <input type="hidden" name="currency_code" value="USD" />
                                        <input type="hidden" name="return" value=" " />
                                        <input type="hidden" name="cancel_return" value=" " />
                                        <input type="submit" name="submit" value="Add to cart" class="button" />
                                    </fieldset>
                                </form>
                            </div>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="w3l-specilamk">
                        <div class="speioffer-agile">
                            <a href="single2.html">
                                <img src="images/s3.jpg" alt="">
                            </a>
                        </div>
                        <div class="product-name-w3l">
                            <h4>
                                <a href="single2.html">Surf Excel Liquid, 1.02L</a>
                            </h4>
                            <div class="w3l-pricehkj">
                                <h6>$187.00</h6>
                                <p>Save $30.00</p>
                            </div>
                            <div class="snipcart-details top_brand_home_details item_add single-item hvr-outline-out">
                                <form action="#" method="post">
                                    <fieldset>
                                        <input type="hidden" name="cmd" value="_cart" />
                                        <input type="hidden" name="add" value="1" />
                                        <input type="hidden" name="business" value=" " />
                                        <input type="hidden" name="item_name" value="Surf Excel Liquid, 1.02L" />
                                        <input type="hidden" name="amount" value="187.00" />
                                        <input type="hidden" name="discount_amount" value="1.00" />
                                        <input type="hidden" name="currency_code" value="USD" />
                                        <input type="hidden" name="return" value=" " />
                                        <input type="hidden" name="cancel_return" value=" " />
                                        <input type="submit" name="submit" value="Add to cart" class="button" />
                                    </fieldset>
                                </form>
                            </div>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="w3l-specilamk">
                        <div class="speioffer-agile">
                            <a href="single.html">
                                <img src="images/s8.jpg" alt="">
                            </a>
                        </div>
                        <div class="product-name-w3l">
                            <h4>
                                <a href="single.html">Cadbury Choclairs, 655.5g</a>
                            </h4>
                            <div class="w3l-pricehkj">
                                <h6>$160.00</h6>
                                <p>Save $60.00</p>
                            </div>
                            <div class="snipcart-details top_brand_home_details item_add single-item hvr-outline-out">
                                <form action="#" method="post">
                                    <fieldset>
                                        <input type="hidden" name="cmd" value="_cart" />
                                        <input type="hidden" name="add" value="1" />
                                        <input type="hidden" name="business" value=" " />
                                        <input type="hidden" name="item_name" value="Cadbury Choclairs, 655.5g" />
                                        <input type="hidden" name="amount" value="160.00" />
                                        <input type="hidden" name="discount_amount" value="1.00" />
                                        <input type="hidden" name="currency_code" value="USD" />
                                        <input type="hidden" name="return" value=" " />
                                        <input type="hidden" name="cancel_return" value=" " />
                                        <input type="submit" name="submit" value="Add to cart" class="button" />
                                    </fieldset>
                                </form>
                            </div>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="w3l-specilamk">
                        <div class="speioffer-agile">
                            <a href="single2.html">
                                <img src="images/s6.jpg" alt="">
                            </a>
                        </div>
                        <div class="product-name-w3l">
                            <h4>
                                <a href="single2.html">Fair & Lovely, 80 g</a>
                            </h4>
                            <div class="w3l-pricehkj">
                                <h6>$121.60</h6>
                                <p>Save $30.00</p>
                            </div>
                            <div class="snipcart-details top_brand_home_details item_add single-item hvr-outline-out">
                                <form action="#" method="post">
                                    <fieldset>
                                        <input type="hidden" name="cmd" value="_cart" />
                                        <input type="hidden" name="add" value="1" />
                                        <input type="hidden" name="business" value=" " />
                                        <input type="hidden" name="item_name" value="Fair & Lovely, 80 g" />
                                        <input type="hidden" name="amount" value="121.60" />
                                        <input type="hidden" name="discount_amount" value="1.00" />
                                        <input type="hidden" name="currency_code" value="USD" />
                                        <input type="hidden" name="return" value=" " />
                                        <input type="hidden" name="cancel_return" value=" " />
                                        <input type="submit" name="submit" value="Add to cart" class="button" />
                                    </fieldset>
                                </form>
                            </div>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="w3l-specilamk">
                        <div class="speioffer-agile">
                            <a href="single.html">
                                <img src="images/s5.jpg" alt="">
                            </a>
                        </div>
                        <div class="product-name-w3l">
                            <h4>
                                <a href="single.html">Sprite, 2.25L (Pack of 2)</a>
                            </h4>
                            <div class="w3l-pricehkj">
                                <h6>$180.00</h6>
                                <p>Save $30.00</p>
                            </div>
                            <div class="snipcart-details top_brand_home_details item_add single-item hvr-outline-out">
                                <form action="#" method="post">
                                    <fieldset>
                                        <input type="hidden" name="cmd" value="_cart" />
                                        <input type="hidden" name="add" value="1" />
                                        <input type="hidden" name="business" value=" " />
                                        <input type="hidden" name="item_name" value="Sprite, 2.25L (Pack of 2)" />
                                        <input type="hidden" name="amount" value="180.00" />
                                        <input type="hidden" name="discount_amount" value="1.00" />
                                        <input type="hidden" name="currency_code" value="USD" />
                                        <input type="hidden" name="return" value=" " />
                                        <input type="hidden" name="cancel_return" value=" " />
                                        <input type="submit" name="submit" value="Add to cart" class="button" />
                                    </fieldset>
                                </form>
                            </div>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="w3l-specilamk">
                        <div class="speioffer-agile">
                            <a href="single2.html">
                                <img src="images/s9.jpg" alt="">
                            </a>
                        </div>
                        <div class="product-name-w3l">
                            <h4>
                                <a href="single2.html">Lakme Eyeconic Kajal, 0.35 g</a>
                            </h4>
                            <div class="w3l-pricehkj">
                                <h6>$153.00</h6>
                                <p>Save $40.00</p>
                            </div>
                            <div class="snipcart-details top_brand_home_details item_add single-item hvr-outline-out">
                                <form action="#" method="post">
                                    <fieldset>
                                        <input type="hidden" name="cmd" value="_cart" />
                                        <input type="hidden" name="add" value="1" />
                                        <input type="hidden" name="business" value=" " />
                                        <input type="hidden" name="item_name" value="Lakme Eyeconic Kajal, 0.35 g" />
                                        <input type="hidden" name="amount" value="153.00" />
                                        <input type="hidden" name="discount_amount" value="1.00" />
                                        <input type="hidden" name="currency_code" value="USD" />
                                        <input type="hidden" name="return" value=" " />
                                        <input type="hidden" name="cancel_return" value=" " />
                                        <input type="submit" name="submit" value="Add to cart" class="button" />
                                    </fieldset>
                                </form>
                            </div>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</div>
<!-- //special offers -->
<!-- newsletter -->
<div class="footer-top">
    <div class="container-fluid">
        <div class="col-xs-8 agile-leftmk">
            <h2>Get your Groceries delivered from local stores</h2>
            <p>Free Delivery on your first order!</p>
            <form action="#" method="post">
                <input type="email" placeholder="E-mail" name="email" required="">
                <input type="submit" value="Subscribe">
            </form>
            <div class="newsform-w3l">
                <span class="fa fa-envelope-o" aria-hidden="true"></span>
            </div>
        </div>
        <div class="col-xs-4 w3l-rightmk">
            <img src="images/tab3.png" alt=" ">
        </div>
        <div class="clearfix"></div>
    </div>
</div>
<!-- //newsletter -->
<!-- footer -->
<footer>
    <div class="container">
        <!-- footer first section -->
        <p class="footer-main">
            <span>"Grocery Shoppy"</span> Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur
            magni dolores eos qui ratione voluptatem sequi nesciunt.Sed ut perspiciatis unde omnis iste natus error sit voluptatem
            accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto
            beatae vitae dicta sunt explicabo.</p>
        <!-- //footer first section -->
        <!-- footer second section -->
        <div class="w3l-grids-footer">
            <div class="col-xs-4 offer-footer">
                <div class="col-xs-4 icon-fot">
                    <span class="fa fa-map-marker" aria-hidden="true"></span>
                </div>
                <div class="col-xs-8 text-form-footer">
                    <h3>Track Your Order</h3>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="col-xs-4 offer-footer">
                <div class="col-xs-4 icon-fot">
                    <span class="fa fa-refresh" aria-hidden="true"></span>
                </div>
                <div class="col-xs-8 text-form-footer">
                    <h3>Free & Easy Returns</h3>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="col-xs-4 offer-footer">
                <div class="col-xs-4 icon-fot">
                    <span class="fa fa-times" aria-hidden="true"></span>
                </div>
                <div class="col-xs-8 text-form-footer">
                    <h3>Online cancellation </h3>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="clearfix"></div>
        </div>
        <!-- //footer second section -->
        <!-- footer third section -->
        <div class="footer-info w3-agileits-info">
            <!-- footer categories -->
            <div class="col-sm-5 address-right">
                <div class="col-xs-6 footer-grids">
                    <h3>Categories</h3>
                    <ul>
                        <li>
                            <a href="product.html">Grocery</a>
                        </li>
                        <li>
                            <a href="product.html">Fruits</a>
                        </li>
                        <li>
                            <a href="product.html">Soft Drinks</a>
                        </li>
                        <li>
                            <a href="product2.html">Dishwashers</a>
                        </li>
                        <li>
                            <a href="product.html">Biscuits & Cookies</a>
                        </li>
                        <li>
                            <a href="product2.html">Baby Diapers</a>
                        </li>
                    </ul>
                </div>
                <div class="col-xs-6 footer-grids agile-secomk">
                    <ul>
                        <li>
                            <a href="product.html">Snacks & Beverages</a>
                        </li>
                        <li>
                            <a href="product.html">Bread & Bakery</a>
                        </li>
                        <li>
                            <a href="product.html">Sweets</a>
                        </li>
                        <li>
                            <a href="product.html">Chocolates & Biscuits</a>
                        </li>
                        <li>
                            <a href="product2.html">Personal Care</a>
                        </li>
                        <li>
                            <a href="product.html">Dried Fruits & Nuts</a>
                        </li>
                    </ul>
                </div>
                <div class="clearfix"></div>
            </div>
            <!-- //footer categories -->
            <!-- quick links -->
            <div class="col-sm-5 address-right">
                <div class="col-xs-6 footer-grids">
                    <h3>Quick Links</h3>
                    <ul>
                        <li>
                            <a href="about.html">About Us</a>
                        </li>
                        <li>
                            <a href="contact.html">Contact Us</a>
                        </li>
                        <li>
                            <a href="help.html">Help</a>
                        </li>
                        <li>
                            <a href="faqs.html">Faqs</a>
                        </li>
                        <li>
                            <a href="terms.html">Terms of use</a>
                        </li>
                        <li>
                            <a href="privacy.html">Privacy Policy</a>
                        </li>
                    </ul>
                </div>
                <div class="col-xs-6 footer-grids">
                    <h3>Get in Touch</h3>
                    <ul>
                        <li>
                            <i class="fa fa-map-marker"></i> 123 Sebastian, USA.</li>
                        <li>
                            <i class="fa fa-mobile"></i> 333 222 3333 </li>
                        <li>
                            <i class="fa fa-phone"></i> +222 11 4444 </li>
                        <li>
                            <i class="fa fa-envelope-o"></i>
                            <a href="mailto:example@mail.com"> mail@example.com</a>
                        </li>
                    </ul>
                </div>
            </div>
            <!-- //quick links -->
            <!-- social icons -->
            <div class="col-sm-2 footer-grids  w3l-socialmk">
                <h3>Follow Us on</h3>
                <div class="social">
                    <ul>
                        <li>
                            <a class="icon fb" href="#">
                                <i class="fa fa-facebook"></i>
                            </a>
                        </li>
                        <li>
                            <a class="icon tw" href="#">
                                <i class="fa fa-twitter"></i>
                            </a>
                        </li>
                        <li>
                            <a class="icon gp" href="#">
                                <i class="fa fa-google-plus"></i>
                            </a>
                        </li>
                    </ul>
                </div>
                <div class="agileits_app-devices">
                    <h5>Download the App</h5>
                    <a href="#">
                        <img src="images/1.png" alt="">
                    </a>
                    <a href="#">
                        <img src="images/2.png" alt="">
                    </a>
                    <div class="clearfix"> </div>
                </div>
            </div>
            <!-- //social icons -->
            <div class="clearfix"></div>
        </div>
        <!-- //footer third section -->
        <!-- footer fourth section (text) -->
        <div class="agile-sometext">
            <div class="sub-some">
                <h5>Online Grocery Shopping</h5>
                <p>Order online. All your favourite products from the low price online supermarket for grocery home delivery in Delhi,
                    Gurgaon, Bengaluru, Mumbai and other cities in India. Lowest prices guaranteed on Patanjali, Aashirvaad, Pampers, Maggi,
                    Saffola, Huggies, Fortune, Nestle, Amul, MamyPoko Pants, Surf Excel, Ariel, Vim, Haldiram's and others.</p>
            </div>
            <div class="sub-some">
                <h5>Shop online with the best deals & offers</h5>
                <p>Now Get Upto 40% Off On Everyday Essential Products Shown On The Offer Page. The range includes Grocery, Personal Care,
                    Baby Care, Pet Supplies, Healthcare and Other Daily Need Products. Discount May Vary From Product To Product.</p>
            </div>
            <!-- brands -->
            <div class="sub-some">
                <h5>Popular Brands</h5>
                <ul>
                    <li>
                        <a href="product.html">Aashirvaad</a>
                    </li>
                    <li>
                        <a href="product.html">Amul</a>
                    </li>
                    <li>
                        <a href="product.html">Bingo</a>
                    </li>
                    <li>
                        <a href="product.html">Boost</a>
                    </li>
                    <li>
                        <a href="product.html">Durex</a>
                    </li>
                    <li>
                        <a href="product.html"> Maggi</a>
                    </li>
                    <li>
                        <a href="product.html">Glucon-D</a>
                    </li>
                    <li>
                        <a href="product.html">Horlicks</a>
                    </li>
                    <li>
                        <a href="product2.html">Head & Shoulders</a>
                    </li>
                    <li>
                        <a href="product2.html">Dove</a>
                    </li>
                    <li>
                        <a href="product2.html">Dettol</a>
                    </li>
                    <li>
                        <a href="product2.html">Dabur</a>
                    </li>
                    <li>
                        <a href="product2.html">Colgate</a>
                    </li>
                    <li>
                        <a href="product.html">Coca-Cola</a>
                    </li>
                    <li>
                        <a href="product2.html">Closeup</a>
                    </li>
                    <li>
                        <a href="product2.html"> Cinthol</a>
                    </li>
                    <li>
                        <a href="product.html">Cadbury</a>
                    </li>
                    <li>
                        <a href="product.html">Bru</a>
                    </li>
                    <li>
                        <a href="product.html">Bournvita</a>
                    </li>
                    <li>
                        <a href="product.html">Tang</a>
                    </li>
                    <li>
                        <a href="product.html">Pears</a>
                    </li>
                    <li>
                        <a href="product.html">Oreo</a>
                    </li>
                    <li>
                        <a href="product.html"> Taj Mahal</a>
                    </li>
                    <li>
                        <a href="product.html">Sprite</a>
                    </li>
                    <li>
                        <a href="product.html">Thums Up</a>
                    </li>
                    <li>
                        <a href="product2.html">Fair & Lovely</a>
                    </li>
                    <li>
                        <a href="product2.html">Lakme</a>
                    </li>
                    <li>
                        <a href="product.html">Tata</a>
                    </li>
                    <li>
                        <a href="product2.html">Sunfeast</a>
                    </li>
                    <li>
                        <a href="product2.html">Sunsilk</a>
                    </li>
                    <li>
                        <a href="product.html">Patanjali</a>
                    </li>
                    <li>
                        <a href="product.html">MTR</a>
                    </li>
                    <li>
                        <a href="product.html">Kissan</a>
                    </li>
                    <li>
                        <a href="product2.html"> Lipton</a>
                    </li>
                </ul>
            </div>
            <!-- //brands -->
            <!-- payment -->
            <div class="sub-some child-momu">
                <h5>Payment Method</h5>
                <ul>
                    <li>
                        <img src="images/pay2.png" alt="">
                    </li>
                    <li>
                        <img src="images/pay5.png" alt="">
                    </li>
                    <li>
                        <img src="images/pay1.png" alt="">
                    </li>
                    <li>
                        <img src="images/pay4.png" alt="">
                    </li>
                    <li>
                        <img src="images/pay6.png" alt="">
                    </li>
                    <li>
                        <img src="images/pay3.png" alt="">
                    </li>
                    <li>
                        <img src="images/pay7.png" alt="">
                    </li>
                    <li>
                        <img src="images/pay8.png" alt="">
                    </li>
                    <li>
                        <img src="images/pay9.png" alt="">
                    </li>
                </ul>
            </div>
            <!-- //payment -->
        </div>
        <!-- //footer fourth section (text) -->
    </div>
</footer>
<!-- //footer -->
<!-- copyright -->
<div class="copy-right">
    <div class="container">
        <p>Copyright &copy; 2018.Company name All rights reserved.More Templates</p>
    </div>
</div>
<!-- //copyright -->

<!-- js-files -->
<!-- jquery -->
<script src="js/jquery-2.1.4.min.js"></script>
<!-- //jquery -->

<!-- 弹出登录注册框-->
<script src="js/jquery.magnific-popup.js"></script>
<script>
    $(document).ready(function () {
        $('.popup-with-zoom-anim').magnificPopup({
            type: 'inline',
            fixedContentPos: false,
            fixedBgPos: true,
            overflowY: 'auto',
            closeBtnInside: true,
            preloader: false,
            midClick: true,
            removalDelay: 300,
            mainClass: 'my-mfp-zoom-in'
        });

    });
</script>
<!-- Large modal -->
<!-- <script>
    $('#').modal('show');
</script> -->
<!-- //弹出控制结束-->

<!-- 购物车 -->
<script src="js/minicart.js"></script>
<script>
    paypalm.minicartk.render(); //use only unique class names other than paypalm.minicartk.Also Replace same class name in css and minicart.min.js

    paypalm.minicartk.cart.on('checkout', function (evt) {
        var items = this.items(),
            len = items.length,
            total = 0,
            i;

        // Count the number of each item in the cart
        for (i = 0; i < len; i++) {
            total += items[i].get('quantity');
        }

        if (total < 3) {
            alert('The minimum order quantity is 3. Please add more to your shopping cart before checking out');
            evt.preventDefault();
        }
    });
</script>
<!-- //购物车结束-->

<!-- price range (top products) -->
<script src="js/jquery-ui.js"></script>
<script>
    //<![CDATA[
    $(window).load(function () {
        $("#slider-range").slider({
            range: true,
            min: 0,
            max: 9000,
            values: [50, 6000],
            slide: function (event, ui) {
                $("#amount").val("$" + ui.values[0] + " - $" + ui.values[1]);
            }
        });
        $("#amount").val("$" + $("#slider-range").slider("values", 0) + " - $" + $("#slider-range").slider("values", 1));

    }); //]]>
</script>
<!-- //price range (top products) -->

<!-- flexisel (for special offers) -->
<script src="js/jquery.flexisel.js"></script>
<script>
    $(window).load(function () {
        $("#flexiselDemo1").flexisel({
            visibleItems: 3,
            animationSpeed: 1000,
            autoPlay: true,
            autoPlaySpeed: 3000,
            pauseOnHover: true,
            enableResponsiveBreakpoints: true,
            responsiveBreakpoints: {
                portrait: {
                    changePoint: 480,
                    visibleItems: 1
                },
                landscape: {
                    changePoint: 640,
                    visibleItems: 2
                },
                tablet: {
                    changePoint: 768,
                    visibleItems: 2
                }
            }
        });

    });
</script>
<!-- //flexisel (for special offers) -->

<!-- 输入密码相同检测 -->
<script>
    window.onload = function () {
        document.getElementById("password1").onchange = validatePassword;
        document.getElementById("password2").onchange = validatePassword;
    }

    function validatePassword() {
        var pass2 = document.getElementById("password2").value;
        var pass1 = document.getElementById("password1").value;
        if (pass1 != pass2)
            document.getElementById("password2").setCustomValidity("输入密码不匹配");
        else
            document.getElementById("password2").setCustomValidity('');
    }
</script>
<!-- //检测结束 -->

<!-- smoothscroll -->
<script src="js/SmoothScroll.min.js"></script>
<!-- //smoothscroll -->

<!-- start-smooth-scrolling -->
<script src="js/move-top.js"></script>
<script src="js/easing.js"></script>
<script>
    jQuery(document).ready(function ($) {
        $(".scroll").click(function (event) {
            event.preventDefault();

            $('html,body').animate({
                scrollTop: $(this.hash).offset().top
            }, 1000);
        });
    });
</script>
<!-- //end-smooth-scrolling -->

<!-- smooth-scrolling-of-move-up -->
<script>
    $(document).ready(function () {
        /*
        var defaults = {
            containerID: 'toTop', // fading element id
            containerHoverID: 'toTopHover', // fading element hover id
            scrollSpeed: 1200,
            easingType: 'linear'
        };
        */
        $().UItoTop({
            easingType: 'easeOutQuart'
        });

    });
</script>
<!-- //smooth-scrolling-of-move-up -->

<!-- for bootstrap working -->
<script src="js/bootstrap.js"></script>
<!-- //for bootstrap working -->
<!-- //js-files -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.9/dist/js/bootstrap-select.min.js"></script>

</body>

</html>