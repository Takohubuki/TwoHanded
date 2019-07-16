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
    <script src="${pageContext.request.contextPath}/js/minicart.js"></script>
</head>
<body>
<script>
    let items = paypalm.minicartk.cart.items();
    for (var i = 0;i,items.length;i++){
        var item_name = items[i].get("item_name");
        document.write(item_name);
    }
</script>
<h1>结算</h1>
</body>
</html>
