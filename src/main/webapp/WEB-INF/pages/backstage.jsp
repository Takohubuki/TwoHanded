<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/4/29
  Time: 9:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Carbon - Admin Template</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/simple-line-icons.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
</head>
<body class="sidebar-fixed header-fixed">
<div class="page-wrapper">
    <nav class="navbar page-header">
        <ul class="navbar-nav ml-auto">

            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <span class="small ml-1 d-md-down-none">${manager.username}</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/manage/logout" role="button">注销</a>
            </li>
        </ul>
    </nav>

    <div class="main-container">
        <div class="sidebar">
            <nav class="sidebar-nav">
                <ul class="nav">
                    <li class="nav-title">Navigation</li>

                    <li class="nav-item">
                        <a href="${pageContext.request.contextPath}/manage/gen_sit" class="nav-link active">
                            <i class="icon icon-speedometer"></i> 概况总览
                        </a>
                    </li>

                    <li class="nav-item nav-dropdown">
                        <a href="javascript:member_manage()" class="nav-link">
                            <i class="icon icon-target"></i> 用户管理
                        </a>
                    </li>

                    <li class="nav-item nav-dropdown">
                        <a href="#" class="nav-link nav-dropdown-toggle">
                            <i class="icon icon-energy"></i> 商品管理
                        </a>
                        <ul class="nav-dropdown-items">
                            <li class="nav-item">
                                <a href="javascript:wtsItem()" class="nav-link">
                                    <i class="icon icon-target"></i> 出售商品
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="javascript:wtbItem()" class="nav-link">
                                    <i class="icon icon-target"></i> 求购信息
                                </a>
                            </li>
                        </ul>
                    </li>

                    <li class="nav-item nav-dropdown">
                        <a href="javascript:order_manage()" class="nav-link">
                            <i class="icon icon-graph"></i> 订单管理
                        </a>
                    </li>

                </ul>
            </nav>
        </div>

        <div class="content" id="page">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-3">
                        <div class="card p-4">
                            <div class="card-body d-flex justify-content-between align-items-center">
                                <div>
                                    <span class="h4 d-block font-weight-normal mb-2">${member_sum}</span>
                                    <span class="font-weight-light">注册用户数</span>
                                </div>

                                <div class="h2 text-muted">
                                    <i class="icon icon-people"></i>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-3">
                        <div class="card p-4">
                            <div class="card-body d-flex justify-content-between align-items-center">
                                <div>
                                    <span class="h4 d-block font-weight-normal mb-2">${item_wts_sum}</span>
                                    <span class="font-weight-light">在售商品数</span>
                                </div>

                                <div class="h2 text-muted">
                                    <i class="icon icon-wallet"></i>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-3">
                        <div class="card p-4">
                            <div class="card-body d-flex justify-content-between align-items-center">
                                <div>
                                    <span class="h4 d-block font-weight-normal mb-2">${item_wtb_sum}</span>
                                    <span class="font-weight-light">求购信息数</span>
                                </div>

                                <div class="h2 text-muted">
                                    <i class="icon icon-cloud-download"></i>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-3">
                        <div class="card p-4">
                            <div class="card-body d-flex justify-content-between align-items-center">
                                <div>
                                    <span class="h4 d-block font-weight-normal mb-2">${order_today}</span>
                                    <span class="font-weight-light">今日完成订单</span>
                                </div>

                                <div class="h2 text-muted">
                                    <i class="icon icon-clock"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-3">
                        <div class="card p-4">
                            <div class="card-body d-flex justify-content-between align-items-center">
                                <div>
                                    <span class="h4 d-block font-weight-normal mb-2">${loginToday}</span>
                                    <span class="font-weight-light">今日登录用户数</span>
                                </div>

                                <div class="h2 text-muted">
                                    <i class="icon icon-people"></i>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-3">
                        <div class="card p-4">
                            <div class="card-body d-flex justify-content-between align-items-center">
                                <div>
                                    <span class="h4 d-block font-weight-normal mb-2">${item_wts_sum_today}</span>
                                    <span class="font-weight-light">今日发布出售数</span>
                                </div>

                                <div class="h2 text-muted">
                                    <i class="icon icon-wallet"></i>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-3">
                        <div class="card p-4">
                            <div class="card-body d-flex justify-content-between align-items-center">
                                <div>
                                    <span class="h4 d-block font-weight-normal mb-2">${item_wtb_sum_today}</span>
                                    <span class="font-weight-light">今日发布求购数</span>
                                </div>

                                <div class="h2 text-muted">
                                    <i class="icon icon-cloud-download"></i>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-3">
                        <div class="card p-4">
                            <div class="card-body d-flex justify-content-between align-items-center">
                                <div>
                                    <span class="h4 d-block font-weight-normal mb-2">${order_total}</span>
                                    <span class="font-weight-light">完成订单总数</span>
                                </div>

                                <div class="h2 text-muted">
                                    <i class="icon icon-clock"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
<%--                <div class="row ">--%>
<%--                    <div class="col-md-12">--%>
<%--                        <div class="card">--%>
<%--                            <div class="card-header">--%>
<%--                                完成订单情况--%>
<%--                            </div>--%>

<%--                            <div class="card-body p-0">--%>
<%--                                <div class="p-4">--%>
<%--                                    <canvas id="line-chart" width="100%" height="20"></canvas>--%>
<%--                                </div>--%>

<%--                                <div class="justify-content-around mt-4 p-4 bg-light d-flex border-top d-md-down-none">--%>
<%--                                    <div class="text-center">--%>
<%--                                        <div class="text-muted small">Total Traffic</div>--%>
<%--                                        <div>12,457 Users (40%)</div>--%>
<%--                                    </div>--%>

<%--                                    <div class="text-center">--%>
<%--                                        <div class="text-muted small">Banned Users</div>--%>
<%--                                        <div>95,333 Users (5%)</div>--%>
<%--                                    </div>--%>

<%--                                    <div class="text-center">--%>
<%--                                        <div class="text-muted small">Page Views</div>--%>
<%--                                        <div>957,565 Pages (50%)</div>--%>
<%--                                    </div>--%>

<%--                                    <div class="text-center">--%>
<%--                                        <div class="text-muted small">Total Downloads</div>--%>
<%--                                        <div>957,565 Files (100 TB)</div>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
            </div>
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script src="${pageContext.request.contextPath}/js/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/js/chart.js"></script>
<script src="${pageContext.request.contextPath}/js/carbon.js"></script>
<script src="${pageContext.request.contextPath}/js/demo.js"></script>

<script>
    function member_manage() {
        $("#page").load("${pageContext.request.contextPath}/manage/member");
    }
    function item_manage() {
        $("#page").load("${pageContext.request.contextPath}/manage/item");
    }
    function order_manage() {
        $("#page").load("${pageContext.request.contextPath}/manage/order");
    }
    function wtsItem() {
        $("#page").load("${pageContext.request.contextPath}/manage/wtsitem");
    }
    function wtbItem() {
        $("#page").load("${pageContext.request.contextPath}/manage/wtbitem");
    }
</script>
</body>
</html>
