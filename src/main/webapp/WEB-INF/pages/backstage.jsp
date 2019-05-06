<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/4/29
  Time: 9:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <div style="float: right">
        欢迎！${manager.name}<a href="${pageContext.servletContext.contextPath}/user/logout">注销</a>
    </div>
</body>
</html>
