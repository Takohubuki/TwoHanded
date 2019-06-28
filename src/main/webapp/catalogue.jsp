<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- 商品导航 -->
<div class="col-lg-2" style="margin-top:-70px;"><!-- background:#F8F5E4;margin-bottom:0px; -->
    <ul id="catalogueul">
        <c:forEach items="${goodTypes}" var="goodType">
            <li><a href="/ShSite/Good/Browse?id=${goodType.getGoodTypeId()}">
                <strong>${goodType.getGoodTypeName()}</strong>
            </a></li>
        </c:forEach>
    </ul>
</div>