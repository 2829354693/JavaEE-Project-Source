<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>易购管理员登录页面</title>
<base href="${sessionScope.adminbase}/">
	<link href="./static/img/weblogo.jpg" rel="shortcut icon">
<link rel="stylesheet"
	href="./static/css/reset.css" />
<link rel="stylesheet"
	href="./static/css/common.css" />
<link rel="stylesheet"
	href="./static/css/font-awesome.min.css" />
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
					<div class="login_title">管理员登录</div>
					<form>
						<div class="form_text_ipt">
							<input name="account" type="text" id="account" placeholder="手机号/邮箱">
						</div>

						<div class="form_text_ipt">
							<input name="password" type="password" id="password" placeholder="密码">
						</div>

						<div class="form_check_ipt">
							<div class="right check_right">
								<a href="#">忘记密码</a>
							</div>
						</div>
						<div class="form_btn">
							<button type="button" onclick="requestLogin()">登录</button>
						</div>
						

					</form>
					<div class="form_reg_btn">
						<span>暂不开放注册通道<a href="./">去首页</a> </span>
					</div>

				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript"
		src="./static/js/jquery.min.js"></script>
	<script src="./static/layer.js"></script>
	<script type="text/javascript">
	
		function requestLogin() {
			var account = $("#account").val();
			var password = $("#password").val();
			if (account == "") {
				layer.msg("账号不能为空！");
				document.getElementById("account").focus();

			}
			else if (password == "") {
				layer.msg("密码不能为空！");
				document.getElementById("password").focus();

			}
			else{
				$.ajax({
					type:'post',
					url:'./admin/adminLogin',
					data:{account:account, password:password },
					success:function(result){
						if (result=="noAccount") {
							layer.msg("账号不存在！请先注册！");

						}
						else if (result=="passwordError") {
							layer.msg("密码错误！");

						}
						else{
							
							window.location.href ="./admin/adminIndex";
							layer.msg("登录成功!");
						}
						
					}
				});
			}
			
			
		}

	
	</script>
</body>
<script type="text/javascript">

</script>
</html>