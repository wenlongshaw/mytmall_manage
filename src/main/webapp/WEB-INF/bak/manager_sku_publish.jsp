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
<script type="text/javascript">
	$(function(){
		$.getJSON("js/json/class_1.js",function(data){
			$(data).each(function(i,json){
				//alert(json.flmch1);
				$("#sku_publish_class_1_select").append("<option value="+json.id+">"+json.flmch1+"</option>");
			})
		})
	})
	function sku_publish_class_2_by_class_1(class_1_id){
		//var id = $("#sku_publish_class_1_select option:selected").val();
		//alert(class_1_id);
		$.getJSON("js/json/class_2_"+class_1_id+".js",function(data){
			$("#sku_publish_class_2_select").empty();
			$(data).each(function(i,json){
				$("#sku_publish_class_2_select").append("<option value="+json.id+">"+json.flmch2+"</option>");
			});
			
		});
		sku_publish_change_tm_by_class_1(class_1_id);
	}
	
	function sku_publish_change_tm_by_class_1(class_1_id){
		//var id = $("#sku_publish_class_1_select option:selected").val();
		//alert(class_1_id);
		$.getJSON("js/json/tm_class_1_"+class_1_id+".js",function(data){
			$("#sku_publish_tm_select").empty();
			$(data).each(function(i,json){
				$("#sku_publish_tm_select").append("<option value="+json.id+">"+json.ppmch+"</option>");
			});
		});
	}
	function sku_publish_get_attr_by_class_2_id(class_2_id){
		var class_2_name = $("#sku_publish_class_2_select option:selected").html();
		$.post("get_sku_by_class_2_id.do",{"class_2_id":class_2_id,"class_2_name":class_2_name},function(data){
			$("#sku_publish_attr_inner").html(data);
		});
	}
	function sku_publish_get_spu_by_class_1_class_2_tm() {
		var class_2_id = $("#sku_publish_class_2_select").val();
		var class_1_id = $("#sku_publish_class_1_select").val();
		var tm_id = $("#sku_publish_tm_select").val();
		
		$.post("get_spu_by_class_1_class_2_tm.do",{"class_2_id":class_2_id,"class_1_id":class_1_id,"tm_id":tm_id},function(data){
			$(data).each(function(i,json){
				$("#sku_publish_spu_select").append("<option value="+json.id+">"+json.shp_mch+"</option>");
			});
		});
	}

</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>尚硅谷商城</title>
</head>
<body>
	sku信息发布<br>
	<form action="add_sku.do" enctype="multipart/form-data" method="post">
		<select  id="sku_publish_class_1_select"  onchange="sku_publish_class_2_by_class_1(this.value)"></select><br>
		
		<select id="sku_publish_class_2_select"  onchange="sku_publish_get_attr_by_class_2_id(this.value)"></select>
		<br>
		<select  id="sku_publish_tm_select" onChange="sku_publish_get_spu_by_class_1_class_2_tm()"></select>
		<br>
		<select name="shp_id"  id="sku_publish_spu_select"></select>
		<br>
		<div id="sku_publish_attr_inner"></div>
		<br>
		
	</form>
</body>
</html>