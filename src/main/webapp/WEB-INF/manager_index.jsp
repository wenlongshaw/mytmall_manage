<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath %>" />

<link rel="stylesheet" type="text/css" href="js/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="js/easyui/themes/icon.css">
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript">
	$(function(){
		var p = "${useto}";
		var url = "${url}";
		add_tabs(url+".do",p);
	})
	function add_tabs(url,title) {
		var tab = $('#index_tabs').tabs('exists',title);
		if(!tab){
			$.get(url,function(data){
				$('#index_tabs').tabs('add',{    
				    title:title,    
				    content:data,    
				    closable:true,    
				});  
			})
		}else{
			 $('#index_tabs').tabs('select',title);
		}
	}

</script>
<title>尚硅谷商城后台管理首页</title>
</head>
<body class="easyui-layout">
	<div data-options="region:'north',border:false" style="height:60px;background:#B3DFDA;padding:10px">north region</div>
	<div data-options="region:'west',split:true,title:'West'" style="width:250px;padding:10px;">
		<ul class="easyui-tree">
			<li>
				<span>商品发布管理</span>
				<ul>
					<li><a href="javascript:add_tabs('goto_spu_publish.do','商品spu信息发布')" >商品spu信息发布</a></li>
					<li><a href="javascript:add_tabs('goto_attr_publish.do','商品属性信息发布')" >商品属性信息发布</a></li>
					<li><a href="javascript:add_tabs('goto_sku_publish.do','商品sku信息发布')" >商品sku信息发布</a></li>
				</ul>
			</li>
			<li>
				<span>商品缓存管理</span>
				<ul>
					<li><a href="javascript:;" >分类缓存管理</a></li>
					<li><a href="javascript:add_tabs('goto_search_redis.do','属性缓存管理')" >属性缓存管理</a></li>
					<li>用户缓存管理</li>
				</ul>
			</li>
		</ul>
	</div>
	<div data-options="region:'east',split:true,collapsed:true,title:'East'" style="width:100px;padding:10px;">east region</div>
	<div data-options="region:'center',title:'Center'">
		<div id="index_tabs" class="easyui-tabs"></div>
	</div>
	
	
	
</body>
</html>