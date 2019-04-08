<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/4/8
  Time: 9:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录</title>
</head>
<body>
<form action="/login" method="post">
    <input type="text" name="username" placeholder="请输入用户名">
    <input type="text" name="password" placeholder="请输入密码">
    <select>
        <option>请选择身份</option>
        <option value="用户">用户</option>
        <option value="管理员">管理员</option>
    </select>
    <input type="submit">
</form>
</body>
</html>
