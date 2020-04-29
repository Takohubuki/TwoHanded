<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>修改资料</title>
    <!-- Bootstrap 3.3.7 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/icons/ionicons.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/AdminLTE.css">
    <!-- AdminLTE Skins. Choose a skin from the css/skins
         folder instead of downloading all of them to reduce the load. -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/_all-skins.css">

    <!-- Google Font -->
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>
<body>

<div class="container">
    <div class="col-md-1">

    </div>
    <div class="col-md-8">
        <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title">更新商品信息</h3>
            </div>
            <form role="form" action="${pageContext.request.contextPath}/items/updateitem" method="post"
                  enctype="multipart/form-data">
                <div class="box-body">
                    <div class="row">
                        <div class="form-group col-xs-6">
                            <label>商品名称</label>
                            <input class="form-control" type="text" placeholder="" name="name" value="${item.name}">
                        </div>
                        <div class="col-xs-6">

                        </div>
                    </div>
                    <c:if test="${item.conditions == '求购'}">

                        <div class="row">
                            <div class="form-group col-xs-6">
                                <label>期望价格</label>
                                <div class="input-group">
                                    <span class="input-group-addon">￥</span>
                                    <input class="form-control input-group" type="text" placeholder="商品单价" name="price"
                                           value="${item.price}">
                                </div>
                            </div>
                            <div class="col-xs-6">

                            </div>
                        </div>

                    </c:if>
                    <c:if test="${item.conditions == '出售'}">
                        <div class="row">
                            <div class="form-group col-xs-6">
                                <label>数量</label>
                                <input class="form-control" type="text" placeholder="商品数量" name="number"
                                       value="${item.number}">
                            </div>
                            <div class="col-xs-6">

                            </div>
                        </div>

                        <div class="row">
                            <div class="form-group col-xs-6">
                                <label>商品类型</label>
                                <select class="form-control selectpicker" title="${item.kind}" name="kind">
                                    <option value="电子产品">电子产品</option>
                                    <option value="衣物">衣物</option>
                                    <option value="体育用品">体育用品</option>
                                    <option value="生活用品">生活用品</option>
                                    <option value="杂物">杂物</option>
                                </select>
                                <input type="hidden" value="${item.kind}">
                            </div>
                            <div class="col-xs-6">

                            </div>
                        </div>

                        <div class="row">
                            <div class="form-group col-xs-6">
                                <label>单价</label>
                                <div class="input-group">
                                    <span class="input-group-addon">￥</span>
                                    <input class="form-control input-group" type="text" placeholder="商品单价" name="price"
                                           value="${item.price}">
                                </div>
                            </div>
                            <div class="col-xs-6">

                            </div>
                        </div>

                    </c:if>


                    <div class="row">
                        <div class="form-group col-xs-6">
                            <label>上传新图片</label>
                            <input class="form-control" type="file" name="imagefile">
                            <input type="hidden" value="${item.image}" name="image">
                        </div>
                        <div class="col-xs-6">

                        </div>
                    </div>

                    <div class="row">
                        <div class="form-group col-xs-6">
                            <label>介绍</label>
                            <textarea class="form-control" rows="3" name="describes">${item.describes}</textarea>
                        </div>
                        <div class="col-xs-6">

                        </div>
                    </div>

                    <div class="row">
                        <div class="form-group col-xs-3">
                            <select class="form-control selectpicker" title="${item.conditions}" name="conditions"
                                    readonly>
                                <option value="出售">出售</option>
                                <option value="求购">求购</option>
                            </select>
                            <%--                            <input type="hidden" value="${item.conditions}" name="conditions">--%>
                        </div>
                        <div class="col-xs-9">

                        </div>
                    </div>

                    <div class="form-group">
                        <input type="hidden" value="${item.publisher}" name="publisher">
                        <input type="hidden" value="${item.serialNum}" name="serialNum">
                    </div>
                </div>
                <div class="box-footer">
                    <button class="btn btn-primary" type="submit">保存</button>
                </div>

            </form>
        </div>
    </div>
    <div class="col-md-1">

    </div>
</div>
<!-- js-files -->
<!-- jquery -->
<script src="${pageContext.request.contextPath}/js/jquery-2.1.4.min.js"></script>
<!-- //jquery -->

<!-- 弹出登录注册框-->
<script src="${pageContext.request.contextPath}/js/jquery.magnific-popup.js"></script>
<script>
    $(document).ready(function () {
        $('.popup-with-zoom-anim').magnificPopup({
            type: 'inline',
            fixedContentPos: false,
            fixedBgPos: true,
            overflowY: 'auto',
            closeBtnInside: true,
            preloader: false,
            midClick: true,
            removalDelay: 300,
            mainClass: 'my-mfp-zoom-in'
        });

    });
</script>


<!-- for bootstrap working -->
<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
<!-- //for bootstrap working -->
<!-- //js-files -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.9/dist/js/bootstrap-select.min.js"></script>

</body>
</html>
