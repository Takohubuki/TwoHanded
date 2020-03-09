<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Tako
  Date: 2019/7/29
  Time: 16:16
  To change this template use File | Settings | File Templates.
--%>
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

<form action="#" method="post" id="form">
    <c:forEach var="item_list" items="${item_list}" varStatus="i">
        商品名：${item_list.name}&nbsp;&nbsp;&nbsp;&nbsp;数量：${item_num_list.get(i.count-1)}<br>
        <input type="text" style="visibility: hidden" name="itemId" id="itemId${i.count-1}" value="${item_list.serialNum}" />
        <input type="text" style="visibility: hidden" name="itemNum" id="itemNum${i.count-1}" value="${item_num_list.get(i.count-1)}" />
    </c:forEach>
    <input type="button" class="btn-default btn-primary" onclick="checkOut()" value="结算">
</form>
<script>
    let cartList = [];
    let cartItem = {
        itemId: '',
        itemNum: ''
    };
    cartItem.itemId = $("#itemId").val();
    cartItem.itemNum = $("#itemNum").val();
    let s = JSON.stringify(cartItem);
    console.log(s);

    cartList.push(cartItem);
    console.log(cartList);

    function checkOut(){
        $.ajax({
            url : "${pageContext.request.contextPath}/order/checkout",
            type : "POST",
            contentType: "application/json;charset=UTF-8",
            data : JSON.stringify(cartList),
            success : function(result) {
                console.log(result);
            },
            error : function(e){
                console.log(e.status);
                console.log(e.responseText);
            }
        })
    }

</script>

<!-- js-files -->

<!-- 弹出登录注册框-->
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
<!-- Large modal -->
<!-- <script>
    $('#').modal('show');
</script> -->
<!-- //弹出控制结束-->

<!-- 购物车 -->
<script src="${pageContext.request.contextPath}/js/minicart.js"></script>
<script>

    var cart_action = "${pageContext.request.contextPath}/order/checkout"
    paypalm.minicartk.render({
        action:cart_action,
    }); //use only unique class names other than paypalm.minicartk.Also Replace same class name in css and minicart.min.js


    paypalm.minicartk.cart.on('checkout', function (evt) {
        var items = this.items(),
            len = items.length,
            total = 0,
            i;

        // Count the number of each item in the cart
        for (i = 0; i < len; i++) {
            total += items[i].get('quantity');
        }

        // if (total < 3) {
        //     alert('The minimum order quantity is 3. Please add more to your shopping cart before checking out');
        //     evt.preventDefault();
        // }
    });

</script>
<!-- //购物车结束-->

<!-- price range (top products) -->
<script src="${pageContext.request.contextPath}/js/jquery-ui.js"></script>
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
<script src="${pageContext.request.contextPath}/js/jquery.flexisel.js"></script>
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
<script src="${pageContext.request.contextPath}/js/SmoothScroll.min.js"></script>
<!-- //smoothscroll -->

<!-- start-smooth-scrolling -->
<script src="${pageContext.request.contextPath}/js/move-top.js"></script>
<script src="${pageContext.request.contextPath}/js/easing.js"></script>
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
<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
<!-- //for bootstrap working -->
<!-- //js-files -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.9/dist/js/bootstrap-select.min.js"></script>

</body>
</html>
