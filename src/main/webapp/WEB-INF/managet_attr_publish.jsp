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
			$("#attr_publish_class_1_select").append("<option value="+json.id+">"+json.flmch1+"</option>");
		})
	})
})
function attr_publish_change_class_2_by_class_1(class_1_id){
	//var id = $("#spu_publish_class_1_select option:selected").val();
	//alert(class_1_id);
	$.getJSON("js/json/class_2_"+class_1_id+".js",function(data){
		$("#attr_publish_class_2_select").empty();
		$(data).each(function(i,json){
			$("#attr_publish_class_2_select").append("<option value="+json.id+">"+json.flmch2+"</option>");
		});
		
	});
}
function attr_publish_get_attr_by_class_2_id(class_2_id) {
	var class_2_name = $("#attr_publish_class_2_select option:selected").html();	
		$('#attr_inner_grid').datagrid({    
		    url:"get_attr_by_class_2_id_json.do",    
		    queryParams:{"class_2_id":class_2_id,"class_2_name":class_2_name},
		    columns:[[    
		        {field:'id',title:'属性id',width:100},  
		        {field:'shxm_mch',title:'属性名称',width:100}, 
				{field:'chjshj',title:'添加时间',width:200,formatter:function(value,row,index){
		        	var d = new Date(value);
		        	var time = d.toLocaleString();
		        	return time;
		        }}, 
		        {field:'list_value',title:'属性值集合',width:300,formatter:function(value,row,index){
		        	var string = "";
		        	$(value).each(function(i,json){
		        		string += json.shxzh+json.shxzh_mch+" ";
		        	});
		        	return string;
		        }}
		  ]]    
	});  
}

</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>尚硅谷商城—商品属性发布系统</title>
</head>
<body>
	商品属性发布系统<br>
	<select  id="attr_publish_class_1_select" name="flbh1" onchange="attr_publish_change_class_2_by_class_1(this.value)"></select><br>
	<select  id="attr_publish_class_2_select" name="flbh2" onchange="attr_publish_get_attr_by_class_2_id(this.value)"></select><br>
	<div id="attr_publish_attr_inner">
		<jsp:include page="managet_attr_publish_inner.jsp"></jsp:include>
	</div>	
</body>
</html>