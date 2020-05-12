<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>上架商品</title>
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
				<!-- 左侧导航区域（可配合layui已有的垂直导航） -->
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
			<fieldset class="layui-elem-field layui-field-title"
				style="margin-top: 30px;">
				<legend>商品上架</legend>
			</fieldset>
			<form method="post" enctype="multipart/form-data" name="itemForm"
				class="layui-form" style="width: 500px;margin: auto;">

				<div class="layui-form-item">
					<label class="layui-form-label">商品名称</label>
					<div class="layui-input-inline">
						<input type="text" name="itemsName" id="itemsName"
							placeholder="商品名称" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item" style="width: 200px;">
					<label class="layui-form-label">商品类型</label>
					<div class="layui-input-block">
						<select name="itemsType">
							<option value="数码">数码</option>
							<option value="服饰">服饰</option>
							<option value="日用">日用</option>
							<option value="母婴">母婴</option>
							<option value="装饰">装饰</option>
							<option value="其它" selected="selected">其它</option>
						</select>
					</div>
				</div>

				<div class="layui-form-item">
					<div class="layui-inline">
						<label class="layui-form-label">价格</label>
						<div class="layui-input-inline">
							<input type="text" name="itemsPrice" id="price" required="required"
								autocomplete="off" class="layui-input">
						</div>
					</div>
				</div>

				<div class="layui-form-item layui-form-text">
					<label class="layui-form-label">商品描述</label>
					<div class="layui-input-block">
						<textarea placeholder="请输入商品描述" name="itemsDetail"
							class="layui-textarea"></textarea>
					</div>
				</div>

				<div>
					<input type="file" name="items_Pic">
				</div>

				<button type="button" onclick="addItem()"
					class="layui-btn layui-btn-primary">添加商品</button>
			</form>
		</div>

		<div class="layui-footer">Copyright &copy; 2020.余聪 All rights
			reserved.</div>
	</div>
	<script src="./static/layui.js"
		charset="utf-8"></script>
	<script type="text/javascript"
		src="./static/js/jquery.min.js"></script>
	
	<script type="text/javascript">
		layui.use('form', function() {
			var form = layui.form;
			form.render();
		});
		
		var layer = layui.layer;
		
		function addItem() {
			var price = $("#price").val();
			var itemsName = $("#itemsName").val();
			var regPos = /^\d+(\.\d+)?$/;
			
			if(itemsName === "" || itemsName ==null){
				layer.alert("请输入商品名称！");
				document.getElementById("itemsName").focus();
				return;
			}
			
			if(price.length==0 || price ==null || price==""){
				layer.alert("请在价格处输入数字！");
				document.getElementById("price").focus();
				return;
			}
		   	if(regPos.test(price)){
		   		document.itemForm.action="./admin/itemSubmit";
		        document.itemForm.submit();
		        layer.load(1, {shade: false});
		   	}
		   	else{
		   		layer.alert("请在价格处输入数字！");
		   		document.getElementById("price").focus();
			}
		}
		
	</script>
</body>
</html>