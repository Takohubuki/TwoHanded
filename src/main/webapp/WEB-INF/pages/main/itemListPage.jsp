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
<!-- first section (nuts) -->
<c:if test="${wtsPageInfo != null}">
    <div class="product-sec1">
        <h3 class="heading-tittle">出售</h3>
        <div class="row">
            <c:forEach var="itemlist" items="${wtsPageInfo.list}">
                <div class="col-md-4 product-men">
                    <div class="men-pro-item simpleCart_shelfItem">
                        <div class="men-thumb-item">
                            <img src="${pageContext.request.contextPath}/${itemlist.image}" alt=""
                                 style="width: 159px;height: 150px">
                            <div class="men-cart-pro">
                                <div class="inner-men-cart-pro">
                                    <a href="${pageContext.request.contextPath}/items/singleitem?itemId=${itemlist.serialNum}"
                                       class="link-product-add-cart">详情</a>
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
                                    <%--                                    <form action="#" method="post">--%>
                                <fieldset>
                                    <input type="hidden" name="itemId" value="${itemlist.serialNum}"/>
                                    <input type="hidden" name="itemName" value="${itemlist.name}"/>
                                    <input type="hidden" name="publisher"
                                           value="${itemlist.publisher}"/>
                                    <input type="submit" name="addcart" class="button" value="添加到购物车"/>
                                </fieldset>
                            </div>

                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
        <div class="row">
            <div class="col-sm-2"></div>
            <div class="col-sm-8">
                <ul class="pagination">
                    <c:if test="${!wtsPageInfo.isFirstPage}">
                        <li>
                            <a href="javascript:queryDeviceRecords(${wtsPageInfo.navigateFirstPage}, 'wts');">首页</a>
                        </li>
                        <li><a href="javascript:queryDeviceRecords(${wtsPageInfo.prePage}, 'wts');">上一页</a></li>
                    </c:if>
                    <c:forEach items="${wtsPageInfo.navigatepageNums}" var="navigatepageNum">

                        <c:if test="${navigatepageNum == wtsPageInfo.pageNum}">
                            <li class="active"><a
                                    href="javascript:queryAllDevices(${navigatepageNum});">${navigatepageNum}</a>
                            </li>
                        </c:if>
                        <c:if test="${navigatepageNum != wtsPageInfo.pageNum}">
                            <li>
                                <a href="javascript:queryDeviceRecords(${navigatepageNum}, 'wts');">${navigatepageNum}</a>
                            </li>
                        </c:if>
                    </c:forEach>
                    <c:if test="${!wtsPageInfo.isLastPage}">
                        <li><a href="javascript:queryDeviceRecords(${wtsPageInfo.nextPage}, 'wts');">下一页</a></li>
                        <li>
                            <a href="javascript:queryDeviceRecords(${wtsPageInfo.navigateLastPage}, 'wts');">最后一页</a>
                        </li>
                    </c:if>
                </ul>
            </div>
            <div class="col-sm-2"></div>

        </div>
        <div class="clearfix"></div>
    </div>
</c:if>
<!-- //first section (nuts) -->

<!-- third section (oils) -->
<c:if test="${wtbPageInfo != null}">
    <div class="product-sec1">
        <h3 class="heading-tittle">求购</h3>
        <div class="row">
            <c:forEach var="itemlist" items="${wtbPageInfo.list}">
                <div class="col-md-4 product-men">
                    <div class="men-pro-item simpleCart_shelfItem">
                        <div class="men-thumb-item">
                            <img src="${pageContext.request.contextPath}/${itemlist.image}" alt=""
                                 style="width: 159px;height: 150px">
                            <div class="men-cart-pro">
                                <div class="inner-men-cart-pro">
                                    <a href="${pageContext.request.contextPath}/items/singleitem?itemId=${itemlist.serialNum}"
                                       class="link-product-add-cart">详情</a>
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
                                <fieldset>
                                    <input type="hidden" name="itemId" value="${itemlist.serialNum}"/>
                                    <input type="hidden" name="itemName" value="${itemlist.name}"/>
                                    <input type="hidden" name="publisher"
                                           value="${itemlist.publisher}"/>
                                </fieldset>
                            </div>

                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
        <div class="row">
            <div class="col-sm-2"></div>
            <div class="col-sm-8">
                <ul class="pagination">
                    <c:if test="${!wtbPageInfo.isFirstPage}">
                        <li>
                            <a href="javascript:queryDeviceRecords(${wtbPageInfo.navigateFirstPage}, 'wtb');">首页</a>
                        </li>
                        <li><a href="javascript:queryDeviceRecords(${wtbPageInfo.prePage}, 'wtb');">上一页</a></li>
                    </c:if>
                    <c:forEach items="${wtbPageInfo.navigatepageNums}" var="navigatepageNum">

                        <c:if test="${navigatepageNum == wtbPageInfo.pageNum}">
                            <li class="active"><a
                                    href="javascript:queryAllDevices(${navigatepageNum}, 'wtb');">${navigatepageNum}</a>
                            </li>
                        </c:if>
                        <c:if test="${navigatepageNum != wtbPageInfo.pageNum}">
                            <li>
                                <a href="javascript:queryDeviceRecords(${navigatepageNum}, 'wtb');">${navigatepageNum}</a>
                            </li>
                        </c:if>
                    </c:forEach>
                    <c:if test="${!wtbPageInfo.isLastPage}">
                        <li><a href="javascript:queryDeviceRecords(${wtbPageInfo.nextPage}, 'wtb');">下一页</a></li>
                        <li>
                            <a href="javascript:queryDeviceRecords(${wtbPageInfo.navigateLastPage}, 'wtb');">最后一页</a>
                        </li>
                    </c:if>
                </ul>
            </div>
            <div class="col-sm-2"></div>
        </div>
        <div class="clearfix"></div>
    </div>
</c:if>
<!-- //third section (oils) -->
<c:if test="${wtbPageInfo == null && wtsPageInfo == null}">
    <div class="product-sec1">
        <h3 class="heading-tittle">没有找到相关商品！</h3>
        <div class="clearfix"></div>
    </div>
</c:if>
</body>
</html>
