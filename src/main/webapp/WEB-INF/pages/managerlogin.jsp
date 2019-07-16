<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/4/8
  Time: 9:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>管理员登录</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/simple-line-icons.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/fontawesome-all.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/managerlogin_styles.css">
</head>
<body>


<!-- FIXME 管理员登录模块完善 -->
<div class="page-wrapper flex-row align-items-center">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-5">
                <div class="card p-4">
                    <div class="card-header text-center text-uppercase h4 font-weight-light">
                        后台管理
                    </div>

                    <div class="card-body py-5">
                        <form action="${pageContext.request.contextPath}/manage/login" method="post">
                            <div class="form-group">
                                <label class="form-control-label">用户名</label>
                                <input type="text" class="form-control" name="username">
                            </div>

                            <div class="form-group">
                                <label class="form-control-label">密码</label>
                                <input type="password" class="form-control" name="password">
                            </div>


                            <button type="submit" class="btn btn-primary px-5">登录</button>
                        </form>

                    </div>
                    <c:if test="${message != null}">
                        <div class="card-footer">
                            <div class="alert alert-danger">
                                    ${message}
                            </div>
                        </div>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/js/jquery-2.1.4.min.js"></script>
<script src="${pageContext.request.contextPath}/js/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/js/chart.js"></script>
<script src="${pageContext.request.contextPath}/js/demo.js"></script>
<script src="${pageContext.request.contextPath}//js/demo.js"></script>
</body>
</html>
