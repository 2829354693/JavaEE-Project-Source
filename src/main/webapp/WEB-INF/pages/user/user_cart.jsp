<%--
  Created by IntelliJ IDEA.
  User: 28293
  Date: 2020/3/13
  Time: 18:28
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
    <title>我的购物车</title>
    <jsp:include page="../base.jsp"/>
</head>
<body class="index">
<div class="container" style="background: white;height: 100%;overflow: hidden;">
    <jsp:include page="../header.jsp"/>
    <jsp:include page="../navbar.jsp"/>
    <jsp:include page="../search.jsp"/>
    <jsp:include page="left.jsp"/>

    <div class="address-fa">
        <c:if test="${empty cartCustoms}">
            <strong>购物车还是空的哦。。。去首页逛逛吧！<a href="./index">去首页</a></strong>
        </c:if>
        <c:if test="${!empty cartCustoms}">
            <form id="cartForm" method="post" action="./user/buyFromCart">
                <c:forEach items="${cartCustoms}" var="cart">
                    <div style="width: 600px;height: 100px;border: 1px solid #cfcccc;margin-top: 15px;">
                        <div style="float: left;line-height: 7;">
                            <input type="checkbox" style="width: 20px;height: 20px;" name="cartId"
                                   value="${cart.cartId}">
                        </div>
                        <div style="float: left;margin-left: 20px;">
                            <img src="/pic/items_pic/${cart.itemPic}" width="100" height="100" alt="商品图片">
                        </div>
                        <div style="float: left">
                            <a href="./items/itemDetail?item_id=${cart.itemId}"><strong>${cart.itemName}</strong></a>
                        </div>
                        <div style="float: right;margin-top: 40px;">
                            <label for="itemNum"></label>
                            <input style="width: 30px; height: 21px;cursor: pointer; border: 2px white; float: left;" type="button"
                                   value="-"
                                   onclick="reduce(this,${cart.itemPrice},${cart.cartId})"/>
                            <input style="width: 35px;height: 20px;text-align: center;float: left"
                                   value="${cart.itemNum}" id="itemNum" readonly/>
                            <input style="width: 30px; height: 21px;cursor: pointer; border: 2px white;" type="button" value="+"
                                   onclick="add(this,${cart.itemPrice},${cart.cartId})"/>
                            <strong style="float: right;color: #df0000">￥${cart.itemPrice*cart.itemNum}</strong>
                        </div>

                    </div>
                </c:forEach>
            </form>
            <div style="float: right">
                <div style="float: right">
                    <input type="button" class="buyCart" id="buyCart" value="立即购买" onclick="buyCart()">
                </div>
                <div style="float: right">
                    <input type="button" class="removeCart" id="removeCart" value="移出购物车" onclick="removeCart()">
                </div>
            </div>
        </c:if>


    </div>

</div>
<script type="text/javascript">

    layui.use(['layer'], function () {
        var layer = layui.layer;

        window.reduce = function (obj, price, cartId) {
            if ($(obj).next().val() == '') {
                $(obj).next().val(1);
            }
            if ($(obj).next().val() == 1) {
                layer.msg("至少为1");
            } else {
                $(obj).next().val(parseInt($(obj).next().val()) - 1);
                $(obj).next().next().next("strong").text("￥" + parseFloat(price * parseInt($(obj).next().val())));

                var data={
                  cartId:cartId,
                  itemNum:$(obj).next().val()
                };

                $.ajax({
                    type: 'post',
                    data: data,
                    url: './user/changeItemNum',
                    success:function (data) {
                        if (data == "user_log_out"){
                            layer.confirm('您已退出登录或登录已失效，是否前往登录页面？', {
                                btn: ['去登录', '取消']
                            }, function () {
                                location.href = "./user/loginPage";
                            });
                        }
                    }
                });
            }
        };

        window.add = function (obj, price, cartId) {
            if ($(obj).prev().val() == '') {
                $(obj).prev().val(1);
            }
            $(obj).prev().val(parseInt($(obj).prev().val()) + 1);
            $(obj).next("strong").text("￥" + parseFloat(price * parseInt($(obj).prev().val())));
            var data={
                cartId:cartId,
                itemNum:$(obj).prev().val()
            };
            $.ajax({
                type:'post',
                data:data,
                url:'./user/changeItemNum',
                success:function (data) {
                    if (data == "user_log_out"){
                        layer.confirm('您已退出登录或登录已失效，是否前往登录页面？', {
                            btn: ['去登录', '取消']
                        }, function () {
                            location.href = "./user/loginPage";
                        });
                    }
                }
            });
        };

        window.removeCart = function () {

            var carts = [];

            $.each($('input[name=cartId]:checked'), function () {
                carts.push($(this).val());
            });

            if (carts.length == 0) {
                layer.msg("请选择要移出购物车的商品哦！");
                return;
            }

            $.ajax({
                type: 'post',
                data: JSON.stringify(carts),
                contentType: 'application/json;charset=utf-8',
                url: './user/removeCart',
                success: function (data) {
                    if (data == "user_log_out"){
                        layer.confirm('您已退出登录或登录已失效，是否前往登录页面？', {
                            btn: ['去登录', '取消']
                        }, function () {
                            location.href = "./user/loginPage";
                        });
                    }
                    if (data == "removeSuccess") {
                        layer.msg("移出成功！");
                        location.href = './user/myCart';
                    }
                }

            });
        };

        window.buyCart = function () {
            var carts = [];

            $.each($('input[name=cartId]:checked'), function () {
                carts.push($(this).val());
            });

            if (carts.length == 0) {
                layer.msg("请选择要购买的商品哦！");
                return;
            }
            layer.msg("创建订单中...");
            $("#cartForm").submit();
        };


    });


</script>

</body>
</html>