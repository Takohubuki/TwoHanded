<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Tako
  Date: 2019/6/30
  Time: 20:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>商品列表</title>
    <!--/tags -->
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
    <!--//tags -->
    <link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css" media="all" />
    <link href="${pageContext.request.contextPath}/css/font-awesome.css" rel="stylesheet">
    <!--pop-up-box-->
    <link href="${pageContext.request.contextPath}/css/popuo-box.css" rel="stylesheet" type="text/css" media="all" />
    <!--//pop-up-box-->
    <!-- price range -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery-ui1.css">
    <!-- flexslider -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/flexslider.css" type="text/css" media="screen" />
    <!-- fonts -->
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800" rel="stylesheet">
</head>
<body>
<div class="header-most-top">
    <p>哈学院官方唯一指定二手交易平台</p>
</div>
<!-- //top-header -->
<!-- header-bot-->
<div class="header-bot">
    <div class="header-bot_inner_wthreeinfo_header_mid">
        <!-- header-bot-->
        <div class="col-md-4 logo_agile">
            <h1>
                <a href="${pageContext.request.contextPath}/index/backindex">
                    <span>H</span>RBU
                    <span>S</span>econdHand
                    <span>P</span>latform
                    <img src="${pageContext.request.contextPath}/images/logo2.png" alt=" ">
                </a>
            </h1>
        </div>
        <!-- header-bot -->
        <div class="col-md-8 header">
            <!-- header lists -->
            <ul>
                <li class="navbar-right">
                    <a href="${pageContext.request.contextPath}/items/publish" data-toggle="modal">
                        <span class="fa fa-pencil-square-o" aria-hidden="true"></span> 发 布</a>
                </li>
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
                        你好！<a href="${pageContext.request.contextPath}/user/profile" >
                        <img src="${pageContext.request.contextPath}/images/avatar/${member.avatar}" class="img-circle" style="width: 20px;height: 20px">
                            ${member.username}
                    </a>
                    </li>

                </c:if>
            </ul>
            <!-- //header lists -->
            <!--站内搜索模块 -->
            <div class="agileits_search">
                <form action="${pageContext.request.contextPath}/items/searchbyname" method="post">
                    <input name="search" type="search" placeholder="想搜点什么？" required="">
                    <button type="submit" class="btn btn-default" aria-label="Left Align">
                        <span class="fa fa-search" aria-hidden="true"> </span>
                    </button>
                </form>
            </div>
            <!-- //搜索结束 -->
            <!-- 购物车模块 -->
            <div class="top_nav_right">
                <div class="wthreecartaits wthreecartaits2 cart cart box_1">
                    <form action="${pageContext.request.contextPath}/order/mycart" method="post" class="last">
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
                    <form action="${pageContext.request.contextPath}/user/login" method="post">
                        <div class="styled-input agile-styled-input-top">
                            <input type="text" placeholder="User Name" name="username" required="">
                        </div>
                        <div class="styled-input">
                            <input type="password" placeholder="Password" name="password" required="">
                        </div>
                        <input type="submit" value="登录">
                        <a href="${pageContext.request.contextPath}/user/forgetPWD">忘记密码</a>
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
                            <input type="text" placeholder="电子邮箱" name="email" required="">
                        </div>
                        <div class="styled-input">
                            <input type="text" placeholder="联系电话" name="phone" required="">
                        </div>
                        <div class="styled-input">
                            <input type="password" placeholder="密码" name="password" id="password1" required="">
                        </div>
                        <div class="styled-input">
                            <input type="password" placeholder="再次输入密码" name="Confirm Password" id="password2"
                                   required="">
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
<!-- //header-bot -->
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
                            <li>
                                <a class="nav-stylehead" href="${pageContext.request.contextPath}/index/backindex">主页
                                    <span class="sr-only">(current)</span>
                                </a>
                            </li>
                            <c:forEach items="${kindList}" var="kindList">
                                <li class="">
                                    <a class="nav-stylehead" href="${pageContext.request.contextPath}/items/searchbykind?kind=${kindList}">
                                            ${kindList}
                                    </a>
                                </li>
                            </c:forEach>

                        </ul>
                    </div>
                </div>
            </nav>
        </div>
    </div>
</div>
<!-- //导航栏结束 -->

<!-- page -->
<div class="services-breadcrumb">
    <div class="agile_inner_breadcrumb">
        <div class="container">
            <ul class="w3_short">
                <li>
                    <a href="${pageContext.request.contextPath}/index/backindex">主页</a>
                    <i>|</i>
                </li>
                <li>商品列表</li>
            </ul>
        </div>
    </div>
</div>
<!-- //page -->
<!-- Single Page -->
<div class="banner-bootom-w3-agileits">
    <div class="container">
        <!-- tittle heading -->
        <h3 class="tittle-w3l">商品列表
            <span class="heading-style">
					<i></i>
					<i></i>
					<i></i>
				</span>
        </h3>
        <!-- //tittle heading -->
        <div id="paging">
            <div class="center-block row">
                <c:forEach var="itemlist" items="${itemPageInfo.list}">
                    <div class="col-md-4 product-men">
                        <div class="men-pro-item simpleCart_shelfItem">
                            <div class="men-thumb-item">
                                <img src="${pageContext.request.contextPath}/${itemlist.image}" alt="" style="width: 159px;height: 150px">
                                <div class="men-cart-pro">
                                    <div class="inner-men-cart-pro">
                                        <a href="${pageContext.request.contextPath}/items/singleitem?itemId=${itemlist.serialNum}" class="link-product-add-cart">详情</a>
                                    </div>
                                </div>
                            </div>
                            <div class="item-info-product ">
                                <h4>
                                    <a href="${pageContext.request.contextPath}/items/singleitem?itemId=${itemlist.serialNum}">${itemlist.name}</a>
                                </h4>
                                <div class="info-product-price">
                                    <span class="item_price">￥${itemlist.price}</span>

                                </div>
                                <div class="snipcart-details top_brand_home_details item_add single-item hvr-outline-out">
                                        <%--                                    <form action="#" method="post">--%>
                                    <fieldset>
                                        <input type="hidden" name="itemId" value="${itemlist.serialNum}"/>
                                        <input type="hidden" name="itemName" value="${itemlist.name}"/>
                                        <input type="hidden" name="publisher" value="${itemlist.publisher}"/>
                                        <c:if test="${itemlist.conditions == '出售'}">
                                            <input type="submit" name="addcart" class="button" value="添加到购物车"/>
                                        </c:if>

                                    </fieldset>
                                        <%--                                    </form>--%>
                                </div>

                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <div class="row center-block">
                <ul class="pagination">
                    <c:if test="${!itemPageInfo.isFirstPage}">
                        <li><a href="javascript:queryDeviceRecords(${itemPageInfo.navigateFirstPage});">首页</a></li>
                        <li><a href="javascript:queryDeviceRecords(${itemPageInfo.prePage});">上一页</a></li>
                    </c:if>
                    <c:forEach items="${itemPageInfo.navigatepageNums}" var="navigatepageNum">

                        <c:if test="${navigatepageNum==itemPageInfo.pageNum}">
                            <li class="active"><a href="javascript:queryAllDevices(${navigatepageNum});">${navigatepageNum}</a></li>
                        </c:if>
                        <c:if test="${navigatepageNum!=itemPageInfo.pageNum}">
                            <li><a href="javascript:queryDeviceRecords(${navigatepageNum});">${navigatepageNum}</a></li>
                        </c:if>
                    </c:forEach>
                    <c:if test="${!itemPageInfo.isLastPage}">
                        <li><a href="javascript:queryDeviceRecords(${itemPageInfo.nextPage});">下一页</a></li>
                        <li><a href="javascript:queryDeviceRecords(${itemPageInfo.navigateLastPage});">最后一页</a></li>
                    </c:if>
                </ul>
            </div>
        </div>
        <div class="clearfix"></div>
    </div>
</div>
<!-- //Single Page -->

<!-- js-files -->
<!-- jquery -->
<script src="${pageContext.request.contextPath}/js/jquery-2.1.4.min.js"></script>
<!-- //jquery -->

<!-- popup modal (for signin & signup)-->
<script src="${pageContext.request.contextPath}/js/jquery.magnific-popup.js"></script>
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

<!-- imagezoom -->
<script src="${pageContext.request.contextPath}/js/imagezoom.js"></script>
<!-- //imagezoom -->

<!-- FlexSlider -->
<script src="${pageContext.request.contextPath}/js/jquery.flexslider.js"></script>
<script>
    // Can also be used with $(document).ready()
    $(window).load(function () {
        $('.flexslider').flexslider({
            animation: "slide",
            controlNav: "thumbnails"
        });
    });
</script>
<!-- //FlexSlider-->

<!-- for bootstrap working -->
<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
<!-- //for bootstrap working -->
<script type="text/javascript">
    function queryDeviceRecords(pageNum) {
        $("#paging").load("${pageContext.request.contextPath}/items/itempage?pageNum=" + pageNum);
    }
</script>

<script src="${pageContext.request.contextPath}/js/common.js"></script>

<script>
    let member = "<%=session.getAttribute("member")%>";
    console.log(member);
</script>
<script src="${pageContext.request.contextPath}/js/cart.js"></script>

<!-- //js-files -->

</body>

</html>
