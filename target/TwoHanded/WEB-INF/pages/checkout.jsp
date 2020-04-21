
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
<body class="login-page hold-transition">

    <div class="login-box">
        <div class="login-box-msg">
            <span>选择支付方式</span>
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
            </form>
            <button id="payMethod" class="btn-primary btn">提交</button>
            <button class="btn btn-default operation" data-toggle="modal" data-target="#modal-danger">取消订单</button>
        </div>
    </div>

    <%--    拒绝弹出框--%>
    <div class="modal modal-danger fade" id="modal-danger" tabindex="-1" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">确定取消下单吗？</h4>
                </div>
                <div class="modal-body">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-outline pull-left" id="cancelOrder">确定</button>
                    <button type="button" class="btn btn-outline pull-right" data-dismiss="modal">算了</button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->

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
