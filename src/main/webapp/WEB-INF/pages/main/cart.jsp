<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>购物车</title>
    <link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css" media="all" />
    <link href="${pageContext.request.contextPath}/css/font-awesome.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.9/dist/css/bootstrap-select.min.css">
    <link href="${pageContext.request.contextPath}/css/popuo-box.css" rel="stylesheet" type="text/css" media="all" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery-ui1.css">
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800" rel="stylesheet">
    <!-- jquery -->
    <script src="${pageContext.request.contextPath}/js/jquery-2.1.4.min.js"></script>
    <!-- //jquery -->
    <style>
        .shopping-car-container {
            padding: 50px 40px;
        }

        .shopping-car-container .car-headers-menu {
            border-bottom: 1px solid #f5f5f5;
            padding: 0 15px;
        }

        .shopping-car-container .panel-body {
            padding: 15px 0;
        }

        #checkAll {
            vertical-align: text-bottom;
        }

        .shopping-car-container .car-menu {
            text-align: center;
        }
        /*
         商品区
         * */

        .shopping-car-container .goods-content {
            margin-top: 15px;
        }

        .shopping-car-container .goods-content .goods-item {
            margin-top: 20px;
        }

        .shopping-car-container .goods-content .goods-item .car-goods-info {
            height: 150px;
            display: flex;
            align-items: center;
            justify-content: center;
            overflow: hidden;
        }

        .shopping-car-container .goods-content .goods-item .goods-image-column img,
        .shopping-car-container .goods-content .goods-item .goods-image-column span {
            display: block;
            float: left;
        }

        .shopping-car-container .goods-content .goods-item .goods-image-column span {
            width: calc(100% - 100px);
            box-sizing: border-box;
            text-indent: 2rem;
            line-height: 25px;
            padding: 10px;
        }

        .goods-price {
            color: red;
            font-weight: bolder;
        }

        .form-control {
            text-align: center;
        }

        .single-total {
            color: red;
            font-weight: bold;
        }

        .goods-params {
            color: darkgray;
        }

        .bottom-menu {
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .bottom-menu #checkAllBottom {
            vertical-align: text-bottom;
        }

        #deleteMulty {
            color: cornflowerblue;
            cursor: pointer;
            vertical-align: text-bottom;
        }

        .bottom-menu-include {
            background: #e5e5e5;
        }

        #selectGoodsCount {
            color: orangered;
            font-size: 16px;
            font-weight: bolder;
        }

        #selectGoodsMoney {
            color: orangered;
            font-size: 16px;
            font-weight: bolder;
        }

        .panel-default .submitData {
            background: orangered;
            font-size: 16px;
            color: white;
            cursor: pointer;
            font-weight: bolder;
            height: 58px;
            position: absolute;
            right: 0;
            top: 0;
        }

        .panel-default .submitDis {
            background: #B0B0B0;
            cursor: no-drop;
        }

        .shopping-car-container .panel-default {
            position: relative;
        }
    </style>
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
                    <img src="${pageContext.request.contextPath}/images/logo2.png" alt=" ">
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
                        你好！<a href="${pageContext.request.contextPath}/user/profile" >
                        <img src="${pageContext.request.contextPath}/images/avatar/${member.avatar}" class="img-circle" style="width: 20px;height: 20px">
                            ${member.username}
                    </a>
                    </li>

                </c:if>
            </ul>
            <!--站内搜索模块 -->
            <div class="agileits_search">
                <form action="" method="get" id="searchForm">
                    <input name="searchName" type="search" placeholder="想搜点什么？" required="" id="searchBar">
                    <input name="pageNum" type="hidden" value="0" required="" id="pageNum">
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
<div class="shopping-car-container">
    <form action="#" method="post" id="form">
        <div class="car-headers-menu">
            <div class="row">
                <div class="col-md-1 car-menu">
                    <label><input type="checkbox" id="check-goods-all" /><span id="checkAll">全选</span></label>
                </div>
                <div class="col-md-3 car-menu">商品信息</div>
                <div class="col-md-2 car-menu">单价</div>
                <div class="col-md-2 car-menu">数量</div>
                <div class="col-md-2 car-menu">金额</div>
                <div class="col-md-2 car-menu">操作</div>
            </div>
        </div>
        <div class="goods-content">
            <!--goods display-->
            <c:forEach var="item_list" items="${item_list}" varStatus="i">
                <div class="goods-item">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <div class="col-md-1 car-goods-info">
                                <label>
                                        <%--                                <input type="checkbox" class="goods-list-item"/>--%>
                                    <input type="checkbox" id="cbox_${item_list.serialNum}" name="cbox" class="cbox goods-list-item" value="${item_list.serialNum}_${item_num_list.get(i.count-1)}">
                                </label>
                            </div>
                            <div class="col-md-3 car-goods-info goods-image-column">
                                <img class="goods-image" src="${pageContext.request.contextPath}/${item_list.image}" style="width: 100px; height: 100px;" />
                                <span id="goods-info">${item_list.name}</span>
                            </div>
                            <div class="col-md-2 car-goods-info"><span>￥</span><span class="single-price">${item_list.price}</span></div>
                            <div class="col-md-2 car-goods-info">
                                <div class="input-group">
                                    <div class="input-group-btn">
                                        <button type="button" class="btn btn-default cart_quantity_down">-</button>
                                    </div>
                                    <input type="text" class="form-control quantity_text" value="${item_num_list.get(i.count-1)}" dataValue="${item_list.serialNum}" priceValue="${item_list.price}">
                                    <div class="input-group-btn" itemNum="${item_list.number}">
                                        <button type="button" class="btn btn-default cart_quantity_up">+</button>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-2 car-goods-info"><span>￥</span><span class="single-total" id="${item_list.serialNum}" price="${item_list.price}">${item_num_list.get(i.count-1) * item_list.price}</span></div>
                            <div class="col-md-2 car-goods-info">
                                <button type="button" class="btn btn-danger item-delete" value="${item_list.serialNum}">删除</button>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
        <div class="panel panel-default">
            <div class="panel-body bottom-menu-include">
                <div class="col-md-1 check-all-bottom bottom-menu">
                    <label>
                        <input type="checkbox" id="checked-all-bottom" />
                        <span id="checkAllBottom">全选</span>
                    </label>
                </div>
                <div class="col-md-1 bottom-menu">
<%--				<span id="deleteMulty">--%>
<%--						删除--%>
<%--				</span>--%>
                </div>
                <div class="col-md-6 bottom-menu">

                </div>
                <div class="col-md-2 bottom-menu">
<%--                    <span>已选商品 <span id="selectGoodsCount">0</span> 件</span>--%>
                </div>
                <div class="col-md-1 bottom-menu">
<%--                    <span>合计：<span id="selectGoodsMoney">0.00</span></span>--%>
                </div>
                <div class="col-md-1 bottom-menu">
                    <button class="btn btn-primary" id="subBtn" onclick="check()">结算</button>
                </div>
            </div>
        </div>
    </form>

    <!--删除确认弹框-->
    <div class="modal fade" tabindex="-1" role="dialog" id="deleteItemTip" aria-labelledby="gridSystemModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="gridSystemModalLabel">提示</h4>
                </div>
                <div class="modal-body">
                    确认删除此商品？
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-primary deleteSure">确定</button>
                </div>
            </div>
        </div>
    </div>
</div>

<script>

</script>

<!-- js-files -->




<!-- for bootstrap working -->
<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>

<script src="${pageContext.request.contextPath}/js/common.js"></script>

<script>
    $(function () {
        pageType = '${pageType}';
        member = '<%=session.getAttribute("member")%>';
        message = '<%=session.getAttribute("message")%>';
        if (message !== '' && message !== 'null') {
            alert(message);
            if (message === '您已被封禁！'){
                member_status = 'S';
            }
            if (message === '您还未通过实名认证！'){
                member_status = 'V';
            }
            <%session.removeAttribute("message");%>
            message = '';
        }
    })
    console.log(member);
</script>


<script src="${pageContext.request.contextPath}/js/cart.js"></script>

<!-- //for bootstrap working -->
<!-- //js-files -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.9/dist/js/bootstrap-select.min.js"></script>

</body>
</html>
