<%--
  Created by IntelliJ IDEA.
  User: Tako
  Date: 2020/5/1
  Time: 20:36
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<section class="content-header">
    <h1>用户详情</h1>
</section>
<section class="content">
    <div class="box box-primary">
        <div class="box-header">
            <div class="widget-user-image">
                <img src="${pageContext.request.contextPath}/images/avatar/${memberDetail.avatar}" class="img-circle"
                     alt="avatar">
            </div>
            <h3 class="widget-user-username">${memberDetail.username}</h3>
        </div>
        <div class="box-body">
            <dl class="dl-horizontal" style="font-size: large">
                <dt>学号</dt>
                <dd>${memberDetail.sid}</dd>
                <dt>姓名</dt>
                <dd>${memberDetail.name}</dd>
                <dt>电子邮箱</dt>
                <dd>${memberDetail.email}</dd>
                <dt>手机号</dt>
                <dd>${memberDetail.phone}</dd>
                <dt>注册时间</dt>
                <dd><fmt:formatDate value="${memberDetail.signinTime}" type="Date" pattern="yyyy-MM-dd"/></dd>
                <dt>最近登录时间</dt>
                <dd><fmt:formatDate value="${memberDetail.recentLogin}" type="Date" pattern="yyyy-MM-dd HH:mm"/></dd>
                <dt>收到好评</dt>
                <dd>${memberDetail.positiveComment}</dd>
                <dt>收到差评</dt>
                <dd>${memberDetail.negativeComment}</dd>
                <dt>出售商品件数</dt>
                <dd>${memberDetail.tradRecordNum}</dd>
                <dt>状态</dt>
                <dd>
                    <c:if test="${memberDetail.status == 'U'}">
                        <a href="#"><i class="fa fa-circle text-success"></i> 正常</a>
                    </c:if>
                    <c:if test="${memberDetail.status == 'S'}">
                        <a href="#"><i class="fa fa-circle text-danger"></i> 封禁中</a>
                        <br>
                        <p>解封剩余时间：</p>
                    </c:if>
                    <c:if test="${memberDetail.status == 'D'}">
                        <a href="#"><i class="fa fa-circle text-orange"></i> 停止使用</a>
                    </c:if>
                </dd>
            </dl>
        </div>
        <div class="box-footer">
            <c:if test="${memberDetail.status == 'U'}">
                <button>封禁</button>
            </c:if>
            <c:if test="${memberDetail.status == 'S'}">
                <button>恢复</button>
            </c:if>
            <c:if test="${memberDetail.status == 'D'}">
                <button>删除</button>
            </c:if>
        </div>
    </div>
</section>
<script>
    let userId;

    function getUserId(btn) {
        userId = btn.val();
    }
</script>
</html>
