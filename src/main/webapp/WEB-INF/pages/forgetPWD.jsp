<%--
  Created by IntelliJ IDEA.
  User: Tako
  Date: 2020/4/9
  Time: 16:45
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>忘记密码</title>
    <!-- Bootstrap 3.3.7 -->
    <link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet" type="text/css" media="all"/>
    <!-- Font Awesome -->
    <link href="${pageContext.request.contextPath}/css/font-awesome.css" rel="stylesheet">
    <!-- Ionicons -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/icons/ionicons.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/AdminLTE.css">
    <!-- Google Font -->
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">


</head>
<body class="hold-transition login-page">
<div class="login-box">
    <div class="login-logo">
        <a href="${pageContext.servletContext.contextPath}/index/backindex"><b>H</b>R<b>B</b>U</a>
    </div>
    <!-- /.login-logo -->
    <div class="login-box-body">
        <p class="login-box-msg">验证邮箱</p>

        <form action="" method="post" id="verifyEmail">
            <div class="form-group has-feedback">
                <input type="text" class="form-control" placeholder="请输入学号" id="sid">
            </div>
            <div class="form-group has-feedback input-group">
                <input type="text" class="form-control" placeholder="请输入注册时邮箱" id="email">
                <div class="input-group-btn">
                    <input type="button" id="btn" value="获取验证码" onclick="send(this)" class="btn btn-primary"/>
                </div>
            </div>
            <div class="form-group has-feedback">
                <input type="text" class="form-control" placeholder="验证码" id="verifyCode">
            </div>
            <div class="row">
                <div class="col-xs-4">
                    <button type="submit" class="btn btn-primary btn-block btn-flat" id="verifyBtn">验证</button>
                </div>
                <!-- /.col -->
            </div>

        </form>
        <!-- /.social-auth-links -->
    </div>
    <!-- /.login-box-body -->
</div>
<!-- /.login-box -->
<!-- jQuery 3 -->
<script src="${pageContext.request.contextPath}/js/jquery-2.1.4.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>

<script type="text/javascript">
    var countdown = 60;
    let sent = false;
    let sid;
    let email;
    let verifyCode;

    function sendResetPasswordLink() {
        $.ajax({
            url: '/user/sendResetLink',
            data: {
                'sid': sid,
                'email': email
            },
            async: false,
            datatype: 'text',
            type: 'post',
            success: function (result) {
                console.log(result);
            },
            error: function (result) {
                console.log(result);
            }
        })
    }

    $(function () {
        $('#verifyBtn').click(function () {
            verifyCode = $('#verifyCode').val();
            $.ajax({
                url: '/user/verifyEmail',
                data: {
                    'sid': sid,
                    'verifyCode': verifyCode
                },
                async: false,
                datatype: 'text',
                type: 'post',
                success: function (result) {
                    alert(result);
                    if (result === '验证成功！系统将自动发送修改密码的链接') {
                        sendResetPasswordLink();
                    }
                },
                error: function (result) {
                    console.log(result);
                }
            });
            let verifyEmail = $('#verifyEmail');
            verifyEmail.attr('action',);
            verifyEmail.submit();
        })
    });

    function send(val) {
        if (send) {
            sendVerifyCode();
            setTime(val);
        }
    }

    function setTime(val) {
        if (countdown === 0) {
            console.log(111);
            val.removeAttribute("disabled");
            val.value = "获取验证码";
            countdown = 60;
        } else {
            val.setAttribute("disabled", true);
            val.value = "重新发送(" + countdown + ")";
            countdown--;
            setTimeout(function () {
                setTime(val)
            }, 1000)

        }
    }

    function sendVerifyCode() {
        sid = $('#sid').val();
        email = $('#email').val();
        $.ajax({
            url: '/user/sendVerifyCode',
            data: {
                'sid': sid,
                'email': email
            },
            async: false,
            datatype: 'text',
            type: 'post',
            success: function (result) {
                console.log(result);
            },
            error: function (result) {
                console.log(result);
                sent = false;
            }
        })
    }
</script>

</body>
</html>
