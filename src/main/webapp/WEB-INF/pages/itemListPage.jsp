<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Tako
  Date: 2019/7/8
  Time: 15:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<body>
    <div class="center-block row">
        <c:forEach var="itemlist" items="${itemPageInfo.list}">
            <div class="col-md-4 product-men">
                <div class="men-pro-item simpleCart_shelfItem">
                    <div class="men-thumb-item">
                        <img src="${pageContext.request.contextPath}/${itemlist.image}" alt="" style="width: 159px;height: 150px">
                        <div class="men-cart-pro">
                            <div class="inner-men-cart-pro">
                                <a href="${pageContext.request.contextPath}/items/singleitem?itemId=${itemlist.serialNum}" class="link-product-add-cart">详情</a>
                            </div>
                        </div>
                    </div>
                    <div class="item-info-product ">
                        <h4>
                            <a href="${pageContext.request.contextPath}/items/singleitem?itemId=${itemlist.serialNum}">${itemlist.name}</a>
                        </h4>
                        <div class="info-product-price">
                            <span class="item_price">￥${itemlist.price}</span>

                        </div>
                        <div class="snipcart-details top_brand_home_details item_add single-item hvr-outline-out">
<%--                            <form action="#" method="post">--%>
                                <fieldset>
                                    <input type="hidden" name="itemId" value="${itemlist.serialNum}"/>
                                    <input type="hidden" name="itemName" value="${itemlist.name}" />
                                    <c:if test="${itemlist.conditions == '出售'}">
                                        <input type="submit" name="addcart" class="button" value="添加到购物车"/>
                                    </c:if>
                                </fieldset>
<%--                            </form>--%>
                        </div>

                    </div>
                </div>
            </div>
        </c:forEach>

    </div>
    <div class="row center-block">
        <ul class="pagination">
            <c:if test="${!itemPageInfo.isFirstPage}">
                <li><a href="javascript:queryDeviceRecords(${itemPageInfo.navigateFirstPage});">首页</a></li>
                <li><a href="javascript:queryDeviceRecords(${itemPageInfo.prePage});">上一页</a></li>
            </c:if>
            <c:forEach items="${itemPageInfo.navigatepageNums}" var="navigatepageNum">

                <c:if test="${navigatepageNum==itemPageInfo.pageNum}">
                    <li class="active"><a href="javascript:queryAllDevices(${navigatepageNum});">${navigatepageNum}</a></li>
                </c:if>
                <c:if test="${navigatepageNum!=itemPageInfo.pageNum}">
                    <li><a href="javascript:queryDeviceRecords(${navigatepageNum});">${navigatepageNum}</a></li>
                </c:if>
            </c:forEach>
            <c:if test="${!itemPageInfo.isLastPage}">
                <li><a href="javascript:queryDeviceRecords(${itemPageInfo.nextPage});">下一页</a></li>
                <li><a href="javascript:queryDeviceRecords(${itemPageInfo.navigateLastPage});">最后一页</a></li>
            </c:if>
        </ul>
    </div>
</body>
</html>
