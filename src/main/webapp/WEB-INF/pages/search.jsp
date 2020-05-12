<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="searchbar">
	<div class="allsort">
		<a href="javascript:void(0);">全部商品分类</a>

		<!--总的商品分类-开始-->
		<ul class="sortlist" id="div_allsort" style='display: none'>
			<c:forEach items="${types}" var="type">
				<a href="./items/itemsByType?type=${type }">
					<li>
						<h2>${type}</h2>
					</li>
				</a>
			</c:forEach>
		</ul>
	</div>

	<div class="searchbox">
		<form method='post' class="layui-form layui-form-pane" action='./items/searchItems'>
			<ul style="display: inline-flex;">
				<li style="height: 38px;">
					<div class="layui-form-item">
						<div class="layui-input-inline">
							<input style="background-color: #ffecc7; height: 30px;"
								type="text" name="queryWords" placeholder="请输入商品名称关键字"
								class="layui-input">
						</div>
					</div>
				</li>
				<li>
					<button type="submit" class="layui-btn layui-btn-sm"
						style="background: linear-gradient(to bottom,#fe6115,orange);margin-right: 5px;">搜索</button>
				</li>
				<li>
					<button type="reset" class="layui-btn layui-btn-sm"
						style="background: linear-gradient(to bottom,#fe6115,orange);">清空</button>
				</li>
			</ul>


			<%-- <input type='hidden' name='controller' value='site' />
			<input type='hidden' name='action' value='search_list' />
			<c:choose>
				<c:when test="${word ne null}">
					<input type="text" name='word' autocomplete="off"
						   placeholder="${word}" />
				</c:when>
				<c:otherwise>
					<input type="text" name='word' autocomplete="off"
						   placeholder="输入关键字..." />
				</c:otherwise>
			</c:choose>

			<input type="submit" value="商品搜索"
				   onclick="checkInput('word','输入关键字...');" /> --%>
		</form>
	</div>
	<%--<div class="hotwords">热门搜索：</div>--%>
</div>

<script>
	$(function() {
		$(".allsort").hover(function() {
			$('#div_allsort').show();
		}, function() {
			$('#div_allsort').hide();
		});
	});
</script>