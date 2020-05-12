<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>商品查询结果</title>
<base href="${sessionScope.adminbase}/">
	<link href="./static/img/weblogo.jpg" rel="shortcut icon">
<link href="./static/css/layui.css"
	rel="stylesheet" type="text/css" />
</head>
<body>

	<div class="layui-layout layui-layout-admin">
		<div class="layui-header">
			<div class="layui-logo">易购管理员后台系统</div>
			<ul class="layui-nav layui-layout-left">
				<li class="layui-nav-item"><a
					href="./admin/adminInfo">基本资料</a></li>
				<li class="layui-nav-item"><a
					href="./admin/addItem">商品上架</a></li>
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
					<li class="layui-nav-item layui-nav-itemed"><a
						href="./admin/itemList">商品管理</a></li>
					<li class="layui-nav-item"><a
						href="./admin/userList">客户管理</a></li>
					<li class="layui-nav-item"><a 
						href="./admin/orderList">订单管理</a></li>
				</ul>
			</div>
		</div>

		<div class="layui-body">
			<form class="layui-form layui-form-pane" action="./admin/queryItems">
				<ul style="display: inline-flex;height: 40px;padding-top: 10px;">
					<li>
						<div class="layui-form-item">
							<label class="layui-form-label">ID</label>
							<div class="layui-input-inline">
								<input type="text" name="itemsId" placeholder="输入ID"
									class="layui-input">
							</div>
						</div>
					</li>
					<li>
						<div class="layui-form-item">
							<label class="layui-form-label">商品名称</label>
							<div class="layui-input-inline">
								<input type="text" name="itemsName" placeholder="输入商品名称"
									class="layui-input">
							</div>
						</div>
					</li>
					<li>
						<button type="submit" class="layui-btn">搜索商品</button>
					</li>
				</ul>
			</form>
			<table class="layui-table">
				<thead>
					<tr>
						<th style="width: 30px;"></th>
						<th style="width: 70px;">商品ID</th>
						<th style="width: 100px;">商品图片</th>
						<th style="width: 200px;">商品名称</th>
						<th style="width: 105px;">商品类型</th>
						<th style="width: 75px;">商品价格</th>
						<th style="width: 300px;">商品描述</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>

					<c:forEach items="${selectedItems }" var="item">
						<tr>
							<td><input type="checkbox" name="id"></td>
							<td>${item.itemsId }</td>
							<td><img alt="商品图片" src="/pic/items_pic/${item.itemsPic }"
								width="100px" height="100px"></td>
							<td>${item.itemsName }</td>
							<td>${item.itemsType }</td>
							<td>${item.itemsPrice }</td>
							<td>${item.itemsDetail }</td>

							<td><div class="layui-btn-group">
									<a
										href="./admin/updateItem?updateItemId=${item.itemsId}"><button
											type="button" class="layui-btn">修改</button></a>
									<button type="button" class="layui-btn"
										onclick="deleteItem(${item.itemsId })">下架</button>
								</div></td>

						</tr>
					</c:forEach>

				</tbody>
			</table>
			
		</div>

		<div class="layui-footer">Copyright &copy; 2020.余聪 All rights
			reserved.</div>
	</div>
	<%-- <script src="./static/layer.js"></script> --%>
	<script type="text/javascript"
		src="./static/js/jquery.min.js"></script>



</body>
</html>