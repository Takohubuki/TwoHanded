<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/6/24
  Time: 17:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<div class="banner_box">
    <div class="banner dropdown">
        <img src="/ShSite/resources/images/logo.png" class="img1" />
        <!-- 如果已经授权则显示退出链接 -->
        <security:authorize access="isAuthenticated()">
            <div class="online_user dropdown-toggle" data-toggle="dropdown">
                <img src="/ShSite/headportraits/${sessionScope.user.getShUserId()}.jpg" class="img-circle" width="50">
                <span>${sessionScope.user.getShUserName()}</span>
            </div>
            <ul class="dropdown-menu pull-right" role="menu" aria-labelledby="dropdown">
                <li role="presentation" class="dropdown-header">嗨，${sessionScope.user.getShUserName()}</li>
                <li><a href="/ShSite/Account/PersonCenter/${sessionScope.user.getShUserId()}">个人中心</a></li>
                <li><a href="/ShSite/Good/Publish">我要发布</a></li>
                <li><a href="/ShSite/Account/CollectCenter/${sessionScope.user.getShUserId()}">我的收藏</a></li>
                <li><a href="/ShSite/Account/LogOut">退出登录</a></li>
            </ul>
        </security:authorize>
        <!-- 不具有 Admin,User的权限则显示登录链接-->
        <security:authorize ifNotGranted="Admin,User">
            <div class="online_user">
                <a href="/ShSite/Account/LogOn">登录</a>
                <a href="/ShSite/Account/Register">注册</a>
            </div>
        </security:authorize>
    </div>
</div>
<div class="row">
    <div class="col-lg-2">
    </div>
    <div class="col-lg-10">
        <nav class="navbar navbar-default" role="navigation">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="/ShSite/index">主页</a>
                </div>

                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="/ShSite/Good">商品中心</a>
                </div>

                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="/ShSite/Announcement">公告中心</a>
                </div>

                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="/ShSite/Good/Publish">商品发布</a>
                </div>

                <!-- 只有管理员权限才能够看到这两个入口 -->
                <security:authorize access="hasRole('Admin')">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="/ShSite/UserManager">用户管理</a>
                    </div>

                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="/ShSite/GoodManager">商品管理</a>
                    </div>

                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="/ShSite/Announcement/Manager">公告管理</a>
                    </div>
                </security:authorize>

                <div class="navbar-header" style="margin-left:140px;">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <form class="search_box navbar-brand" action="/ShSite/Good/Search" method="post" style="margin-top:-10px;">
                        <div class="input_wr">
                            <input type="text" name="key" placeholder="搜索你想要的二货">
                            <span>
	                	<input type="submit" value=""/>
	                	</span>
                        </div>
                    </form>
                </div>
            </div>
        </nav>

    </div>
</div>
