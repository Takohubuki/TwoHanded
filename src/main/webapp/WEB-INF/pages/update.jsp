<%--
  Created by IntelliJ IDEA.
  User: Tako
  Date: 2019/7/11
  Time: 15:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>修改资料</title>
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
<body>
<div class="container col-md-6">
    <div class="box box-primary">
        <div class="box-header with-border">
            <h3 class="box-title">更新商品信息</h3>
        </div>
        <form role="form" action="${pageContext.request.contextPath}/user/update/profile" method="post" enctype="multipart/form-data">
            <div class="box-body">
                <div class="form-group">
                    <input class="form-control" type="text" placeholder="商品名" name="name" value="${item.name}">
                </div>
                <div class="form-group">
                    <select class="form-control selectpicker" title="${item.quality}" name="quality">
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                        <option value="6">6</option>
                        <option value="7">7</option>
                        <option value="8">8</option>
                        <option value="9">9</option>
                        <option value="10">全新</option>
                        <option value="0">其他</option>
                    </select>
                    <input type="hidden" value="${item.quality}" name="quality">
                </div>
                <div class="form-group">
                    <input class="form-control" type="text" placeholder="商品数量" name="number" value="${item.number}">
                </div>
                <div class="form-group">
                    <select class="form-control selectpicker" title="${item.kind}" name="kind">
                        <option value="电子产品">电子产品</option>
                        <option value="衣物">衣物</option>
                        <option value="体育用品">体育用品</option>
                        <option value="生活用品">生活用品</option>
                        <option value="杂物">杂物</option>
                    </select>
                    <input type="hidden" value="${item.kind}">
                </div>
                <div class="form-group input-group">
                    <span class="input-group-addon">￥</span>
                    <input class="form-control" type="text" placeholder="商品单价" name="price" value="${item.price}">
                </div>
                <div class="form-group">
                    <label>上传新图片</label>
                    <input class="form-control" type="file" name="imagefile">
                    <input type="hidden" value="${item.image}" name="image">
                </div>
                <div class="form-group">
                    <input class="form-control" type="text" placeholder="商品描述" name="describes" value="${item.describes}">
                </div>
                <div class="form-group">
                    <select class="form-control selectpicker" title="${item.conditions}" name="conditions">
                        <option value="出售">出售</option>
                        <option value="求购">求购</option>
                    </select>
                    <input type="hidden" value="${item.conditions}" name="conditions">
                </div>
                <div class="form-group">

                    <input type="hidden" value="${item.publisher}" name="publisher">
                </div>
            </div>
            <div class="footer">
                <button class="btn btn-primary" type="submit">保存</button>
            </div>
        </form>
    </div>
</div>
<!-- js-files -->
<!-- jquery -->
<script src="${pageContext.request.contextPath}/js/jquery-2.1.4.min.js"></script>
<!-- //jquery -->

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
