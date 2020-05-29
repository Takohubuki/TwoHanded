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
                     alt="avatar" style="height: 90px;width: 90px">
            </div>
            <h3 class="widget-user-username">${memberDetail.username}</h3>
        </div>
        <div class="box-body">
            <div class="nav-tabs-custom">
                <ul class="nav nav-tabs">
                    <li class="active">
                        <a href="#infoTab" data-toggle="tab" aria-expanded="true">用户详情</a>
                    </li>
                    <li>
                        <a href="#wtsTab" data-toggle="tab" aria-expanded="true">他的出售</a>
                    </li>
                    <li>
                        <a href="#wtbTab" data-toggle="tab" aria-expanded="true">他的求购</a>
                    </li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane active" id="infoTab">
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
                            <dd><fmt:formatDate value="${memberDetail.signinTime}" type="Date"
                                                pattern="yyyy-MM-dd"/></dd>
                            <dt>最近登录时间</dt>
                            <dd><fmt:formatDate value="${memberDetail.recentLogin}" type="Date"
                                                pattern="yyyy-MM-dd HH:mm"/></dd>
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
                                    <%--
                                                                        <p>解封剩余时间：</p>
                                    --%>
                                </c:if>
                                <c:if test="${memberDetail.status == 'D'}">
                                    <a href="#"><i class="fa fa-circle text-orange"></i> 停止使用</a>
                                </c:if>
                                <c:if test="${memberDetail.status == 'V'}">
                                    <a href="#"><i class="fa fa-circle text-orange"></i> 待实名</a>
                                </c:if>
                            </dd>
                        </dl>
                    </div>
                    <div class="tab-pane" id="wtsTab">
                        <table id="wtsTable" class="table table-bordered table-hover dataTable" role="grid"
                               aria-describedby="example2_info">
                            <thead>
                            <tr role="row">
                                <th class="sorting" tabindex="0" aria-controls="example2">
                                    图片
                                </th>
                                <th class="sorting" tabindex="1" aria-controls="example2">
                                    名称
                                </th>
                                <th class="sorting" tabindex="2" aria-controls="example2">
                                    单价
                                </th>
                                <th class="sorting" tabindex="3" aria-controls="example2">
                                    数量
                                </th>
                                <th class="sorting" tabindex="4" aria-controls="example2">
                                    商品描述
                                </th>
                                <th class="sorting" tabindex="5" aria-controls="example2">
                                    状态
                                </th>
                                <th class="sorting" tabindex="6" aria-controls="example2">

                                </th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="myWts" items="${myWts}">
                                <tr role="row">
                                    <td class="sorting">
                                        <img src="${pageContext.request.contextPath}/${myWts.image}"
                                             style="width: 80px;height: 75px">
                                    </td>
                                    <td>
                                            ${myWts.name}
                                    </td>
                                    <td>
                                        ￥${myWts.price}
                                    </td>
                                    <td>
                                            ${myWts.number}
                                    </td>
                                    <td>
                                            ${myWts.describes}
                                    </td>

                                    <c:if test="${myWts.isUndercarriage == true}">
                                        <td>
                                            已下架
                                        </td>
                                        <td>${myWts.undercarriageReason}</td>
                                    </c:if>

                                    <c:if test="${myWts.isUndercarriage == false}">
                                        <td>
                                            出售中
                                        </td>
                                        <td>
                                            <button class="btn btn-danger" onclick="getItemId(this)"
                                                    data-toggle="modal" data-target="#modal-danger"
                                                    value="${myWts.serialNum}">下架
                                            </button>
                                        </td>
                                    </c:if>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <div class="tab-pane" id="wtbTab">
                        <table id="wtbTable" class="table table-bordered table-hover dataTable" role="grid"
                               aria-describedby="example2_info">
                            <thead>
                            <tr role="row">
                                <th class="sorting" tabindex="0" aria-controls="example2">
                                    图片
                                </th>
                                <th class="sorting" tabindex="1" aria-controls="example2">
                                    名称
                                </th>
                                <th class="sorting" tabindex="2" aria-controls="example2">
                                    期望价格
                                </th>
                                <th class="sorting" tabindex="3" aria-controls="example2">
                                    描述
                                </th>
                                <th class="sorting" tabindex="4" aria-controls="example2">

                                </th>
                                <th tabindex="5" aria-controls="example2">
                                    发布时间
                                </th>
                                <th tabindex="6" aria-controls="example2">
                                    操作
                                </th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="myWtb" items="${myWtb}">
                                <tr role="row">
                                    <td class="sorting">
                                        <img src="${pageContext.request.contextPath}/${myWtb.image}"
                                             style="width: 80px;height: 75px">
                                    </td>
                                    <td>
                                            ${myWtb.name}
                                    </td>
                                    <td>
                                            ${myWtb.price}
                                    </td>
                                    <td>
                                            ${myWtb.describes}
                                    </td>
                                    <td>
                                        已有${myWtb.number}人愿意出售
                                    </td>
                                    <td>
                                        <fmt:formatDate value="${myWtb.publishTime}"
                                                        pattern="yyyy-MM-dd HH:mm" type="Date"/>
                                    </td>
                                    <td>
                                        <button class="btn btn-danger" onclick="getItemId(this)"
                                                data-toggle="modal" data-target="#modal-danger"
                                                value="${myWtb.serialNum}">下架
                                        </button>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

        </div>
        <div class="box-footer">
            <c:if test="${memberDetail.status == 'U'}">
                <button onclick="getUserId(this)" class="btn btn-danger shutMember">封禁</button>
            </c:if>
            <c:if test="${memberDetail.status == 'S'}">
                <button onclick="getUserId(this)" class="btn btn-success activeMember">解封</button>
            </c:if>
            <c:if test="${memberDetail.status == 'D'}">
                <button onclick="getUserId(this)" class="btn btn-danger delMember">删除</button>
            </c:if>
            <c:if test="${memberDetail.status == 'V'}">

            </c:if>
            <div class="pull-right">
                <p class="">发布过<label id="wtsCounts"></label>件出售商品</p>
                <br>
                <p class="">发布过<label id="wtbCounts"></label>个求购信息</p>
            </div>
        </div>
    </div>
</section>
<script>
    let wtsTable;
    let wtbTable;

    $(function () {
        wtsTable = $('#wtsTable').DataTable({
            'paging': true,
            'lengthChange': false,
            'searching': true,
            'ordering': true,
            'info': true,
            'autoWidth': false,
            'language': language
        });
        wtbTable = $('#wtbTable').DataTable({
            'paging': true,
            'lengthChange': false,
            'searching': true,
            'ordering': true,
            'info': true,
            'autoWidth': false,
            'language': language
        });

        countItem();

        $('.shutMember').click(function () {
            $.ajax({
                url: '/manage/shutMember',
                data: {
                    'sid': userId
                },
                success: function (result) {
                    $('#page').load(url);
                }
            })
        });

        $('.activeMember').click(function () {
            $.ajax({
                url: '/manage/activeMember',
                data: {
                    'sid': userId
                },
                success: function (result) {
                    $('#page').load(url);
                }
            })
        })

    });

    function getItemId(btn) {
        itemId = btn.value;
        console.log(itemId);
    }

    function getUserId(btn) {
        userId = btn.val();
    }

    function countItem() {
        let wtsInfo = wtsTable.page.info();
        let wtsCounts = wtsInfo.recordsTotal;

        let wtbInfo = wtbTable.page.info();
        let wtbCounts = wtbInfo.recordsTotal;

        if (wtsCounts !== 0) {
            $('#wtsCounts').html(wtsCounts);
        } else {
            $('#wtsCounts').html(0);

        }
        if (wtbCounts !== 0) {
            $('#wtbCounts').html(wtbCounts);
        } else {
            $('#wtbCounts').html(0);
        }

    }


</script>
</html>
