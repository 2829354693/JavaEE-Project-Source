<%--
  Created by IntelliJ IDEA.
  User: 28293
  Date: 2020/3/14
  Time: 18:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录失效</title>
    <base href="${sessionScope.base }/">
    <jsp:include page="../base.jsp"/>
</head>
<body>
<div style="text-align: center;"><h1>您已退出登录或登录已失效！</h1></div>
</body>
<script type="text/javascript">
    layui.use(['layer'], function () {
        var layer = layui.layer;

        if (${empty sessionScope.user}){
            layer.confirm('您已退出登录或登录已失效',{
                btn: ['去登录','去首页'],
                cancel:function () {
                    location.href='./index';
                }
            }, function (){
                location.href="./user/loginPage";
            }, function () {
                location.href='./index';
            });
        }

    });

</script>
</html>
