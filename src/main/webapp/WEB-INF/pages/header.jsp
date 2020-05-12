<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="header">
	<h1 class="logo">
		<a style="background: url(static/img/logo.jpg);" href=""></a>
	</h1>
	<ul class="shortcut">
		<li class="first"><a href="./user/userIndex">会员中心</a></li>
		<li><a href="./user/orders">我的订单</a></li>
		<li><a href="./admin/index">后台管理系统</a></li>
		<li class='last'><a href="">使用帮助</a></li>
	</ul>
	<p class="loginfo">
		<!-- 判断当前用户登录状态-显示不同选项-->
		<c:if test="${not empty sessionScope.user}">
			${sessionScope.user.userName}您好，欢迎来到${sessionScope.site}！[<a href="javascript:;" onclick="logout()" class="reg">安全退出</a>] [<a href="./user/userIndex">个人中心</a>]
		</c:if>
		<c:if test="${empty sessionScope.user}">
			[<a href="./user/loginPage">登录</a>
			<a class="reg" href="./user/regPage">免费注册</a>]
	  </c:if>
	</p>
</div>