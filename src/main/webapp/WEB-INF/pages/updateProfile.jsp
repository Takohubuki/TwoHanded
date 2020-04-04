<%--
  Created by IntelliJ IDEA.
  User: Tako
  Date: 2019/7/11
  Time: 15:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>修改资料</title>
</head>
<body>
<div class="container col-md-6">
    <div class="box box-primary">
        <div class="box-header with-border">
            <h3 class="box-title">修改资料</h3>
        </div>
        <form role="form" action="${pageContext.request.contextPath}/user/update/profile" method="post"
              enctype="multipart/form-data">
            <div class="box-body">
                <div class="form-group">
                    <label>学号</label>
                    <input type="text" class="form-control" name="sid" value="${member.sid}" disabled>
                </div>
                <div class="form-group">
                    <label>姓名</label>
                    <input type="text" class="form-control" name="name" value="${member.name}">
                </div>
                <div class="form-group">
                    <label>用户名</label>
                    <input type="text" class="form-control" name="username" value="${member.username}">
                </div>
                <div class="form-group">
                        <label>联系电话</label>
                        <input type="text" class="form-control" name="phone" value="${member.phone}">
                    </div>
                    <div class="form-group">
                        <label>宿舍</label>
                        <input type="text" class="form-control" name="dormitory" value="${member.dormitory}">
                    </div>
                    <div class="form-group">
                        <label>上传头像</label>
                        <input type="file" class="form-control" name="imagefile">
                    </div>
                    <div class="form-group">
                        <label>修改密码</label>
                        <input type="password" class="form-control" name="password" placeholder="此处留空为不修改">
                    </div>
                </div>
                <div class="footer">
                    <button class="btn btn-primary" type="submit">保存</button>
                </div>
            </form>
        </div>
    </div>

</body>
</html>
