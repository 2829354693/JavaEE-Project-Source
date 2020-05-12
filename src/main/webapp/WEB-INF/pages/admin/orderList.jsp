<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>订单管理</title>
    <base href="${sessionScope.adminbase}/">
    <link href="./static/img/weblogo.jpg" rel="shortcut icon">
    <link href="./static/css/layui.css"
          rel="stylesheet" type="text/css"/>
</head>
<body>

<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">易购管理员后台系统</div>
        <ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item"><a
                    href="./admin/adminInfo">基本资料</a></li>

        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">${currentAdmin.adminName}</li>
            <li class="layui-nav-item" style="margin-left: 20px;">${currentAdmin.adminLevel}</li>
            <li class="layui-nav-item"><a
                    href="./admin/logout">退出登录</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <ul class="layui-nav layui-nav-tree">

                <li class="layui-nav-item"><a
                        href="./admin/adminIndex">管理员主页</a></li>
                <li class="layui-nav-item"><a
                        href="./admin/adminList">管理员列表</a></li>
                <li class="layui-nav-item"><a
                        href="./admin/itemList">商品管理</a></li>
                <li class="layui-nav-item"><a
                        href="./admin/userList">客户管理</a></li>
                <li class="layui-nav-item layui-nav-itemed"><a
                        href="./admin/orderList">订单管理</a></li>
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <c:if test="${pageInfo!=null}">
            <table class="layui-table">
                <thead>
                <tr>
                    <th style="width: 30px;"></th>
                    <th style="width: 100px;">订单ID</th>
                    <th style="width: 100px;">下单用户ID</th>
                    <th style="width: 200px;">创建时间</th>
                    <th style="width: 105px;">订单状态</th>
                    <th style="width: 305px;">订单留言</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>

                <c:forEach items="${pageInfo.list }" var="order">
                    <tr>
                        <td><input type="checkbox" name="" value="${order.orderId }"></td>
                        <td>${order.orderId }</td>
                        <td>${order.userId }</td>
                        <td><fmt:formatDate value="${order.orderCreatetime }"
                                            type="BOTH" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                        <td>${order.orderState }</td>
                        <td>${order.orderMessage }</td>
                        <td>
                            <c:if test="${order.orderState=='待付款' }">
                                <button type="button" class="layui-btn"
                                        onclick="remindUserPay(${order.orderId })">提醒付款
                                </button>
                            </c:if>
                            <c:if test="${order.orderState=='已付款' }">
                                <button type="button" class="layui-btn"
                                        onclick="deliverNow(${order.orderId })">立即发货
                                </button>
                            </c:if>
                            <button type="button" class="layui-btn"
                                    onclick="queryItemsByOrder(this)">查看此订单商品
                            </button>
                            <form method="post" action="./admin/seeOrderItem">
                                <input type="hidden" name="pageIndex" value="${pageInfo.pageNum}">
                                <input type="hidden" name="orderId" value="${order.orderId}">
                            </form>
                        </td>

                    </tr>
                </c:forEach>

                </tbody>
            </table>
            <c:if test="${pageInfo.total>6}">
                <div>
                    <ul style="width: 500px; margin: auto;">
                        <c:if test="${pageInfo.pageNum!=1 }">
                            <a href="./admin/orderList?pageIndex=${pageInfo.pageNum-1 }">
                                <button
                                        type="button" class="layui-btn layui-btn-primary layui-btn-sm">
                                    <i class="layui-icon">&#xe603;</i>
                                </button>
                            </a>
                        </c:if>
                        <c:forEach begin="1" end="${pageInfo.pages }" varStatus="status">
                            <a href="./admin/orderList?pageIndex=${status.count }">
                                <button type="button"
                                        class="layui-btn layui-btn-primary layui-btn-sm">${status.count }</button>
                            </a>

                        </c:forEach>
                        <c:if test="${pageInfo.pageNum!=pageInfo.pages }">
                            <a href="./admin/orderList?pageIndex=${pageInfo.pageNum+1 }">
                                <button
                                        type="button" class="layui-btn layui-btn-primary layui-btn-sm">
                                    <i class="layui-icon">&#xe602;</i>
                                </button>
                            </a>
                        </c:if>

                    </ul>
                </div>
            </c:if>
        </c:if>
        <c:if test="${orderItems!=null}">
            <div>
                <div><a href="./admin/orderList?pageIndex=${pageIndex}" style="color: red;text-decoration: revert;">《--返回订单列表</a></div>
                <div style="font-weight: bold;">此订单(${orderId})包含的商品信息如下：</div>
                <div>
                    <c:forEach items="${orderItems}" var="orderItem">
                        <div style="width: 100%;height: 100px;border: 1px solid grey;">
                            <img src="/pic/items_pic/${orderItem.itemPic}" style="float: left;" width="100px" height="100px" alt="商品图片">
                            <a style="float: left"
                               href="./items/itemDetail?item_id=${orderItem.itemId}"><strong>${orderItem.itemName}</strong></a>
                            <strong style="margin-left:50px;color: red;">￥${orderItem.itemPrice*orderItem.itemNum}</strong>
                            <div style="margin-left: 150px;margin-top: 20px;">数量：${orderItem.itemNum}</div>
                        </div>
                    </c:forEach>
                    <strong style="color: red;">总计：￥${totalPrice}</strong>
                </div>
            </div>
        </c:if>
    </div>

    <div class="layui-footer">Copyright &copy; 2020.余聪 All rights
        reserved.
    </div>
</div>
<script src="./static/layer.js"></script>
<script type="text/javascript"
        src="./static/js/jquery.min.js"></script>
<script type="text/javascript">
    function queryItemsByOrder(obj) {
        $(obj).next("form").submit();
    }

</script>

</body>
</html>