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
	function spu_publish_class_2_by_class_1(class_1_id){
		//var id = $("#spu_publish_class_1_select option:selected").val();
		//alert(class_1_id);
		$.getJSON("js/json/class_2_"+class_1_id+".js",function(data){
			$("#spu_publish_class_2_select").empty();
			$(data).each(function(i,json){
				$("#spu_publish_class_2_select").append("<option value="+json.id+">"+json.flmch2+"</option>");
			});
			
		});
		spu_publish_change_tm_by_class_1(class_1_id);
	}
	
	function spu_publish_change_tm_by_class_1(class_1_id){
		//var id = $("#spu_publish_class_1_select option:selected").val();
		//alert(class_1_id);
		$.getJSON("js/json/tm_class_1_"+class_1_id+".js",function(data){
			$("#spu_publish_tm_select").empty();
			$(data).each(function(i,json){
				$("#spu_publish_tm_select").append("<option value="+json.id+">"+json.ppmch+"</option>");
			});
		});
	}
	function spu_publish_image_button(index) {
		$("#file_"+index).click();
	}
	function spu_publish_show_image(index) {
		var image = $("#file_"+index)[0].files[0];
		// document
		var url = window.URL.createObjectURL(image);
		
		$("#image_"+index).attr("src",url);
		
		var length = $("#spu_image_div :file").length;
		
		if(index==length&&length<5){
			$("#spu_img_length").html("你还可以添加"+(5-length)+"张图片"); 
			spu_publish_add_image(index);
		}
		if(length>=5){
			$("#spu_img_length").html("图片数量已达上限")
		}
	}
	 function spu_publish_add_image(index){
		var div1="<div style='float:left;'>";
		var div2="</div>";
		var img = "<img id='image_"+(index+1)+"' style='cursor:pointer;' alt='' src='image/f6e352f99f892b49672b57f65eb01de1.jpg' width='50px' height='50px' onclick='spu_publish_image_button("+(index+1)+")' style='cursor:pointer;margin-left:10px;'/>"
		var input = "<input id='file_"+(index+1)+"' style= 'display:none' type='file' name='files' onchange='spu_publish_show_image("+(index+1)+")' /><br>"
		$("#spu_image_div").append(div1+img+input+div2);
	} 

</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>尚硅谷商城</title>
</head>
<body>
	spu信息发布<br>
	<form action="save_spu.do" enctype="multipart/form-data" method="post">
		<select  id="spu_publish_class_1_select" class="easyui-combobox" name="flbh1" onchange="spu_publish_class_2_by_class_1(this.value)"></select><br>
		
		<select id="spu_publish_class_2_select" class="easyui-combobox" name="flbh2"></select>
		<br>
		<select name="pp_id" class="easyui-combobox"  id="spu_publish_tm_select" ></select>
		<br>
		商品名称<input type="text" name="shp_mch"/><br>
		商品描述<input type="text" name="shp_msh"/><br>
		商品图片:<span id="spu_img_length" style="color:red">你还可以添加5张图片</span><br>
		<div id="spu_image_div">
		<div style="float:left">
			<img id="image_1" style="cursor:pointer;" alt="" src="image/f6e352f99f892b49672b57f65eb01de1.jpg" width="50px" height="50px" onclick="spu_publish_image_button(1) " />
			<input id="file_1" style= "display:none" type="file" name="files" onchange="spu_publish_show_image(1)" /><br>
		</div>
		</div>
		<input type="submit" value="提交"/>
	</form>
</body>
</html>