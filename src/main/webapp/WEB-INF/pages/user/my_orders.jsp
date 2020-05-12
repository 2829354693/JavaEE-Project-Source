<%--
  Created by IntelliJ IDEA.
  User: 28293
  Date: 2020/3/20
  Time: 17:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <base href="${sessionScope.base }/">
    <meta charset="utf-8">
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <title>用户中心</title>
    <jsp:include page="../base.jsp"/>
</head>
<body class="index">
<div class="container" style="background: white;height: 100%;overflow: hidden;">
    <jsp:include page="../header.jsp"/>
    <jsp:include page="../navbar.jsp"/>
    <jsp:include page="../search.jsp"/>
    <jsp:include page="left.jsp"/>


    <div style="float:right;">
        <c:if test="${pageInfo!=null}">
            <div>
                <table class="layui-table" style="width: 750px;">
                    <thead>
                    <tr>
                        <th style="width: 100px;">订单ID</th>
                        <th style="width: 80px">下单时间</th>
                        <th style="width: 110px;">订单状态</th>
                        <th style="width: 313px;">订单信息</th>
                        <th style="width: 30px;">操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${pageInfo.list}" var="order">
                        <tr>
                            <td>${order.orderId}</td>
                            <td><fmt:formatDate value="${order.orderCreatetime}" type="BOTH"
                                                pattern="yyyy-MM-dd HH:mm:ss"/></td>
                            <td>${order.orderState}</td>
                            <td>${order.orderMessage}</td>
                            <td>
                                <button type="button" class="order_see_detail_btn"
                                        onclick="seeOrderItem(this)">查看此订单商品
                                </button>
                                <form method="post" action="./user/seeOrderItem">
                                    <input type="hidden" name="pageIndex" value="${pageInfo.pageNum}">
                                    <input type="hidden" name="orderId" value="${order.orderId}">
                                </form>
                                <c:if test="${order.orderState eq '待付款'}">
                                    <button type="button" class="order_buy_btn" onclick="buyOrder('${order.orderId}')">
                                        购买
                                    </button>
                                </c:if>
                                <button type="button" class="order_del_btn"
                                        onclick="delOrder(this,'${order.orderId}')">删除
                                </button>
                            </td>
                        </tr>
                    </c:forEach>

                    </tbody>
                </table>
                <c:if test="${pageInfo.total>5}">
                    <div>
                        <ul style="width: 500px; margin: auto;">
                            <c:if test="${pageInfo.pageNum!=1 }">
                                <a href="./user/orders?pageIndex=${pageInfo.pageNum-1 }" style="text-decoration: none;">
                                    <button
                                            type="button" class="layui-btn layui-btn-primary layui-btn-sm">
                                        <i class="layui-icon">&#xe603;</i>
                                    </button>
                                </a>
                            </c:if>
                            <c:forEach begin="1" end="${pageInfo.pages }" varStatus="status">
                                <a href="./user/orders?pageIndex=${status.count }" style="text-decoration: none;">
                                    <button type="button"
                                            class="layui-btn layui-btn-primary layui-btn-sm">${status.count }</button>
                                </a>
                            </c:forEach>
                            <c:if test="${pageInfo.pageNum!=pageInfo.pages }">
                                <a href="./user/orders?pageIndex=${pageInfo.pageNum+1 }" style="text-decoration: none;">
                                    <button
                                            type="button" class="layui-btn layui-btn-primary layui-btn-sm">
                                        <i class="layui-icon">&#xe602;</i>
                                    </button>
                                </a>
                            </c:if>

                        </ul>
                    </div>
                </c:if>
            </div>
        </c:if>

        <c:if test="${orderItems!=null}">
            <div style="float: left;margin-left: 50px;">
                <div>
                    <div><a href="./user/orders?pageIndex=${pageIndex}">《--返回订单列表</a></div>
                    <div>此订单号（${orderId}）包含的商品如下：</div>
                    <c:forEach items="${orderItems}" var="orderItem">
                        <div style="width: 500px;height: 70px;border: 1px solid #f6631b;margin-top: 10px;">
                            <img style="float: left" src="/pic/items_pic/${orderItem.itemPic}" width="70" height="70"
                                 alt="商品图片">
                            <a style="float: left"
                               href="./items/itemDetail?item_id=${orderItem.itemId}"><strong>${orderItem.itemName}</strong></a>
                            <strong style="float: right;color: red;">￥${orderItem.itemPrice*orderItem.itemNum}</strong>
                            <div style="float: right;">数量：${orderItem.itemNum}</div>
                        </div>
                    </c:forEach>
                </div>
            </div>
            <strong style="color: red;position: relative;left: -100px;">总计：￥${totalPrice}</strong>

        </c:if>

    </div>


</div>

<script type="text/javascript">
    layui.use('layer', function () {
        var layer = layui.layer;

        window.buyOrder = function (orderId) {
            location.href = './user/buyFromOrder?orderId=' + orderId;
        };

        window.delOrder = function (obj, orderId) {
            $.ajax({
                type: 'post',
                data: {orderId: orderId},
                url: './user/delOrder',
                success: function (data) {
                    if (data == "user_log_out"){
                        layer.confirm('您已退出登录或登录已失效，是否前往登录页面？', {
                            btn: ['去登录', '取消']
                        }, function () {
                            location.href = "./user/loginPage";
                        });
                    }
                    if (data == "delSuccess") {
                        $(obj).parent().parent().remove();
                        layer.msg("删除此订单成功！");
                    }
                }
            });
        };

        window.seeOrderItem = function (obj) {
            $(obj).next("form").submit();

        }

    });


</script>
</body>
</html>

