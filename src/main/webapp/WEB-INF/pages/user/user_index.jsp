<%--
  Created by IntelliJ IDEA.
  User: 28293
  Date: 2020/3/6
  Time: 13:58
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
    <jsp:include page="../search.jsp"/>
    <jsp:include page="left.jsp"/>


    <div>
        <div class="main f_r">

            <div class="userinfo_bar">
                <b class="f14">您好，${sessionScope.user.userName} 欢迎回来!</b>
            </div>
            <div class="box clearfix" style="height: 160px;border: 1px solid #e6e2e2;">
                <h3>用户信息</h3>
                <dl class="userinfo_box">
                    <dt>
                        <a class="ico">
                            <img src="/pic/user_head_pic/${sessionScope.user.userHeadpic}" style="border: 1px solid grey" width="100" height="100" alt="加载失败" /></a>
                        <a class="blue" href="./user/userInfoPage" style="position: relative;top: 70px;left: -78px;">修改头像</a>
                    </dt>
                    <dd  style="width: 300px;float: left;position: relative;left: 130px;top: -100px;">
                        <table width="100%" cellpadding="0" cellspacing="0">
                            <col width="350px" />
                            <tr>
                                <td>当前等级：<b class="red2">${sessionScope.user.userLevel}</b></td>
                            </tr>
                            <tr>
                                <td>总经验：<b class="red2">${sessionScope.user.userExp}</b></td>
                            </tr>
                            <tr>
                                <td>聪币余额：<b class="red2">10000</b></td>
                            </tr>
                        </table>

                    </dd>
                </dl>
            </div>

        </div>



    </div>



</div>


</body>
</html>
