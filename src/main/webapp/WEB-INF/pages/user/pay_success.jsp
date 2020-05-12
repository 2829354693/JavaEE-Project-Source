<%--
  Created by IntelliJ IDEA.
  User: 28293
  Date: 2020/3/15
  Time: 22:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <base href="${sessionScope.base }/">
    <meta charset="utf-8">
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <title>用户中心</title>
    <jsp:include page="../base.jsp" />
</head>
<body class="index">
<div class="container" style="background: white;height: 700px;">
    <jsp:include page="../header.jsp"/>
    <jsp:include page="../navbar.jsp"/>


    <div>

        <div class="pay_suc" style="">
            购买成功！请到<a href="./user/orders">订单中心</a>查看...（此为个人项目，所有交易均为虚拟^_^）,<a href="./">回到首页...</a><a href="./user/myCart">回到购物车...</a>
        </div>
        <div style="margin: 10px auto auto 300px;color: #ff6c00;">
            您的总经验值为：${exp}，目前等级：${level}。
        </div>
    </div>



</div>


</body>
</html>
