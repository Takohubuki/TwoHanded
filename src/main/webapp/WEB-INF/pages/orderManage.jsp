<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%--
  Created by IntelliJ IDEA.
  User: Tako
  Date: 2019/7/11
  Time: 14:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title></title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/simple-line-icons.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
</head>
<body class="hold-transition skin-blue sidebar-mini">
<!-- Main content -->
<section class="content">

    <div class="row">
        <div class="col-xs-12">
            <div class="card">
                <div class="card-header bg-light">
                    订单列表
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-hover">
                            <thead>
                            <tr role="row">
                                <th class="sorting" tabindex="0" aria-controls="example2">
                                    订单编号
                                </th>
                                <th class="sorting" tabindex="1" aria-controls="example2">
                                    买家ID
                                </th>
                                <th class="sorting" tabindex="2" aria-controls="example2">
                                    商品ID
                                </th>
                                <th class="sorting" tabindex="3" aria-controls="example2">
                                    商品数量
                                </th>
                                <th class="sorting" tabindex="4" aria-controls="example2">
                                    下单时间
                                </th>
                                <th class="sorting" tabindex="5" aria-controls="example2">
                                    订单金额
                                </th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="orderlist" items="${orderlist}">
                                <tr role="row">
                                    <td class="sorting">
                                            ${orderlist.order_id}
                                    </td>
                                    <td>
                                            ${orderlist.buyer_id}
                                    </td>
                                    <td>
                                            ${orderlist.item_id}
                                    </td>
                                    <td>
                                            ${orderlist.item_num}
                                    </td>
                                    <td>
                                        <fmt:formatDate value="${orderlist.create_time}" pattern="yyyy-MM-dd HH:mm:ss" type="Date" />
                                    </td>
                                    <td>
                                        ${orderlist.sum_price}
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- /.content -->
<div class="control-sidebar-bg"></div>

<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script src="${pageContext.request.contextPath}/js/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/js/chart.js"></script>
<script src="${pageContext.request.contextPath}/js/carbon.js"></script>
<script src="${pageContext.request.contextPath}/js/demo.js"></script>
</body>
</html>