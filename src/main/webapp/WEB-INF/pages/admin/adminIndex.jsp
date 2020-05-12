<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>易购管理员登录页面</title>
<base href="${sessionScope.adminbase}/">
	<link href="./static/img/weblogo.jpg" rel="shortcut icon">
<link href="./static/css/layui.css"
	rel="stylesheet" type="text/css" media="all" />
</head>
<body>

	<div class="layui-layout layui-layout-admin">
		<div class="layui-header">
			<div class="layui-logo">易购管理员后台系统</div>
			<!-- 头部区域（可配合layui已有的水平导航） -->
			<ul class="layui-nav layui-layout-left">
				<li class="layui-nav-item"><a
					href="./admin/adminInfo">基本资料</a></li>

			</ul>
			<ul class="layui-nav layui-layout-right">
				<li class="layui-nav-item">${adminName}</li>
				<li class="layui-nav-item" style="margin-left: 20px;">${level}</li>
				<li class="layui-nav-item"><a
					href="./admin/logout">退出登录</a></li>
			</ul>
		</div>

		<div class="layui-side layui-bg-black">
			<div class="layui-side-scroll">
				<!-- 左侧导航区域（可配合layui已有的垂直导航） -->
				<ul class="layui-nav layui-nav-tree">

					<li class="layui-nav-item layui-nav-itemed"><a
						href="./admin/adminIndex">管理员主页</a></li>
					<li class="layui-nav-item"><a
						href="./admin/adminList">管理员列表</a></li>
					<li class="layui-nav-item"><a
						href="./admin/itemList">商品管理</a></li>
					<li class="layui-nav-item"><a
						href="./admin/userList">客户管理</a></li>
					<li class="layui-nav-item"><a 
						href="./admin/orderList">订单管理</a></li>
				</ul>
			</div>
		</div>

		<div class="layui-body">
			<fieldset class="layui-elem-field layui-field-title"
				style="margin-top: 20px;">
				<legend>易购系统详细条规</legend>
			</fieldset>
			<div style="padding: 20px; background-color: #F2F2F2;">
				<div class="layui-row layui-col-space15">
					<div class="layui-col-md6">
						<div class="layui-card">
							<div class="layui-card-header">管理员等级权限</div>
							<div class="layui-card-body">
								管理员等级分为超级管理员、普通管理员。超级管理员可以查看所有管理员的详细信息包括密码，可以对所有管理员进行销号处理。普通管理员可以查看除了密码外的所有管理员信息。</div>
						</div>
					</div>
					<div class="layui-col-md6">
						<div class="layui-card">
							<div class="layui-card-header">管理员信息修改</div>
							<div class="layui-card-body">
								管理员可以对自己的信息进行修改，但不能修改自己的id、账号、性别。</div>
						</div>
					</div>
					<div class="layui-col-md6">
						<div class="layui-card">
							<div class="layui-card-header">管理员能做什么？</div>
							<div class="layui-card-body">
								管理员能查看所有的商品信息、客户信息、客户的订单信息，可以对客户的订单进行处理，可以对已付款订单进行发货处理，可以处理客户的退款请求。可以对客户进行销号，可以删除客户对商品的不良评论。可以发布商品，下架商品，更改商品相关信息。对各种信息的查询。
							</div>
						</div>
					</div>

					<div class="layui-col-md12">
						<div class="layui-card">
							<div class="layui-card-header">客户的等级制度</div>
							<div class="layui-card-body">客户初始等级为1级，经验为0。从1级到2级需要1经验，从2级到3级需要2经验，3级到4级需要3经验...以此类推，目前最高等级为10级。每成功购买一件商品，将根据商品价格增加经验。</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="layui-footer">Copyright &copy; 2020.余聪 All rights
			reserved.</div>
	</div>
	<script src="./static/layui.js"
		charset="utf-8"></script>


</body>
</html>