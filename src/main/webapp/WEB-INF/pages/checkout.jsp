
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

<h1 align="center">结算</h1>
<div class="login-page">
    <div class="login-box">
        <div class="login-box-msg">
            <span>选择结算方式</span>
        </div>
        <div class="login-box-body">
            <label>
                <select form="payForm">
                    <option value="alipay">支付宝支付</option>
                    <option value="cashpay">线下交易</option>
                </select>
            </label>
            <form id="payForm">
                <input type="hidden" name="orderId" value="${orderId}">
                <input type="submit" id="payMethod" class="btn-primary btn">
            </form>
        </div>
    </div>
</div>
<%--<a href="${pageContext.request.contextPath}/index/backindex" class="btn btn-primary center-block">返回</a>--%>
</body>
<!-- js-files -->
<!-- jquery -->
<script src="${pageContext.request.contextPath}/js/jquery-2.1.4.min.js"></script>
<!-- //jquery -->

<!-- for bootstrap working -->
<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
<!-- //for bootstrap working -->
<script src="${pageContext.request.contextPath}/js/cart.js"></script>

</html>
