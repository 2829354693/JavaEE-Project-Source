<%@ page language="java" pageEncoding="UTF-8" %>
<link rel="stylesheet" type="text/css" href="./static/css/index.css"/>
<script type="text/javascript" src="./static/js/jquery-2.0.3.js"></script>

<link href="./static/css/layui.css" rel="stylesheet" type="text/css"/>
<link href="./static/img/weblogo.jpg" rel="shortcut icon">
<script type="text/javascript" src="./static/layui.js"></script>
<script type="text/javascript">


    //用户退出登录
    function logout() {
        layui.use('layer',function () {
            var layer = layui.layer;
            $.ajax({
                type: 'post',
                url: './user/logout',
                success: function (data) {
                    if (data == "logout") {
                        layer.msg("退出登录！");
                        $(".loginfo").load(location.href + " .loginfo");
                    }
                }

            });
        });

    }

    //用于用户中心左边菜单栏的选择项的样式
    /* function setSelectedClass(url) {
        $('div.cont ul.list li a[href~="' + url + '"]').parent().addClass(
                "current");
    } */
</script>
<!--
<script type="text/javascript" src="js/jquery.cookie.js"></script>
<script type="text/javascript" src="js/shopcar.js"></script>
<script type="text/javascript" src="js/template.js"></script> -->