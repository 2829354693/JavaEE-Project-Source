<%@ page language="java" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <base href="${sessionScope.base}/"/>
    <title>首页_${sessionScope.site}</title>
    <jsp:include page="base.jsp"/>
</head>

<body class="index">
<div class="container" style="background: white;">
    <jsp:include page="header.jsp"/>
    <jsp:include page="navbar.jsp"/>
    <jsp:include page="search.jsp"/>

    <div class="wrapper clearfix">
        <div class="sidebar f_l">
            <!--热卖商品-->
            <div class="hot box m_10">
                <div class="title">
                    <h2 style="color: orange;">热卖商品</h2>
                </div>
                <div class="cont clearfix">
                    <ul class="prolist">
                        <!--此处热门商品为空-->
                        <c:forEach items="${hotItems}" var="hotItem">
                            <li><a href="./items/itemDetail?item_id=${hotItem.itemsId}" title="${hotItem.itemsName}"
                                   target="_blank">
                                <img src="/pic/items_pic/${hotItem.itemsPic }" width="80" height="80"
                                     alt="热卖商品"/>
                            </a>
                                <p class="pro_title">
                                    <a title="${hotItem.itemsName}" href="./items/itemDetail?item_id=${hotItem.itemsId}"
                                       target="_blank">${hotItem.itemsName}</a>
                                </p>
                                <p class="brown">
                                    <b>￥${hotItem.itemsPrice}</b>
                                </p></li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
            <!--热卖商品-->
        </div>

        <h2></h2>
        <div class="main f_l">
            <!--最新商品 start-->
            <div class="box yellow m_10" style="height: 380px;">

                <div>
                    <div class="title title3" style="width: 299px;float: left;margin-top: 0px;">
                        <h2 style="color: orange;">最新商品</h2>
                    </div>
                    <div class="title title3" style="">
                        <h2 style="color: orange;">最新活动</h2>
                    </div>
                </div>
                <div class="layui-carousel" id="test1" style="float: left;">
                    <div carousel-item="">
                        <c:forEach items="${newItems }" var="newItem">
                            <div>
                                <a title="${newItem.itemsName }"
                                   href="./items/itemDetail?item_id=${newItem.itemsId}"><img alt="最新商品"
                                                                                             src="/pic/items_pic/${newItem.itemsPic }"></a>
                            </div>
                        </c:forEach>

                    </div>
                </div>

                <div class="layui-carousel" id="test2"
                     style="float: left; width: 440px; height: 320px;">
                    <div carousel-item="">
                        <div><img alt="活动1" src="./static/img/pic1.jpg"></div>
                        <div><img alt="活动2" src="./static/img/pic2.jpg"></div>
                        <div><img alt="活动3" src="./static/img/pic3.jpg"></div>
                        <div><img alt="声明" src="./static/img/pic4.jpg" width="440"></div>
                    </div>
                </div>

            </div>
            <!--最新商品 end-->

            <!--商品分类展示 start-->
            <!--商品分类统计-->
            <div class="category box">
                <div class="title2">
                    <h2 style="color: orange;">商品分类</h2>
                </div>
            </div>

            <table id="index_category" class="sort_table m_10" width="100%">
                <tr>
                    <td><c:forEach items="${typeAndNum}" var="tan">
                        <a href="./items/itemsByType?type=${tan.itemTypeName }" target="_blank">
                                ${tan.itemTypeName}（${tan.itemNumByType}）</a>|
                    </c:forEach></td>
                </tr>
            </table>



            <!--最新评论 start-->
            <div class="comment box m_10">
                <div class="title title3">
                    <h2 style="color: orange;">最新评论</h2>
                </div>
                <div class="cont clearfix">
                    <c:forEach begin="1" end="4">
                        <dl class="no_bg">
                            <dt>
                                <a href=""><img src="./static/img/new_comment_pic.jpg" width="66"
                                                height="66"></a>
                            </dt>
                            <dd>
                                <a href="">华为Mate30Pro</a>
                            </dd>
                            <dd>
                                <span class="grade"><i style="width: 42px"></i></span>
                            </dd>
                            <dd class="com_c">很好用！</dd>
                        </dl>
                    </c:forEach>
                </div>
            </div>
            <!--最新评论 end-->
        </div>
    </div>
    <jsp:include page="help.jsp"/>
    <jsp:include page="footer.jsp"/>

</div>
<script type="text/javascript">

    layui.use([ 'carousel' ], function() {
        var carousel = layui.carousel;

        carousel.render({
            elem : '#test1',
            width : '40%',
            interval: 1200,
            anim: 'fade',
            height : 320,
            arrow : 'always'
        });
        carousel.render({
            elem : '#test2',
            width : 440,
            interval: 1200,
            anim: 'fade',
            height : 320,
            arrow : 'always'
        });
    });

</script>
</body>
</html>