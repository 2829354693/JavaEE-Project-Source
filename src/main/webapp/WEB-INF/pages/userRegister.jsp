<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>易购管理员注册页面</title>
    <base href="${base}/">
    <link href="./static/img/weblogo.jpg" rel="shortcut icon">
    <link rel="stylesheet"
          href="./static/css/reset.css"/>
    <link rel="stylesheet"
          href="./static/css/common.css"/>
    <link rel="stylesheet"
          href="./static/css/font-awesome.min.css"/>
    <link href="./static/css/layui.css"
          rel="stylesheet" type="text/css"/>
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
                <div class="login_title">用户注册</div>
                <form class="layui-form">

                    <div class="form_text_ipt">
                        <input name="userAccount" id="userAccount" type="text"
                               placeholder="账号">
                    </div>
                    <div class="form_text_ipt">
                        <input name="userPassword" id="userPassword" type="password"
                               placeholder="密码">
                    </div>
                    <div class="form_text_ipt">
                        <input name="repassword" id="repassword" type="password"
                               placeholder="重复密码">
                    </div>
                    <div class="form_text_ipt">
                        <input name="userName" id="userName" type="text"
                               placeholder="昵称">
                    </div>

                    <div class="form_btn">
                        <button type="button" onclick="requestRegister()">立即注册</button>
                    </div>
                    <div class="form_reg_btn">
                        <span>已有帐号？</span><a
                            href="./user/loginPage">马上登录</a>
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

    layui.use('form', function () {
        var form = layui.form;
        form.render();
    });

    var layer = layui.layer;

    function requestRegister() {
        var userAccount = $("#userAccount").val();
        var userPassword = $("#userPassword").val();
        var repassword = $("#repassword").val();
        var userName = $("#userName").val();

        if (userAccount == "") {
            layer.msg("请输入账号！");
            document.getElementById("userAccount").focus();
            return;
        }
        if (!checkCN(userAccount)) {
            layer.msg("账号不能包含汉字！");
            document.getElementById("userAccount").focus();
            return;
        }
        if (userAccount.length < 3 || userAccount.length > 15) {
            layer.msg("账号长度必须在3-15");
            document.getElementById("userAccount").focus();
            return;
        }
        if (userPassword == "") {
            layer.msg("密码不能为空！");
            document.getElementById("userPassword").focus();
            return;
        }
        if (repassword == "") {
            layer.msg("请再次输入密码！");
            document.getElementById("repassword").focus();
            return;
        }
        if (userPassword != repassword) {
            layer.msg("两次密码不一致！");
            document.getElementById("repassword").focus();
            return;
        }
        if (userName == "") {
            layer.msg("请输入昵称！");
            document.getElementById("userName").focus();
            return;
        }

        var data = {
            "userAccount": userAccount,
            "userPassword": userPassword,
            "userName": userName,
        };

        $.ajax({
            type: 'post',
            url: './user/userRegister',
            contentType: 'application/json;charset=utf-8',
            data: JSON.stringify(data),
            success: function (result) {
                if (result == "userExist") {
                    layer.msg("账号已存在！请更换账号重新注册！");
                    document.getElementById("userAccount").focus();
                    return;
                }
                if (result == "registerSuccess") {
                    layer.load(1, {shade: false});
                    window.location.href = "./user/loginPage";

                }
            }

        });

    }
</script>


</html>