<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
	$(function() {

		$('.mycart').hover(function() {
			$('#div_mycart').show();
			if (${empty sessionScope.user}){
				$("#total_price").html("￥0.00");
			}
			if (${!empty sessionScope.user}){
				$.get("./user/cartItemNumAndPrice",function (data) {
					var obj = data;
					$("#total_num").html(obj.totalItemNum);
					$("#total_price").html("￥"+obj.totalPrice);
				});
			}
		}, function() {
			$('#div_mycart').hide();
		});

	});
</script>


<div class="navbar">
	<ul>
		<li style=" margin-left: 5px;"><a href="">首页</a></li>
		<c:forEach items="${types }" var="type">
			<li style="margin-left: 30px;"><a title="${type }" href="./items/itemsByType?type=${type }">${type }</a></li>
		</c:forEach>
	</ul>

	<div class="mycart" style="background: linear-gradient(to bottom,#fa8247,#f6bf5a);">
		<dl>
			<dt>
				<a href="./user/myCart" style="color: white;">购物车</a>
			</dt>
			<dd>
				<a href="./user/myCart">去结算</a>
			</dd>
		</dl>

		<!--购物车浮动div 开始-->
		<div class="shopping" id="div_mycart" style="display: none;">
			<dl class="cartlist" id="shopcarDiv">
				<dd class="static">
					<span>共<b id="total_num">0</b>件商品
					</span>金额总计：<b id="total_price">￥0.00</b>
				</dd>
				<dd class="static">
					<label  style="background: oldlace;" class="btn_orange"><input type="button"
						value="去购物车结算" onclick="location.href='./user/myCart'" /></label>
				</dd>
			</dl>
		</div>

	</div>
</div>