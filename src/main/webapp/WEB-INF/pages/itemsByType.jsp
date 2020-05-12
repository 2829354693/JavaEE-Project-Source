<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <base href="${sessionScope.base }/">
    <meta charset="utf-8">
    <title>商品</title>
    <jsp:include page="base.jsp"/>
</head>
<body class="index">
<div class="container" style="background: white;">
    <jsp:include page="header.jsp"/>
    <jsp:include page="navbar.jsp"/>
    <jsp:include page="search.jsp"/>

    <div style="height: auto;">
        <ul>
            <c:forEach items="${items }" var="item">
                <li class="itemdisplay">
                    <div class="items-wrap">
                        <div class="item-pic">
                            <a href="./items/itemDetail?item_id=${item.itemsId}"><img alt="${item.itemsName }"
                                                                                      src="/pic/items_pic/${item.itemsPic }"
                                                                                      width="182px" height="182px"></a>
                            <div class="p-price">
                                <strong> <em>￥</em> <i>${item.itemsPrice }</i>
                                </strong>
                            </div>
                        </div>
                        <a href="./items/itemDetail?item_id=${item.itemsId}">
                            <div class="p-name">${item.itemsName }</div>
                        </a>
                        <div class="p-comment">
                            <strong> <a href="">0条评价</a>
                            </strong>
                        </div>
                        <div class="p-icons">
                            <i class="item-icon1">自营</i> <i class="item-icon2">放心购</i> <i
                                class="item-icon3">闪购</i>
                        </div>
                        <div class="p-operate">
                            <a onclick="joinCart(${item.itemsId})">加入购物车</a>
                        </div>

                    </div>
                </li>
            </c:forEach>
        </ul>
        <div style="height:1px; margin-top:-1px;clear: both;overflow:hidden;"></div>
    </div>


    <jsp:include page="footer.jsp"/>

</div>

<script type="text/javascript">
    layui.use('layer', function () {

        var layer = layui.layer;
        window.joinCart = function (itemId) {
            if (${empty sessionScope.user}) {
                layer.confirm('您还未登录，是否前往登录页面？', {
                    btn: ['去登录', '取消']
                }, function () {
                    location.href = "./user/loginPage";
                });
            } else {
                var buyNums = 1;
                $.ajax({
                    type: 'post',
                    data: {buyNums: buyNums, itemId: itemId},
                    url: './user/joinCart',
                    success: function (data) {
                        if (data === "joinSuccess") {
                            layer.alert('添加到购物车成功！', {
                                icon: 1
                            });
                        }
                    }
                });

            }


        }


    });


</script>
</body>
</html>