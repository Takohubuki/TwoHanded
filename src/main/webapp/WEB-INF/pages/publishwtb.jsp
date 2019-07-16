<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Tako
  Date: 2019/7/11
  Time: 14:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>我的求购</title>
</head>
<body>
    我的求购列表<br>
    <c:forEach items="${mywtb}" var="mywtb">
        ${mywtb.name}|${mywtb.image}|${mywtb.price}|${mywtb.quality}|${mywtb.describes}<a href="${pageContext.request.contextPath}/item/update">修改</a><br>
    </c:forEach>
</body>
</html>
