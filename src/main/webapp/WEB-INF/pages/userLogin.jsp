<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>易购管理员登录页面</title>
<base href="${base}/">
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
	margin: 0px auto;
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
					<div class="login_title">用户登录</div>
					<form>
						<div class="form_text_ipt">
							<input name="userAccount" type="text" id="userAccount" placeholder="手机号/邮箱">
						</div>

						<div class="form_text_ipt">
							<input name="userPassword" type="password" id="userPassword" placeholder="密码">
						</div>

						<div class="form_check_ipt">
							<!-- <div class="left check_left">
								<label><input name="" type="checkbox"> 下次自动登录</label>
							</div> -->
							<div class="right check_right">
								<a href="#">忘记密码</a>
							</div>
						</div>
						<div class="form_btn">
							<button type="button" onclick="requestLogin()">登录</button>
						</div>
						

					</form>
					<div class="form_reg_btn">
							<span>还没有帐号？</span><a
								href="./user/regPage">马上注册</a>
					</div>
					<!-- <div class="other_login">
						<div class="left other_left">
							<span>其它登录方式</span>
						</div>
						<div class="right other_right">
							<a href="#"><i class="fa fa-qq fa-2x"></i></a> <a href="#"><i
								class="fa fa-weixin fa-2x"></i></a> <a href="#"><i
								class="fa fa-weibo fa-2x"></i></a>
						</div>
						
					</div> -->
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript"
		src="./static/js/jquery.min.js"></script>
	<script src="./static/layer.js"></script>
	<script type="text/javascript">
	
		function requestLogin() {
			var userAccount = $("#userAccount").val();
			var userPassword = $("#userPassword").val();
			if (userAccount == "") {
				layer.msg("账号不能为空！");
				document.getElementById("userAccount").focus();
				return;
			}
			else if (userPassword == "") {
				layer.msg("密码不能为空！");
				document.getElementById("userPassword").focus();
				return;
			}
			else{
				$.ajax({
					type:'post',
					url:'./user/userLogin',
					data:{userAccount:userAccount, userPassword:userPassword },
					success:function(result){
						if (result=="noAccount") {
							layer.msg("账号不存在！请先注册！");
							return;
						}
						else if (result=="passwordError") {
							layer.msg("密码错误！");
							return;
						}
						else{
							
							window.location.href ="./index";
							layer.msg("登录成功!");
						}
						
					}
				});
			}
			
			
		}

	
	</script>
	<%-- <script type="text/javascript"
		src="${pageContext.request.contextPath }/static/js/common.js"></script> --%>
</body>
<script type="text/javascript">

</script>
</html>