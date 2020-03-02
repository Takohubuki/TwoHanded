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
                    出售商品列表
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-hover">
                            <thead>
                            <tr role="row">
                                <th class="sorting" tabindex="0" aria-controls="example2">
                                    商品图片
                                </th>
                                <th class="sorting" tabindex="1" aria-controls="example2">
                                    商品名称
                                </th>
                                <th class="sorting" tabindex="2" aria-controls="example2">
                                    商品类型
                                </th>
                                <th class="sorting" tabindex="3" aria-controls="example2">
                                    商品单价
                                </th>
                                <th class="sorting" tabindex="4" aria-controls="example2">
                                    库存量
                                </th>
                                <th class="sorting" tabindex="5" aria-controls="example2">
                                    是否下架
                                </th>
                                <th class="sorting" tabindex="6" aria-controls="example2">
                                    商品编号
                                </th>
                                <th class="sorting" tabindex="7" aria-controls="example2">
                                    发布时间
                                </th>
                                <th class="sorting" tabindex="8" aria-controls="example2">
                                    发布者
                                </th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="itemlist" items="${itemlist}">
                                <tr role="row">
                                    <td class="sorting">
                                        <img src="${pageContext.request.contextPath}/${itemlist.image}" style="width: 80px;height: 75px">
                                    </td>
                                    <td>
                                            ${itemlist.name}
                                    </td>
                                    <td>
                                            ${itemlist.kind}
                                    </td>
                                    <td>
                                            ${itemlist.price}
                                    </td>
                                    <td>
                                            ${itemlist.quality}
                                    </td>
                                    <td>
                                        <c:if test="${itemlist.is_undercarriage == 0}">
                                            未下架
                                        </c:if>
                                        <c:if test="${itemlist.is_undercarriage == 1}">
                                            已下架
                                        </c:if>
                                    </td>
                                    <td>
                                        ${itemlist.serial_num}
                                    </td>
                                    <td>
                                        <fmt:formatDate value="${itemlist.publish_time}" pattern="yyyy-MM-dd HH:mm:ss" type="Date" />
                                    </td>
                                    <td>
                                            ${itemlist.publisher}
                                    </td>
                                    <td>
                                        <a href="javascript:offitem(${itemlist.serial_num})" role="button" class="btn btn-primary">
                                            下架
                                        </a>
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
<div class="control-sidebar-bg"></div>

<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script src="${pageContext.request.contextPath}/js/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/js/chart.js"></script>
<script src="${pageContext.request.contextPath}/js/carbon.js"></script>
<script src="${pageContext.request.contextPath}/js/demo.js"></script>

<script>
    function offitem(item_id) {
        $("#page").load("${pageContext.request.contextPath}/manage/offitem?item_id="+item_id);
    }
</script>
</body>
</html>
