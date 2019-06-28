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
                                <label class="form-control-label">Username</label>
                                <input type="text" class="form-control" name="username">
                            </div>

                            <div class="form-group">
                                <label class="form-control-label">Password</label>
                                <input type="password" class="form-control" name="password">
                            </div>

                            <div class="custom-control custom-checkbox mt-4">
                                <input type="checkbox" class="custom-control-input" id="login">
                                <label class="custom-control-label" for="login">Check this custom checkbox</label>
                            </div>
                            <button type="submit" class="btn btn-primary px-5">Login</button>
                        </form>

                    </div>

                    <div class="card-footer">
                        <div class="row">
                            <div class="col-6">
                                ${message}
                                <a class="btn btn-primary px-5" role="button" href="${pageContext.request.contextPath}/manager/login">登录</a>
                            </div>

                        </div>
                    </div>
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
