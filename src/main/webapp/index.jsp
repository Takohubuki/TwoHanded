<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sercurity" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" isELIgnored="false"%>

<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>HRBU二手交易</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="keywords" content=""/>
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="css/font-awesome.css" rel="stylesheet">
    <link href="css/popuo-box.css" rel="stylesheet" type="text/css" media="all"/>
    <link rel="stylesheet" type="text/css" href="css/jquery-ui1.css">
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800"
          rel="stylesheet">
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
                <li class="navbar-right">
                    <a href="${pageContext.request.contextPath}/items/publish" data-toggle="modal">
                        <span class="fa fa-pencil-square-o" aria-hidden="true"></span> 发 布 </a>
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
                        你好！<a href="${pageContext.request.contextPath}/user/profile">
                        <img src="${pageContext.request.contextPath}/images/avatar/${member.avatar}" class="img-circle"
                             style="width: 20px;height: 20px">
                            ${member.username}
                    </a>
                    </li>

                </c:if>
            </ul>
            <!--站内搜索模块 -->
            <div class="agileits_search">
                <form action="" method="get" id="searchForm">
                    <input name="searchName" type="search" placeholder="想搜点什么？" required="" id="searchBar">
                    <button type="button" class="btn btn-default" aria-label="Left Align" id="searchBtn">
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

                    <form action="${pageContext.request.contextPath}/user/signup" method="post" id="registerForm"
                          enctype="multipart/form-data">
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
                            <input type="text" placeholder="电子邮箱" name="email" required="" id="email">
                            <label class="control-label" for="email" id="emailError" style="font-size: small"></label>
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
                            <label class="control-label" for="password2" id="pwdValidate"
                                   style="font-size: small"></label>
                        </div>
                        <div class="styled-input">
                            <label class="control-label" for="identificationMaterial" id="">请上传学生证和本人同框的照片</label>
                            <input type="file" name="image" id="identificationMaterial"
                                   required="required">
                        </div>

                        <input type="button" class="btn btn-primary" value="注册" id="submitRegisterInfo">
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
                            <li>
                                <a class="nav-stylehead" href="${pageContext.request.contextPath}/index/backindex">主页
                                    <span class="sr-only">(current)</span>
                                </a>
                            </li>
                            <c:forEach items="${kindList}" var="kindList">
                                <li class="">
                                    <a class="nav-stylehead" href="${pageContext.request.contextPath}/items/searchbykind?kind=${kindList}&pageNum=1">
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


<!-- 轮播图模块 -->
<div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators-->
    <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1" class=""></li>
        <li data-target="#myCarousel" data-slide-to="2" class=""></li>
    </ol>
    <div class="carousel-inner" role="listbox">
        <div class="item active">
            <div class="container">
                <div class="carousel-caption">
                    <h3>今日
                        <span>精选</span>
                    </h3>
                    <p>
                        ${mostViewed.get(0).name}</p>
                    <a class="button2"
                       href="${pageContext.request.contextPath}/items/singleitem?itemId=${mostViewed.get(0).serialNum}">查看详情 </a>
                </div>
            </div>
        </div>
        <div class="item item2">
            <div class="container">
                <div class="carousel-caption">
                    <h3>大家
                        <span>都在看</span>
                    </h3>
                    <p>被点击
                        <span>${mostViewed.get(1).viewedTimes}</span> 次</p>
                    <a class="button2"
                       href="${pageContext.request.contextPath}/items/singleitem?itemId=${mostViewed.get(1).serialNum}">查看详情 </a>
                </div>
            </div>
        </div>
        <div class="item item3">
            <div class="container">
                <div class="carousel-caption">
                    <h3>热门
                        <span>商品</span>
                    </h3>
                    <p>${mostViewed.get(2).name}
                    </p>
                    <a class="button2"
                       href="${pageContext.request.contextPath}/items/singleitem?itemId=${mostViewed.get(2).serialNum}">查看详情 </a>
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
                    <div class="row center-block">
                        <a class="btn btn-primary pull-right" role="button" href="${pageContext.request.contextPath}/items/listwtsbytime?pageNum=1">更多</a>
                    </div>
                    <div class="row">
                        <c:forEach var="wts_item" items="${wts_item}">
                            <div class="col-md-4 product-men">
                                <div class="men-pro-item simpleCart_shelfItem">
                                    <div class="men-thumb-item">
                                        <img src="${wts_item.image}" alt="" style="width: 159px;height: 150px">
                                        <div class="men-cart-pro">
                                            <div class="inner-men-cart-pro">
                                                <a href="${pageContext.request.contextPath}/items/singleitem?itemId=${wts_item.serialNum}" class="link-product-add-cart">详情</a>
                                            </div>
                                        </div>
                                        <span class="product-new-top">New</span>
                                    </div>
                                    <div class="item-info-product ">
                                        <h4>
                                            <a href="${pageContext.request.contextPath}/items/singleitem">${wts_item.name}</a>
                                        </h4>
                                        <div class="info-product-price">
                                            <span class="item_price">￥${wts_item.price}</span>

                                        </div>
                                        <div class="snipcart-details top_brand_home_details item_add single-item hvr-outline-out">
                                            <fieldset>
                                                <input type="hidden" name="itemId" value="${wts_item.serialNum}"/>
                                                <input type="hidden" name="itemName" value="${wts_item.name}"/>
                                                <input type="hidden" name="publisher" value="${wts_item.publisher}"/>
                                                <input type="submit" name="addcart" class="button" value="添加到购物车"/>
                                            </fieldset>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>

                    <div class="clearfix"></div>
                </div>
                <!-- //first section (nuts) -->

                <!-- third section (oils) -->
                <div class="product-sec1">
                    <h3 class="heading-tittle">求购</h3>
                    <div class="row center-block">
                        <a class="btn btn-primary pull-right" role="button" href="${pageContext.request.contextPath}/items/listwtbbytime?pageNum=1">更多</a>
                    </div>
                    <c:forEach items="${wtb_item}" var="wtb_item">
                        <div class="col-md-4 product-men">
                            <div class="men-pro-item simpleCart_shelfItem">
                                <div class="men-thumb-item">
                                    <img src="${wtb_item.image}" alt="" style="width: 159px;height: 150px">
                                    <div class="men-cart-pro">
                                        <div class="inner-men-cart-pro">
                                            <a href="${pageContext.request.contextPath}/items/singleitem?itemId=${wtb_item.serialNum}"
                                               class="link-product-add-cart">详情</a>
                                        </div>
                                    </div>
                                    <span class="product-new-top">New</span>
                                </div>
                                <div class="item-info-product ">
                                    <h4>
                                        <a href="${pageContext.request.contextPath}/items/singleitem?itemId=${wtb_item.serialNum}">${wtb_item.name}</a>
                                    </h4>
                                    <div class="info-product-price">
                                        <span class="item_price">￥${wtb_item.price}</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>

                    <div class="clearfix"></div>
                </div>
                <!-- //third section (oils) -->

            </div>
        </div>
        <!-- //product right -->
    </div>
</div>
<!-- //展示商品结束 -->


<!-- js-files -->
<!-- jquery -->
<script src="js/jquery.js"></script>
<!-- //jquery -->

<!-- for bootstrap working -->
<script src="js/bootstrap.js"></script>
<!-- //for bootstrap working -->

<!-- 输入密码相同检测 -->
<script src="js/common.js"></script>
<!-- //检测结束 -->

<!-- //js-files -->
<script>
    let member_status = '';
    let message;
    let member;
    $(function () {
        member = '<%=session.getAttribute("member")%>';
        message = "<%=session.getAttribute("message")%>";
        if (message !== '' && message !== 'null') {
            alert(message);
            message = '';
            member_status = 'V';
        }


    })
    console.log(member);

</script>
<script src="js/cart.js"></script>

</body>

</html>