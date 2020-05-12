<%--
  Created by IntelliJ IDEA.
  User: 28293
  Date: 2020/3/14
  Time: 19:24
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
    <title>填写订单信息</title>
    <link rel="stylesheet" type="text/css" href="./static/css/orderpage.css">
    <jsp:include page="../base.jsp"/>
</head>
<body class="index">
<div class="container" style="background: white;">
    <jsp:include page="../header.jsp"/>
    <jsp:include page="../navbar.jsp"/>


    <div>
        <div style="width: auto; margin: auto;">
            <div style="border:1px solid grey;">
                <div style="width: auto;margin: auto;border:1px solid grey;">
                    <div style="width: auto;height: 30px;background:linear-gradient(to bottom,#f68710,#f6cbab);">
                        <h4 style="margin: auto;float: left;color: white;">填写订单信息</h4>
                    </div>

                    <div class="order_title">
                        <div style="width: auto;height: 3px;background-color: orange;"></div>
                        <h5 style="margin: auto;float: left;color: #f27303;">购买的商品</h5>
                    </div>
                    <div class="buytable">
                        <table border="1" cellpadding="3" cellspacing="0">
                            <tr style="background: #ffebcc;">
                                <th width="60px">图片</th>
                                <th width="320px">名称</th>
                                <th width="80px">购买数量</th>
                                <th width="100px">单价</th>
                                <th width="100px">小计</th>
                            </tr>
                            <c:if test="${buyItem != null}">
                                <tr>
                                    <td style="width: 60px;height: 60px;background-color: orange;">
                                        <img src="/pic/items_pic/${buyItem.itemsPic}" width="60px" height="60px"
                                             alt="图片"></td>
                                    <td><strong>${buyItem.itemsName}</strong></td>
                                    <td>
                                        <div>${buyNum}</div>
                                    </td>
                                    <td>
                                        <div style="color: red;">￥${buyItem.itemsPrice}</div>
                                    </td>
                                    <td>
                                        <div style="color: red;">￥${buyItem.itemsPrice*buyNum}</div>
                                    </td>
                                </tr>
                            </c:if>
                            <c:if test="${buyItems != null}">
                                <c:forEach items="${buyItems}" var="buyItem" varStatus="status">
                                    <tr>
                                        <td style="width: 60px;height: 60px;background-color: orange;">
                                            <img src="/pic/items_pic/${buyItem.itemPic}" width="60px" height="60px"
                                                 alt="图片"></td>
                                        <td><strong>${buyItem.itemName}</strong></td>
                                        <td>
                                            <div>${buyItem.itemNum}</div>
                                        </td>
                                        <td>
                                            <div style="color: red;">￥${buyItem.itemPrice}</div>
                                        </td>
                                        <td>
                                            <div style="color: red;">￥${buyItem.itemPrice*buyItem.itemNum}</div>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:if>

                        </table>
                    </div>

                    <div class="order_title">
                        <div style="width: auto;height: 3px;background-color: orange;"></div>
                        <h5 style="margin: auto;float: left;color: #f27303;">选择收货地址</h5>
                    </div>
                    <div class="chs_address">
                        <div class="chs_address_top">
                            <div class="chs_address_top_tit">我的收货地址：</div>
                        </div>
                        <c:if test="${empty addresses}">
                            <div id="address_input">
                                <h3>您还未添加收货地址。请添加：</h3>
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
                                            style="position: relative;float: left;top: -30px;left: 568px;background: linear-gradient(to bottom,#ffbca7,#f5a034);">
                                        添加
                                    </button>
                                </form>
                            </div>
                            <div id="new_address" style="display: none;">
                                <div class="chs_address_con" onclick="select(this)">
                                    <input type="radio" name="addressId" checked>
                                    <div class="chs_address_con_detail"></div>
                                </div>
                            </div>
                        </c:if>
                        <c:if test="${!empty addresses}">
                            <c:forEach items="${addresses}" var="address">
                                <div class="chs_address_con" onclick="select(this)">
                                    <input type="radio" name="addressId" value="${address.addressId}">
                                    <div class="chs_address_con_detail">${address.userAddress}</div>
                                </div>
                            </c:forEach>
                        </c:if>
                    </div>


                    <div class="order_title">
                        <div style="width: auto;height: 3px;background-color: orange;"></div>
                        <h5 style="margin: auto;float: left;color: #f27303;">选择配送方式</h5>
                    </div>
                    <div class="chs_address">
                        <div class="chs_address_top">
                            <div class="chs_address_top_tit">支持以下配送方式：</div>
                        </div>
                        <div class="chs_address_con" onclick="select(this)">
                            <input type="radio" name="sendWay"><span>快递</span>
                        </div>
                        <div class="chs_address_con" onclick="select(this)">
                            <input type="radio" name="sendWay"><span>EMS</span>
                        </div>
                        <div class="chs_address_con" onclick="select(this)">
                            <input type="radio" name="sendWay"><span>自取</span>
                        </div>
                    </div>

                    <div class="order_title">
                        <div style="width: auto;height: 3px;background-color: orange;"></div>
                        <h5 style="margin: auto;float: left;color: #f27303;">选择支付方式</h5>
                    </div>
                    <div class="chs_address">
                        <div class="chs_address_top">
                            <div class="chs_address_top_tit">支持以下支付方式：</div>
                        </div>
                        <div class="chs_address_con" onclick="select(this)">
                            <input type="radio" name="payWay"><span>聪付宝支付</span>
                        </div>
                        <div class="chs_address_con" onclick="select(this)">
                            <input type="radio" name="payWay"><span>聪信二维码支付</span>
                        </div>
                        <div class="chs_address_con" onclick="select(this)">
                            <input type="radio" name="payWay"><span>聪币支付</span>
                        </div>
                        <div class="chs_address_con" onclick="select(this)">
                            <input type="radio" name="payWay"><span>货到付款</span>
                        </div>
                    </div>

                    <div class="order_title">
                        <div style="width: auto;height: 3px;background-color: orange;"></div>
                        <h5 style="margin: auto;float: left;color: #f27303;">订单留言</h5>
                    </div>
                    <div>
                        <textarea placeholder="请在此处留言..." id="message" cols="148" rows="2"></textarea>
                    </div>

                    <div class="order_title">
                        <div style="width: auto;height: 3px;background-color: orange;"></div>
                        <h5 style="margin: auto;float: left;color: #f27303;">结算</h5>
                    </div>
                    <div class="order_end">
                        <div style="float: left;font-weight: bold;">总计：
                            <c:if test="${buyItem != null}">
                                <strong style="color: red;">￥${buyItem.itemsPrice*buyNum}</strong>
                            </c:if>
                            <c:if test="${buyItems != null}">
                                <div style="color: red;">￥${totalPrice}</div>
                            </c:if>

                        </div>
                        <div style="float: right;line-height: 4;">
                            <input type="button" onclick="pay_now();" class="pay_now" value="立即支付">
                        </div>
                    </div>


                </div>

            </div>

        </div>


    </div>

    <jsp:include page="../footer.jsp"/>

</div>
<script type="text/javascript" src="./static/js/address.js"></script>
<script type="text/javascript">
    layui.use("layer", function () {
        var layer = layui.layer;

        window.select=function(obj){
            $(obj).children("input").attr("checked",'true');
        };

        window.pay_now = function () {
            var address = $("input[name='addressId']:checked").next("div").text();
            var sendWay = $("input[name='sendWay']:checked").next("span").text();
            var payWay = $("input[name='payWay']:checked").next("span").text();
            var message = $("#message").val();

            if (address == null || address == "") {
                layer.msg("请选择一个地址哦！");
            } else if (sendWay == null || sendWay == "") {
                layer.msg("请选择一个配送方式哦！");
            } else if (payWay == null || payWay == "") {
                layer.msg("请选择一种支付方式哦！");
            } else {
                var data = {
                    orderId: '${orderId}',
                    address: address,
                    sendWay: sendWay,
                    payWay: payWay,
                    message: message
                };
                layer.load(0,{shade:false});
                $.ajax({
                    type: 'post',
                    url: './user/pay',
                    data: data,
                    success: function (result) {
                        if (data == "user_log_out"){
                            layer.confirm('您已退出登录或登录已失效，是否前往登录页面？', {
                                btn: ['去登录', '取消']
                            }, function () {
                                location.href = "./user/loginPage";
                            });
                        }
                        if (result == "paySuccess") {
                            layer.msg("购买中...");
                            location.href = './user/payEnd';
                        }
                    }
                });
            }
        };


        $("#addAddress").on('click',function () {
            var citysinfo = $("#citysinfo").val();
            var addressDetail = $("#addressDetail").val();

            if (citysinfo == "" || citysinfo == null) {
                layer.msg("请选择地区！");
            } else if (addressDetail == "" || addressDetail == null) {
                layer.msg("请输入详细地址！");
            } else {
                $.ajax({
                    type: 'post',
                    data: {address: citysinfo + addressDetail},
                    url: 'user/addAddress',
                    success:function (data) {
                        if (data=="addSuccess"){
                            layer.msg("添加成功！");
                            $("#address_input").hide();
                            $("#new_address").show();
                            $("input[name='addressId']:checked").next("div").text(citysinfo+addressDetail);
                        }
                    }
                })


            }
        })


    });


</script>
</body>
</html>
