<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<section class="content-header">
    <h1>用户管理</h1>
</section>
<script>
    // let userId;
    url = '/manage/member'

    function identifyMember(btn) {
        userId = btn.value;
        let reqUrl = '/manage/';
        if ($(btn).hasClass("btn-primary")){
            reqUrl = reqUrl + 'identifyMember';
        }else {
            reqUrl = reqUrl + 'denyIdentifyMember';
        }
        $.ajax({
            url: reqUrl,
            data: {
                'userId': userId
            },
            async: false,
            success: function (result) {
                alert(result);
                $('#page').load(url);
            }

        })

    }

    $(function () {
        $('#example2').DataTable({
            'paging': true,
            'lengthChange': false,
            'searching': true,
            'ordering': true,
            'info': true,
            'autoWidth': false,
            'language': language
        })
    });

</script>

<section class="content">
    <div class="row">
        <div class="col-xs-12">
            <div class="box">
                <div class="box-body">
                    <div id="example2_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
                        <div class="row">
                            <div class="col-sm-12">
                                <table id="example2" class="table table-bordered table-hover dataTable" role="grid"
                                       aria-describedby="example2_info">
                                    <thead>
                                    <tr role="row">
                                        <th class="sorting" tabindex="0" aria-controls="example2">
                                            学号
                                        </th>
                                        <th class="sorting" tabindex="1" aria-controls="example2">
                                            用户名
                                        </th>
                                        <th class="sorting" tabindex="2" aria-controls="example2">
                                            姓名
                                        </th>
                                        <th class="sorting" tabindex="3" aria-controls="example2">
                                            电子邮箱
                                        </th>
                                        <th class="sorting" tabindex="4" aria-controls="example2">
                                            审核材料
                                        </th>
                                        <th class="sorting" tabindex="5" aria-controls="example2">
                                            注册时间
                                        </th>
                                        <th class="sorting" tabindex="6" aria-controls="example2">
                                            操作
                                        </th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="memberInfoList" items="${memberInfoList}">
                                        <tr role="row">
                                            <td class="sorting">
                                                <a href="javascript:userDetail('${memberInfoList.sid}')">${memberInfoList.sid}</a>
                                            </td>
                                            <td>
                                                    ${memberInfoList.username}
                                            </td>
                                            <td>
                                                    ${memberInfoList.name}
                                            </td>
                                            <td>
                                                    ${memberInfoList.email}
                                            </td>
                                            <td>
                                                <img src="${memberInfoList.identificationMaterial}"
                                                     style="width: 80px;height: 75px">
                                            </td>
                                            <td>
                                                <fmt:formatDate value="${memberInfoList.signinTime}"
                                                                pattern="yyyy-MM-dd HH:mm" type="Date"/>
                                            </td>
                                            <td>
                                                <button onclick="identifyMember(this)" value="${memberInfoList.sid}" class="btn btn-primary">同意</button>
                                                <button onclick="identifyMember(this)" value="${memberInfoList.sid}" class="btn btn-danger">拒绝</button>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                </div>
                <!-- /.box-body -->
            </div>
            <!-- /.box -->
        </div>
        <!-- /.col -->
    </div>

</section>
</html>
