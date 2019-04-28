<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/4/16
  Time: 19:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>注册</title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.9/dist/css/bootstrap-select.min.css">

    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <!-- 可选的 Bootstrap 主题文件（一般不用引入） -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
    <!-- jquery文件-->
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <!-- Latest compiled and minified JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.9/dist/js/bootstrap-select.min.js"></script>

    <!-- (Optional) Latest compiled and minified JavaScript translation files -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.9/dist/js/i18n/defaults-*.min.js"></script>

    <style>
        .container{
            display:table;
            height:100%;
        }

        .row{
            display: table-cell;
            vertical-align: middle;
        }
        /* centered columns styles */
        .row-centered {
            text-align:center;
        }
        .col-centered {
            display:inline-block;
            float:none;
            text-align:left;
            margin-right:-4px;
        }
        .margin_top_bottom{
            margin-top: 10px;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="row row-centered center-block">
        <div class="well col-md-6 col-centered center-block">
            <form action="${pageContext.servletContext.contextPath}/user/signup" method="post">
                <div class="form-group">
                    <div class="input-group input-group-md margin_top_bottom">
                        <span class="input-group-addon" id="user-name-label">用户名</span>
                        <input type="text" class="form-control" placeholder="Username" aria-describedby="basic-addon1" name="username" value="${username}">
                    </div>
                </div>
                <div class="form-group">
                    <div class="input-group input-group-md margin_top_bottom">
                        <span class="input-group-addon" id="password-label">密 码</span>
                        <input type="password" class="form-control" placeholder="password" aria-describedby="basic-addon1" name="password">
                    </div>
                </div>
                <div class="form-group">
                    <div class="input-group input-group-md margin_top_bottom">
                        <span class="input-group-addon" id="phoneNum-label">手机号</span>
                        <input type="password" class="form-control" placeholder="phone" aria-describedby="basic-addon1" name="phone">
                    </div>
                </div>
                <div class="margin_top_bottom">
                    <button type="submit" class="btn btn-success btn-block">注册</button>
                </div>
            </form>

            <div id="message" style="color: red">${message}</div>
        </div>

    </div>

</div>

</body>
</html>
