<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>注册</title>
    <!-- Latest compiled and minified CSS -->
    <!-- Bootstrap 3.3.7 -->
    <link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
    <!-- Font Awesome -->
    <link href="${pageContext.request.contextPath}/css/font-awesome.css" rel="stylesheet">
    <!-- Ionicons -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/icons/ionicons.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/AdminLTE.css">


    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.9/dist/css/bootstrap-select.min.css">
    <!-- Google Font -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">

</head>
<body class="hold-transition register-page">
<div class="register-box">
    <div class="register-logo">
        <a href="${pageContext.servletContext.contextPath}/index/backindex"><b>H</b>R<b>B</b>U</a>
    </div>

    <div class="register-box-body">
        <p class="login-box-msg">注册新账号</p>

        <form action="${pageContext.servletContext.contextPath}/user/signup" method="post">
            <div class="form-group has-feedback">
                <input type="text" class="form-control" placeholder="用户名" name="username">
                <span class="glyphicon glyphicon-user form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <input type="text" class="form-control" placeholder="真实姓名" name="name">
                <span class="glyphicon glyphicon-user form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <input type="text" class="form-control" placeholder="学号" name="sid">
                <span class="glyphicon glyphicon-book form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <input type="password" class="form-control" placeholder="密码" name="password">
                <span class="glyphicon glyphicon-lock form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <input type="password" class="form-control" placeholder="再次输入密码">
                <span class="glyphicon glyphicon-log-in form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <input type="text" class="form-control" placeholder="电子邮箱" name="email">
                <span class="glyphicon glyphicon-home form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <input type="text" class="form-control" placeholder="手机号" name="phone">
                <span class="glyphicon glyphicon-phone form-control-feedback"></span>
            </div>
            <div class="form-group">
                <label>上传实名材料（学生证与本人同框的照片）</label>
                <input type="file" class="form-control" name="image">
            </div>

            <div class="row">
                <div class="col-xs-8">
                    <c:if test="${message != null}">
                        <div class="alert alert-danger" role="alert" style="margin-top: 20px">${message}</div>
                    </c:if>
                </div>
                <!-- /.col -->
                <div class="col-xs-4">
                    <button type="submit" class="btn btn-primary btn-block btn-flat">注册</button>
                </div>
                <!-- /.col -->
            </div>
        </form>

        <a href="${pageContext.request.contextPath}/user/signin" class="text-center">我有账号</a>
    </div>
    <!-- /.form-box -->
</div>
<!-- /.register-box -->

<!-- jQuery 3 -->
<script src="${pageContext.request.contextPath}/js/jquery-2.1.4.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>


</body>
</html>
