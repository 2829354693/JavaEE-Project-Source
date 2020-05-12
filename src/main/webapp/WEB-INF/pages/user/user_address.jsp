<%--
  Created by IntelliJ IDEA.
  User: 28293
  Date: 2020/3/12
  Time: 19:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <base href="${sessionScope.base }/">
    <meta charset="utf-8">
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <title>地址管理</title>
    <jsp:include page="../base.jsp"/>
</head>
<body class="index">
<div class="container" style="background: white;height: 700px;">
    <jsp:include page="../header.jsp"/>
    <jsp:include page="../navbar.jsp"/>
    <jsp:include page="../search.jsp"/>
    <jsp:include page="left.jsp"/>


    <div class="address-fa">

        <div>
            <div style="float: left">
                <label><strong>添加收货地址:</strong></label>
                <select name="provlevel" id="provlevel" style="width: 120px;height:30px;border: 1px solid #ffbca7;">
                    <option>--请选择省份--</option>
                </select>
                <select name="citylevel" id="citylevel"
                        style="width: 120px;height:30px;margin-left: 2px;border: 1px solid #ffbca7;">
                    <option>--请选择城市--</option>
                </select>
                <select name="arealevel" id="arealevel"
                        style="width: 120px;height:30px;margin-left: 2px;border: 1px solid #ffbca7;">
                    <option>--请选择区/县--</option>
                </select>
            </div>

            <div style="float: left">
                <input type="text" name="citysinfo" id="citysinfo" style="height: 28px;border: 1px solid #ffbca7;"
                       readonly>
            </div>
        </div>
        <form class="layui-form">
            <div style="margin-top: 10px">
                <input type="text" id="addressDetail" placeholder="请精确到街道门牌号（此为个人项目，请不要填写真实信息^_^）"
                       style="width: 560px;height: 28px;">
            </div>
            <button type="button" class="layui-btn layui-btn-sm" id="addAddress"
                    style="position: relative;float: right;top: -30px;left: -37px;background: linear-gradient(to bottom,#ffbca7,#f5a034);">
                添加
            </button>
        </form>

        <c:if test="${empty addresses}">
            <strong>您还未添加收货地址，请添加。</strong>
        </c:if>
        <c:if test="${!empty addresses}">
            <div class="address_wrap">
                <c:forEach items="${addresses}" var="address">
                    <div style="width: 600px;height: 70px;border: 1px solid #cfcccc;margin-top: 15px;">
                        <div>
                            <div style="float: left;line-height: 5;">
                                <strong>${address.userAddress}</strong>
                            </div>
                            <div style="float: right;line-height: 5;">
                                <button type="button" class="delAddressBtn" id="delAddress"
                                        onclick="delAddress(${address.addressId})"
                                >
                                    删除
                                </button>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </c:if>

    </div>


    <script type="text/javascript" src="./static/js/address.js"></script>
    <script type="text/javascript">
        layui.use(['form', 'layer'], function () {
            var form = layui.form,
                layer = layui.layer;
            form.render();

            $("#addAddress").on('click', function () {

                var citysinfo = $("#citysinfo").val();
                var addressDetail = $("#addressDetail").val();

                if (citysinfo == "" || citysinfo == null) {
                    layer.msg("请选择地区！");
                } else if (addressDetail == "" || addressDetail == null) {
                    layer.msg("请输入详细地址！");
                } else {
                    $.ajax({
                        type: 'post',
                        url: 'user/getAddressCount',
                        success: function (data) {
                            if (data == "user_log_out"){
                                layer.confirm('您已退出登录或登录已失效，是否前往登录页面？', {
                                    btn: ['去登录', '取消']
                                }, function () {
                                    location.href = "./user/loginPage";
                                });
                            }
                            if (data == "toomanyads") {
                                layer.alert("最多保存5个地址！");
                                return;
                            }
                            if (data == "allowAdd") {
                                $.ajax({
                                    type: 'post',
                                    data: {address: citysinfo + addressDetail},
                                    url: 'user/addAddress',
                                    success: function (data) {
                                        if (data == "addSuccess") {
                                            layer.msg("添加成功！");
                                            location.href = './user/userAddress';
                                            // $(".address_wrap").load(location.href + " .address_wrap");
                                        }
                                    }
                                });
                            }
                        }


                    });
                }

            });

            window.delAddress = function (addressId) {
                $.ajax({
                    type: 'post',
                    data: {addressId: addressId},
                    url: './user/deleteAddress',
                    success: function (data) {
                        if (data == "user_log_out"){
                            layer.confirm('您已退出登录或登录已失效，是否前往登录页面？', {
                                btn: ['去登录', '取消']
                            }, function () {
                                location.href = "./user/loginPage";
                            });
                        }
                        if (data == "delSuccess") {
                            layer.msg("删除成功！");
                            location.href = './user/userAddress';
                        }
                    }
                });
            }
        });


    </script>
</div>


</body>
</html>