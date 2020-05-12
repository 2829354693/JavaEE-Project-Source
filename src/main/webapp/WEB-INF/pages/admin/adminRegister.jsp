<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>易购管理员注册页面</title>
<base href="${sessionScope.adminbase}/">
	<link href="./static/img/weblogo.jpg" rel="shortcut icon">
<link rel="stylesheet"
	href="./static/css/reset.css" />
<link rel="stylesheet"
	href="./static/css/common.css" />
<link rel="stylesheet"
	href="./static/css/font-awesome.min.css" />
<link href="./static/css/layui.css"
	rel="stylesheet" type="text/css" />
<style type="text/css">
.login_wrap {
	background: url(./static/img/logo_bg.jpg) no-repeat center;
	background-size: cover;
}

.logo {
	width: 500px;
	height: 150px;
	margin: 0 auto;
	background: url(./static/img/logowz.png) no-repeat center;
}
</style>
</head>
<body>
	<div class="wrap login_wrap">
		<div class="content">

			<div class="logo"></div>

			<div class="login_box">

				<div class="login_form">
					<div class="login_title">管理员注册</div>
					<form id="adminInfo" class="layui-form">

						<div class="form_text_ipt">
							<input name="adminAccount" id="adminAccount" type="text"
								placeholder="账号">
						</div>
						<div class="form_text_ipt">
							<input name="adminPassword" id="adminPassword" type="password"
								placeholder="密码">
						</div>
						<div class="form_text_ipt">
							<input name="repassword" id="repassword" type="password"
								placeholder="重复密码">
						</div>
						<div class="form_text_ipt">
							<input name="adminName" id="adminName" type="text"
								placeholder="管理员姓名">
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">性别</label>
							<div class="layui-input-block">
								<input type="radio" name="adminSex" value="男"
									title="男" checked="checked"> <input type="radio"
									name="adminSex" value="女" title="女">
							</div>
						</div>
						<div class="layui-inline">
							<label class="layui-form-label">管理员级别</label>
							<div class="layui-input-inline">
								<select name="adminLevel" id="adminLevel">
									<option value="超级管理员">超级管理员</option>
									<option value="普通管理员">普通管理员</option>
								</select>
							</div>
						</div>
						<div class="form_btn">
							<button type="button" onclick="requestRegister()">注册</button>
						</div>
						<div class="form_reg_btn">
							<span>已有帐号？</span><a
								href="./admin/index">马上登录</a>
						</div>

					</form>

				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript"
		src="./static/js/jquery.min.js"></script>
	<script src="./static/layui.js"></script>
</body>
<script type="text/javascript">
	function checkCN(str) {
		if (escape(str).indexOf("%u") < 0) { //indexOf()方法查找字符串是否包含"\u" ,如果不包含返回-1

			return true;
		} else {
			return false;
		}
	}

	layui.use('form', function() {
		var form = layui.form;
		form.render();
	});

	var layer = layui.layer;
	
	function requestRegister() {
		var adminAccount = $("#adminAccount").val();
		var adminPassword = $("#adminPassword").val();
		var adminName = $("#adminName").val();
		var adminSex = $('input:radio:checked').val();
		var adminLevel = $("#adminLevel").val();

		if (adminAccount == "") {
			layer.msg("请输入账号！");
			document.getElementById("adminAccount").focus();
			return;
		}
		if (!checkCN(adminAccount)) {
			layer.msg("账号不能包含汉字！");
			document.getElementById("adminAccount").focus();
			return;
		}
		if (adminAccount.length<3 || adminAccount.length>15) {
			layer.msg("账号长度必须在3-15");
			document.getElementById("adminAccount").focus();
			return;
		}
		if ($("#adminPassword").val() == "") {
			layer.msg("密码不能为空！");
			document.getElementById("adminPassword").focus();
			return;
		}
		if ($("#repassword").val() == "") {
			layer.msg("请再次输入密码！");
			document.getElementById("repassword").focus();
			return;
		}
		if ($("#adminPassword").val() != $("#repassword").val()) {
			layer.msg("两次密码不一致！");
			document.getElementById("adminPassword").focus();
			return;
		}

		var data = {
			"adminAccount" : adminAccount,
			"adminPassword" : adminPassword,
			"adminName" : adminName,
			"adminSex" : adminSex,
			"adminLevel" : adminLevel
		};

		$
				.ajax({
					type : 'post',
					url : './admin/adminRegister',
					contentType : 'application/json;charset=utf-8',
					data : JSON.stringify(data),
					success : function(result) {
						if (result == "userExist") {
							layer.msg("账号已存在！请更换账号重新注册！");
							document.getElementById("adminAccount").focus();
							return;
						}
						if (result == "registerSuccess") {
							layer.load(1, {shade: false});
							window.location.href = "./admin/index";
							
						}
					}

				});

	}
</script>



</html>