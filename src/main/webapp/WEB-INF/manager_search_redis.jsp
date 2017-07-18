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
	$('#spu_publish_class_1_select').combobox({
		url:'js/json/class_1.js',
		valueField:'id',
		textField:'flmch1',
		width:100,
		value:'请选择',
		onSelect:function(){
			var class_1_id=$(this).combobox('getValue');
			$('#spu_publish_class_2_select').combobox({
				url:"js/json/class_2_"+class_1_id+".js",
				valueField:'id',
				textField:'flmch2',
				width:100,
				value:'请选择',
				onSelect:function attr_publish_get_attr_by_class_2_id() {
					var class_2_name = $("#attr_publish_class_2_select option:selected").html();	
					$('#attr_inner_grid').datagrid({    
					    url:"get_attr_by_class_2_id_json.do",    
					    queryParams:{"class_2_id":$(this).combobox('getValue'),"class_2_name":class_2_name},
					    columns:[[    
					        {field:'id',title:'属性id',width:100,checkbox:true},  
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
			});
			$('#spu_publish_tm_select').combobox({
			    url:"js/json/tm_class_1_"+class_1_id+".js",    
			    valueField:'id',    
			    textField:'ppmch',
			    width:100,
			    value:'请选择'
	    	});
		}
	})
})
	function refresh_class_2_redis() {
		var class_2_id = $("#spu_publish_class_2_select").combobox('getValue');
		$.post("refresh_class_2_redis.do",{class_2_id:class_2_id},function(data){
			alert("成功刷新"+data+"条二级分类检索数据");
		})
	}
	function refresh_attr_value_redis() {
		var class_2_id = $("#spu_publish_class_2_select").combobox('getValue');
		var attrs = $('#attr_inner_grid').datagrid('getChecked');
		var attr_array = new Array(); 
		$(attrs).each(function(i,json){
			attr_array[i]=json.id;
		})
		$.post("refresh_attr_value_redis.do",{class_2_id:class_2_id,attr_array:attr_array},function(data){
			alert("成功刷新"+data+"条属性检索数据");
		})
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>缓存管理</title>
</head>
<body>
	<div class="easyui-layout" style="height:500px;">
		<div data-options="region:'north',border:false" style="height:100px;">
			<select  id="spu_publish_class_1_select" class="easyui-combobox" name="flbh1" onchange="spu_publish_class_2_by_class_1(this.value)"></select>
			<br>
			<select id="spu_publish_class_2_select" class="easyui-combobox" name="flbh2"></select>
			<br>
			<select name="pp_id" class="easyui-combobox"  id="spu_publish_tm_select" ></select>
		</div>
		<div data-options="region:'center'">
			<div class="easyui-datagrid" id="attr_inner_grid"></div>
			<a href="javascript:refresh_class_2_redis();">刷新二级分类缓存</a>
			<br>
			<a href="javascript:refresh_attr_value_redis();">刷新属性检索缓存</a>
		</div>
	</div>		
</body>
</html>