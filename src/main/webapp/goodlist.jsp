<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- 商品目录 -->
<div class="row goods">
    <c:forEach items="${goods}" var="good">
        <!--
        <div class="col-md-2">
        <a href="/ShSite/Good/Details?id=${good.getGood().getGoodId()}">
        <img style="width:200px;height:200px;" alt="${good.getGood().getGoodName()}" src="/ShSite/goodimages/${good.getGood().getGoodId()}.jpg"/>
        <div class="goodbottom">
        <span class="namespan">${good.getGood().getGoodName()}</span>
        <p>
        <span>¥${good.getGood().getGoodPrice()}</span>
        <span>评论${good.getCommentCount()}</span>
        <span>收藏${good.getCollectCount()}</span>
        </p>
        </div>
        </a>
        </div>
        -->
        <div class="col-md-6">
            <table class="table table-bordered" cellspacing="1" cellpadding="5" border="0" width="100%">
                <tbody>
                <tr>
                    <td rowspan="5" align="center" width="100">
                        <a href="/ShSite/Good/Details?id=${good.getGood().getGoodId()}"><img src="/ShSite/goodimages/${good.getGood().getGoodId()}.jpg" height="140" width="140"></a>
                    </td>
                    <td>商品名称：${good.getGood().getGoodName()}</td>
                </tr>
                <tr>
                    <td>商品价格：¥${good.getGood().getGoodPrice()}</td>
                </tr>
                <tr>
                    <td>评论：${good.getCommentCount()} </td>
                </tr>
                <tr>
                    <td>收藏：${good.getCollectCount()}</td>
                </tr>
                <tr>
                    <td>
                        <input class="btn btn-info" value="详细信息" onclick="window.open('/ShSite/Good/Details?id=${good.getGood().getGoodId()}')" type="button">
                    </td>
                </tr>

                </tbody>
            </table>
        </div>
    </c:forEach>

</div>