<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Tako
  Date: 2019/7/8
  Time: 15:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>Title</title>
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
<div id="paging">
    <div class="center-block row">
        <c:forEach var="itemlist" items="${itemPageInfo.list}">
            <div class="col-md-4 product-men">
                <div class="men-pro-item simpleCart_shelfItem">
                    <div class="men-thumb-item">
                        <img src="${pageContext.request.contextPath}/${itemlist.image}" alt="" style="width: 159px;height: 150px">
                        <div class="men-cart-pro">
                            <div class="inner-men-cart-pro">
                                <a href="${pageContext.request.contextPath}/items/singleitem?itemname=${itemlist.name}" class="link-product-add-cart">详情</a>
                            </div>
                        </div>
                    </div>
                    <div class="item-info-product ">
                        <h4>
                            <a href="${pageContext.request.contextPath}/items/singleitem">${itemlist.name}</a>
                        </h4>
                        <div class="info-product-price">
                            <span class="item_price">￥${itemlist.price}</span>

                        </div>
                        <div class="snipcart-details top_brand_home_details item_add single-item hvr-outline-out">
                            <form action="${pageContext.request.contextPath}/order/addcart" method="post">
                                <fieldset>
                                    <input type="hidden" name="cmd" value="_cart" />
                                    <input type="hidden" name="add" value="1" />
                                    <input type="hidden" name="business" value=" " />
                                    <input type="hidden" name="item_name" value="${itemlist.name}" />
                                    <input type="hidden" name="amount" value="${itemlist.price}" />
                                    <input type="hidden" name="item_serial_num" value="${itemlist.serial_num}" />
                                    <input type="hidden" name="currency_code" value="CNY" />
                                    <input type="hidden" name="return" value=" " />
                                    <input type="hidden" name="cancel_return" value=" " />
                                    <input type="submit" name="submit" value="Add to cart" class="button" />
                                </fieldset>
                            </form>
                        </div>

                    </div>
                </div>
            </div>
<%--            ${itemlist.name}<br>--%>
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
<!-- js-files -->
<!-- jquery -->
<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
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
<!-- Large modal -->
<!-- <script>
    $('#').modal('show');
</script> -->
<!-- //popup modal (for signin & signup)-->

<!-- cart-js -->
<script src="${pageContext.request.contextPath}/js/minicart.js"></script>
<script>
    paypalm.minicartk.render(); //use only unique class names other than paypal1.minicart1.Also Replace same class name in css and minicart.min.js

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
<!-- //cart-js -->

<!-- password-script -->
<script>
    window.onload = function () {
        document.getElementById("password1").onchange = validatePassword;
        document.getElementById("password2").onchange = validatePassword;
    }

    function validatePassword() {
        var pass2 = document.getElementById("password2").value;
        var pass1 = document.getElementById("password1").value;
        if (pass1 != pass2)
            document.getElementById("password2").setCustomValidity("Passwords Don't Match");
        else
            document.getElementById("password2").setCustomValidity('');
        //empty string means no validation error
    }
</script>
<!-- //password-script -->

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

<!-- for bootstrap working -->
<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
<!-- //for bootstrap working -->
<script type="text/javascript">
    function queryDeviceRecords(pageNum) {
        var id=$("#deviceId").val();
        $("#paging").load("${pageContext.request.contextPath}/items/itempage?pageNum=" + pageNum);
    }
</script>
<!-- //js-files -->
</body>
</html>
