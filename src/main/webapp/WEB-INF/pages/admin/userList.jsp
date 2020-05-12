<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>客户信息管理</title>
<base href="${sessionScope.adminbase}/">
	<link href="./static/img/weblogo.jpg" rel="shortcut icon">
<link href="./static/css/layui.css"
	rel="stylesheet" type="text/css" />
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
				<li class="layui-nav-item">${currentAdmin.adminName}</li>
				<li class="layui-nav-item" style="margin-left: 20px;">${currentAdmin.adminLevel}</li>
				<li class="layui-nav-item"><a
					href="./admin/logout">退出登录</a></li>
			</ul>
		</div>

		<div class="layui-side layui-bg-black">
			<div class="layui-side-scroll">
				<!-- 左侧导航区域（可配合layui已有的垂直导航） -->
				<ul class="layui-nav layui-nav-tree">

					<li class="layui-nav-item"><a
						href="./admin/adminIndex">管理员主页</a></li>
					<li class="layui-nav-item"><a
						href="./admin/adminList">管理员列表</a></li>
					<li class="layui-nav-item"><a
						href="./admin/itemList">商品管理</a></li>
					<li class="layui-nav-item layui-nav-itemed"><a
						href="./admin/userList">客户管理</a></li>
					<li class="layui-nav-item"><a 
						href="./admin/orderList">订单管理</a></li>
				</ul>
			</div>
		</div>

		<div class="layui-body">

			<table class="layui-table">
				<thead>
					<tr>
						<th style="width: 30px;"></th>
						<th style="width: 70px;">客户ID</th>
						<th style="width: 75px;">账号</th>
						<th style="width: 75px;">姓名</th>
						<th style="width: 75px;">密码</th>
						<th style="width: 30px;">年龄</th>
						<th style="width: 30px;">性别</th>
						<th style="width: 30px;">等级</th>
						<th style="width: 30px;">经验</th>
						<th style="width: 50px;">头像</th>
						<th style="width: 300px;">个性签名</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${pageInfo.list }" var="user">
						<tr>
							<td><input type="checkbox" name="id"></td>
							<td>${user.userId }</td>
							<td>${user.userAccount }</td>
							<td>${user.userName }</td>
							<td>${user.userPassword }</td>
							<td>${user.userAge }</td>
							<td>${user.userSex }</td>
							<td>${user.userLevel }</td>
							<td>${user.userExp }</td>
							<td><img alt="头像" src="/pic/user_head_pic/${user.userHeadpic }"
								width="50px" height="50px"></td>
							<td>${user.userSignature }</td>

							<td><button type="button" class="layui-btn"
									onclick="deleteUser(${user.userId })">注销</button></td>

						</tr>
					</c:forEach>

				</tbody>
			</table>
			<div>
				<ul style="width: 500px; margin: auto;">
					<c:if test="${pageInfo.pageNum!=1 }">
						<a href="./admin/userList?pageIndex=${pageInfo.pageNum-1 }"><button
								type="button" class="layui-btn layui-btn-primary layui-btn-sm">
								<i class="layui-icon">&#xe603;</i>
							</button></a>
					</c:if>
					<c:forEach begin="1" end="${pageInfo.pages }" varStatus="status">
						<a href="./admin/userList?pageIndex=${status.count }"><button type="button"
								class="layui-btn layui-btn-primary layui-btn-sm">${status.count }</button></a>

					</c:forEach>
					<c:if test="${pageInfo.pageNum!=pageInfo.pages }">
						<a href="./admin/userList?pageIndex=${pageInfo.pageNum+1 }"><button
								type="button" class="layui-btn layui-btn-primary layui-btn-sm">
								<i class="layui-icon">&#xe602;</i>
							</button></a>
					</c:if>

				</ul>
			</div>
		</div>

		<div class="layui-footer">Copyright &copy; 2020.余聪 All rights
			reserved.</div>
	</div>
	<script src="./static/layer.js"></script>
	<script type="text/javascript"
		src="./static/js/jquery.min.js"></script>


</body>
</html>