<%--
  Created by IntelliJ IDEA.
  User: 28293
  Date: 2020/3/6
  Time: 15:51
  To change this template use File | Settings | File Templates.
--%>
<%--
  Created by IntelliJ IDEA.
  User: 28293
  Date: 2020/3/6
  Time: 13:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <base href="${sessionScope.base }/">
    <meta charset="utf-8">
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <title>用户中心</title>
    <jsp:include page="../base.jsp"/>
</head>
<body class="index">
<div class="container" style="background: white;height: 700px;">
    <jsp:include page="../header.jsp"/>
    <jsp:include page="../navbar.jsp"/>
    <jsp:include page="../search.jsp"/>
    <jsp:include page="left.jsp"/>


    <div style="width: 700px;position: relative;float: right;border: 1px solid #f5f2f2;margin-right: 20px;">
        <form action="./user/userInfoSubmit" method="post" enctype="multipart/form-data"
              class="layui-form layui-form-pane">
            <div class="layui-upload">
                <label>选择头像:</label>
                <input type="file" name="head_pic" id="head_pic" onchange="showSelectedPic(this)">
                <img src="/pic/user_head_pic/${user.userHeadpic}" width="100" height="100" id="show" alt="头像"
                     style="border: 1px solid gray;">
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">您的账号</label>
                <div class="layui-input-inline">
                    <input type="text" readonly="readonly" value="${user.userAccount}" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">您的昵称</label>
                <div class="layui-input-inline">
                    <input type="text" name="userName" required="required" value="${user.userName}" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">您的年龄</label>
                <div class="layui-input-inline">
                    <input type="text" name="userAge" value="${user.userAge}" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item" pane="" style="width: 340px;">
                <label class="layui-form-label">您的性别</label>
                <div class="layui-input-block">
                    <input type="radio" name="userSex" value="男" title="男"
                           <c:if test="${user.userSex eq '男'}">checked="checked" </c:if> >
                    <input type="radio" name="userSex" value="女" title="女"
                           <c:if test="${user.userSex eq '女'}">checked="checked" </c:if> >
                    <input type="radio" name="userSex" value="保密" title="保密"
                           <c:if test="${user.userSex eq '保密'}">checked="checked" </c:if> >
                </div>
            </div>
            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">个性签名</label>
                <div class="layui-input-block">
                    <textarea class="layui-textarea" name="userSignature">${user.userSignature}</textarea>
                </div>
            </div>

            <button type="submit"
                    style="background: linear-gradient(to bottom,#f8bb9d,orange);font-size: 15px;margin-left: 100px;"
                    class="layui-btn layui-btn-warm">保存信息
            </button>

        </form>
    </div>


</div>

<script type="text/javascript">
    layui.use(['form','layer'], function () {
        var form = layui.form,
            layer = layui.layer;
        form.render();


        window.showSelectedPic = function (tag) {
            var file = tag.files[0];
            if (file.size > 5242880) {
                layer.msg("图片大小不能超过5M！");
                var obj = document.getElementById("head_pic");
                obj.outerHTML = obj.outerHTML;
                return;
            }
            console.log(file.name);

            var suffix = file.name.substring(file.name.lastIndexOf(".")+1, file.name.length);
            console.log(suffix);
            if (suffix == "jpg" || suffix == "JPG" || suffix == "png" || suffix == "PNG" || suffix=="jpeg" || suffix=="JPEG") {
                var fr = new FileReader();

                fr.readAsDataURL(file);

                fr.onload = function () {
                    document.getElementById("show").src = fr.result;
                }
            } else {
                layer.msg("请上传后缀为jpg、jpeg、png的图片！");
                var obj1 = document.getElementById("head_pic");
                obj1.outerHTML = obj1.outerHTML;
            }
        }
    });
</script>

</body>
</html>
