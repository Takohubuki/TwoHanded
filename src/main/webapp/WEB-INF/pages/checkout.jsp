<%--
  Created by IntelliJ IDEA.
  User: Tako
  Date: 2019/7/15
  Time: 14:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>结算购物车</title>
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

<h1 align="center">结算成功</h1>

<a href="${pageContext.request.contextPath}/index/backindex" class="btn btn-primary center-block">返回</a>
<%--<button onclick="reset_cart()" href="${pageContext.request.contextPath}/index/backindex">清空</button>--%>
</body>
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

    var cart_action = "${pageContext.request.contextPath}/order/checkout"
    paypalm.minicartk.render({
        action:cart_action,
        <%--template: '<% for (var i= 0, idx = i + 1, len = items.length; i < len; i++, idx++) { %>        <li class="minicartk-item">            <div class="minicartk-details-name">                <a class="minicartk-name" href="<%= items[i].get("href") %>"><%= items[i].get("item_name") %></a>                <ul class="minicartk-attributes">                    <% if (items[i].get("item_number")) { %>                    <li>                        <%= items[i].get("item_number") %>                        <input type="hidden" name="item_number_<%= idx %>" value="<%= items[i].get("item_number") %>" />                    </li>                    <% } %>                    <% if (items[i].discount()) { %>                    <li>                        <%= config.strings.discount %> <%= items[i].discount(priceFormat) %>                        <input type="hidden" name="discount_amount_<%= idx %>" value="<%= items[i].discount() %>" />                    </li>                    <% } %>                    <% for (var options = items[i].options(), j = 0, len2 = options.length; j < len2; j++) { %>                        <li>                            <%= options[j].key %>: <%= options[j].value %>                            <input type="hidden" name="on<%= j %>_<%= idx %>" value="<%= options[j].key %>" />                            <input type="hidden" name="os<%= j %>_<%= idx %>" value="<%= options[j].value %>" />                        </li>                    <% } %>                </ul>            </div>            <div class="minicartk-details-quantity">                <input class="minicartk-quantity" data-minicartk-idx="<%= i %>" name="quantity_<%= idx %>" type="text" pattern="[0-9]*" value="<%= items[i].get("quantity") %>" autocomplete="off" />            </div>            <div class="minicartk-details-remove">                <button type="button" class="minicartk-remove" data-minicartk-idx="<%= i %>">&times;</button>            </div>            <div class="minicartk-details-price">                <span class="minicartk-price"><%= items[i].total(priceFormat) %></span>            </div>            <input type="hidden" name="item_name_<%= idx %>" value="<%= items[i].get("item_name") %>" />            <input type="hidden" name="amount_<%= idx %>" value="<%= items[i].amount() %>" />            <input type="hidden" name="shipping_<%= idx %>" value="<%= items[i].get("shipping") %>" />            <input type="hidden" name="shipping2_<%= idx %>" value="<%= items[i].get("shipping2") %>" />        </li>        <% } %>    </ul>    <div class="minicartk-footer">        <% if (hasItems) { %>            <div class="minicartk-subtotal">                <%= config.strings.subtotal %> <%= cart.total(totalFormat) %>            </div>            <button class="minicartk-submit" type="submit" data-minicartk-alt="<%= config.strings.buttonAlt %>"><%- config.strings.button %></button>        <% } else { %>            <p class="minicartk-empty-text"><%= config.strings.empty %></p>        <% } %>    </div>    <input type="hidden" name="cmd" value="_cart" />    <input type="hidden" name="upload" value="1" />    <% for (var key in settings) { %>        <input type="hidden" name="<%= key %>" value="<%= settings[key] %>" />    <% } %></form>'--%>
        <%--        template:myTemple--%>
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

<script>
    $(document).ready(function () {
        paypalm.minicartk.reset();
        alert("购物车清空")
    });
    function reset_cart() {
        paypalm.minicartk.reset();
    }
</script>
</html>
