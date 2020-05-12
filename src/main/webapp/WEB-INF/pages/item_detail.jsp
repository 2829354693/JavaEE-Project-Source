<%@ page language="java" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
    <base href="${sessionScope.base}/"/>
    <meta charset="utf-8"/>
    <title>详情_${sessionScope.site}</title>

    <jsp:include page="base.jsp"/>
    <script type="text/javascript">


        $(function () {
            $("#add").on("click", function () {
                $("#buyNums").val(parseInt($("#buyNums").val()) + 1);
            });
            $("#reduce").on("click", function () {
                if ($("#buyNums").val() == 1) {
                    return;
                }
                $("#buyNums").val(parseInt($("#buyNums").val()) - 1);
            });

        });

        //加入购物车
        function joinCart() {
            layui.use("layer", function () {
                var layer = layui.layer;

                if (${empty sessionScope.user}) {
                    layer.confirm('您还未登录，是否前往登录页面？', {
                        btn: ['去登录', '取消']
                    }, function () {
                        location.href = "./user/loginPage";
                    });
                } else {
                    var buyNums = $("#buyNums").val();
                    var itemId =${item.itemsId};
                    $.ajax({
                        type: 'post',
                        data: {buyNums: buyNums, itemId: itemId},
                        url: './user/joinCart',
                        success: function (data) {
                            if (data === "joinSuccess") {
                                layer.alert('添加到购物车成功！', {
                                    icon: 1
                                });
                            }
                        }
                    });

                }

            });

        }

        function order_add() {
            layui.use("layer", function () {
                var layer = layui.layer;

                if (${empty sessionScope.user}) {
                    layer.confirm('您还未登录，是否前往登录页面？', {
                        btn: ['去登录', '取消']
                    }, function () {
                        location.href = "./user/loginPage";
                    });
                } else {
                    layer.msg("请稍等...");
                    $("#detailForm").submit();
                }


            });
        }


    </script>
    <style type="text/css">

    </style>
</head>
<body class="index">
<div class="container" style="background: white;">
    <jsp:include page="header.jsp"/>
    <jsp:include page="navbar.jsp"/>
    <jsp:include page="search.jsp"/>
    <div class="wrapper clearfix">
        <div class="summary">
            <h2>${item.itemsName}</h2>
            <!--基本信息区域-->
            <ul>
                <li><span class="f_r light_gray">商品编号：<label
                        id="data_goodsNo">${item.itemsId}</label></span></li>
                <li id="priceLi">销售价：<b class="price red2"><span
                        class="f30" id="real_price">￥${item.itemsPrice}</span></b></li>
                <li>库存：现货<span>(<label id="data_storeNums">大量有货</label>)
					</span></li>
            </ul>
            <form method="post" action="./user/goToOrderPage" id="detailForm">
                <div class="current">
                    <dl class="m_10 clearfix">
                        <dt>购买数量：</dt>
                        <dd>
                            <input class="gray_t f_l" type="text" id="buyNums" value="1" name="buyNum"
                                   maxlength="5"/>
                            <input type="hidden" name="itemsId" value="${item.itemsId}">
                            <div class="resize">
                                <a class="add" id="add">+</a> <a class="reduce" id="reduce">-</a>
                            </div>
                        </dd>
                    </dl>
                    <input class="buy_but" type="button" id="buyNowButton"
                           value="立即购买" onclick="order_add();"/>

                    <div class="shop_cart" style="z-index: 1">
                        <input class="joincart_btn" type="button" id="joinCarButton"
                               onclick="joinCart();" value="加入购物车"/>
                    </div>
                </div>
            </form>
        </div>

        <div style="border: 1px solid lightgrey">
            <img src="/pic/items_pic/${item.itemsPic}" width="350" height="350" style="border: 1px solid lightgrey"
                 alt="商品图片">
        </div>


    </div>

    <div class="wrapper clearfix container_2">
        <!--左边栏-->
        <div class="sidebar f_l">
            <div class="box m_10">
                <div class="title">热卖商品</div>
                <div class="content">
                    <ul class="ranklist">
                        <c:forEach begin="1" end="5">
                            <li class="current"><a href=""><img width="58px"
                                                                height="58px" alt="华为Mate30Pro"
                                                                src="./static/img/new_comment_pic.jpg"/></a> <a
                                    title="苹果（Apple）iPhone 6 (A1586) 64GB" class="p_name" href="">华为Mate30Pro</a> <b>￥5688.00</b>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
        </div>

        <div class="item_detail_tab">
            <div class="layui-tab">
                <ul class="layui-tab-title">
                    <li class="layui-this">商品简介</li>
                    <li id="get_comment" onclick="getComment()">商品评论</li>
                </ul>
                <div class="layui-tab-content">
                    <div class="layui-tab-item layui-show">
                        <div style="font-weight: bold;">${item.itemsDetail}</div>
                    </div>
                    <div class="layui-tab-item">
                        <div>
                            <c:if test="${allowComment!=null}">
                                <div>
                                    <form enctype="multipart/form-data" id="comment_form">
                                        <input type="hidden" name="commentGrade" id="grade_input"/>
                                        <input type="hidden" name="commentItemid" value="${item.itemsId}">
                                        <div class="comment_form">
                                            <textarea cols="52" rows="3" name="commentContent" id="content"></textarea>
                                            <div style="float: right;">
                                                <input type="file" name="comment_pic" id="imagefile"
                                                       onchange="showCommentPic()">
                                                <img src="" width="70" height="70" alt="" id="showPic">
                                            </div>
                                            <br>
                                            <b>对此商品的评价：</b>
                                            <div id="grade"></div>
                                            <input type="button" value="发布评论" onclick="addComment()"
                                                   class="add_comment_btn" style="">
                                        </div>
                                    </form>
                                </div>
                            </c:if>
                            <c:if test="${!empty sessionScope.user && allowComment==null}">
                                <strong>购买后方可评论。</strong>
                            </c:if>
                            <c:if test="${empty sessionScope.user}">
                                <strong>登录购买后方可评论。</strong>
                            </c:if>
                            <div id="comment">

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <jsp:include page="help.jsp"/>
    <jsp:include page="footer.jsp"/>
</div>
<script type="text/javascript">

    layui.use(['element', 'rate', 'layer'], function () {
        var rate = layui.rate,
            element = layui.element,
            layer = layui.layer;

        rate.render({
            elem: '#grade'
            , value: 5
            , text: true
            , setText: function (value) { //自定义文本的回调
                var arrs = {
                    '1': '极差'
                    , '2': '差'
                    , '3': '中等'
                    , '4': '好'
                    , '5': '极好'
                };
                this.span.text(arrs[value] || (value + "星"));
            }
        });

        window.showCommentPic=function () {
            var file = document.getElementById("imagefile").files[0];
            if (file.size>5242880){
                layer.msg("图片大小不能超过5M！");
                var obj = document.getElementById("imagefile");
                obj.outerHTML=obj.outerHTML;
                return;
            }
            var suffix = file.name.substring(file.name.lastIndexOf(".")+1,file.name.length);
            if (suffix=="jpg"||suffix=="JPG"||suffix=="png"||suffix=="PNG" || suffix=="jpeg" || suffix=="JPEG"){
                var fr = new FileReader();

                fr.readAsDataURL(file);

                console.log(fr.result);
                fr.onload = function () {
                    document.getElementById("showPic").src = fr.result;
                };
            } else {
                layer.msg("请上传后缀为jpg、jpeg、png的图片！");
                var obj1 = document.getElementById("imagefile");
                obj1.outerHTML=obj1.outerHTML;
            }
        };


        window.addComment = function () {

            $("#grade_input").val($("#grade").children("span").text());

            if ($("#content").val().length == 0) {
                layer.msg("说点评论内容吧...");
                $("#content").focus();
            } else {
                var form = new FormData($("#comment_form")[0]);
                // $("#comment_form").submit();
                $.ajax({
                    type: 'post',
                    url: './comment/addComment',
                    data: form,
                    processData: false,
                    contentType: false,
                    success: function (data) {
                        if (data == "user_log_out"){
                            layer.confirm('您已退出登录或登录已失效，是否前往登录页面？', {
                                btn: ['去登录', '取消']
                            }, function () {
                                location.href = "./user/loginPage";
                            });
                        }
                        if (data == "commment_success"){
                            layer.msg("评论成功！");
                            $("#get_comment").click();
                        }
                    }

                });
            }
        };

        window.getComment=function(){
        // $("#get_comment").click(function () {
            $("#comment").html("");
            $.ajax({
                type: 'post',
                url: './comment/getComments',
                data: {itemId:${item.itemsId}},
                success: function (result) {
                    var commentList = result;
                    if (commentList.length == 0 || commentList == null) {
                        $("#comment").append("<strong>该商品暂无评价。</strong>");
                    } else {
                        for (var i = 0; i < commentList.length; i++) {
                            var userName=commentList[i].userName;
                            var userHeadPic=commentList[i].userHeadPic;
                            var userLevel=commentList[i].userLevel;
                            var content=commentList[i].content;
                            var grade=commentList[i].grade;
                            var commentPic=commentList[i].commentPic;
                            var timeNumString=commentList[i].commentTime;
                            var commentTime=new Date(timeNumString).Format("yyyy-MM-dd HH:mm:ss");

                            var text = "";
                            text += "<div class=\"comment_fa_div\">";
                            text += "                                    <div class=\"comment_fa_div1\">";
                            text += "                                        <div style=\"float: left;\">";
                            text += "                                            <img src=\"/pic/user_head_pic/"+userHeadPic+"\" width=\"60px\" height=\"60\" style=\"float: left;border:1px solid #e9e9e9;\" alt=\"头像\">";
                            text += "                                            <div>等级："+userLevel+"</div>";
                            text += "                                        </div>";
                            text += "                                        <div style=\"width: 435px;float: left;\">";
                            text += "                                            <div style=\"float: left;\">";
                            text += "                                                "+userName+"";
                            text += "                                            </div>";
                            text += "                                            <br>";
                            text += "                                            <div class=\"comment_content\">";
                            text += "                                                "+content+"";
                            text += "                                            </div>";
                            text += "                                        </div>";
                            text += "                                        <div class=\"comment_bottom\">";
                            text += "                                            <div style=\"float: right;\">";
                            text += "                                                "+commentTime+"";
                            text += "                                            </div>";
                            text += "                                            <div style=\"float: right;margin-right: 10px;\">";
                            text += "                                                评价："+grade+"";
                            text += "                                            </div>";
                            text += "                                        </div>";
                            text += "                                    </div>";
                            text += "                                    <div class=\"comment_pic_div\">";
                            text += "                                        <div style=\"float: left;\">评论图片：</div>";
                            text += "                                        <img src=\"/pic/comment_pic/"+commentPic+"\" width=\"70\" height=\"70\" class=\"comment_pic\" alt=\"无图片\">";
                            text += "                                    </div>";
                            text += "                                </div>";

                            $("#comment").append(text);
                        }

                    }


                }
            });


        };


    });

    Date.prototype.Format = function(fmt)
    {
        var o = {
            "M+" : this.getMonth()+1,                 //月份
            "d+" : this.getDate(),                    //日
            "H+" : this.getHours(),                   //小时
            "m+" : this.getMinutes(),                 //分
            "s+" : this.getSeconds(),                 //秒
            "q+" : Math.floor((this.getMonth()+3)/3), //季度
            "S"  : this.getMilliseconds()             //毫秒
        };
        if(/(y+)/.test(fmt))
            fmt=fmt.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length));
        for(var k in o)
            if(new RegExp("("+ k +")").test(fmt))
                fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));
        return fmt;
    };

</script>
</body>
</html>