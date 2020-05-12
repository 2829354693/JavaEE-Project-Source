<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>管理员详细信息页面</title>
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
				<li class="layui-nav-item layui-nav-itemed"><a
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
					<li class="layui-nav-item"><a
						href="./admin/userList">客户管理</a></li>
					<li class="layui-nav-item"><a 
						href="./admin/orderList">订单管理</a></li>
				</ul>
			</div>
		</div>

		<div class="layui-body">

			<form class="layui-form layui-form-pane" style="width: 500px;margin: auto;padding: 50px;">
				<div class="layui-form-item">
					<label class="layui-form-label">管理员编号</label>
					<div class="layui-input-inline">
						<input type="text" name="" readonly="readonly" class="layui-input"
							value="${currentAdmin.adminUserid }">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">管理员账号</label>
					<div class="layui-input-inline">
						<input type="text" name="" readonly="readonly" class="layui-input"
							value="${currentAdmin.adminAccount }">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">管理员性别</label>
					<div class="layui-input-inline">
						<input type="text" name="" readonly="readonly" class="layui-input"
							value="${currentAdmin.adminSex }">
					</div>
				</div>

				<div class="layui-form-item">
					<label class="layui-form-label">管理员姓名</label>
					<div class="layui-input-inline">
						<input type="text" name="adminName" id="adminName"
							required="required" class="layui-input"
							value="${currentAdmin.adminName }">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">管理员密码</label>
					<div class="layui-input-inline">
						<input type="text" name="adminPassword" id="adminPassword"
							required="required" class="layui-input"
							value="${currentAdmin.adminPassword }">
					</div>
				</div>


				<button type="button" class="layui-btn layui-btn-lg"
					onclick="adminUpdate()">保存信息</button>
			</form>


		</div>

		<div class="layui-footer">Copyright &copy; 2020.余聪 All rights
			reserved.</div>
	</div>
	<%-- <script src="./static/js/layui.js"></script> --%>
	<script type="text/javascript"
		src="./static/js/jquery.min.js"></script>
	<script src="./static/layer.js"></script>
	<script type="text/javascript">
	
		function adminUpdate() {
			var adminName = $("#adminName").val();
			var adminPassword = $("#adminPassword").val();

			var data = {
				"adminName" : adminName,
				"adminPassword" : adminPassword
			};

			$.ajax({
						type : 'post',
						url : './admin/adminUpdate',
						contentType : 'application/json;charset=utf-8',
						data : JSON.stringify(data),
						success : function(result) {
							if (result == "success") {
								layer.msg('保存成功！');

							}
						}

					});

		}
	</script>


</body>
</html>