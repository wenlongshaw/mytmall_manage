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
	var attr_publish_add_table_index=0;
	function attr_publish_add_add_table(){
		attr_publish_add_table_index++;
		
		var a = '<table border="1" width="600px"  id="attr_publish_add_table_'+attr_publish_add_table_index+'">'+
			'<tr><td>属性名：<input name="list_attr['+attr_publish_add_table_index+'].shxm_mch" type="text"/></td><td></td><td>'+
			'<a href="javascript:attr_publish_add_add_tr('+attr_publish_add_table_index+')">添加值</a></td></tr>'+
			'<tr><td>属性值：<input name="list_attr['+attr_publish_add_table_index+'].list_value[0].shxzh" type="text"/></td><td>属性值名称：<input name="list_attr['+attr_publish_add_table_index+'].list_value[0].shxzh_mch" type="text"/></td><td></td></tr>'+
		'</table>';
		$("#attr_publish_add_table").append(a);
	}
	function attr_publish_add_add_tr(table_index) {

		var tr_index = $("#attr_publish_add_table_"+table_index+" tr").length-1;
		
		var tr='<tr><td>属性值：<input name="list_attr['+table_index+'].list_value['+tr_index+'].shxzh" type="text"/></td><td>属性值名称：<input name="list_attr['+table_index+'].list_value['+tr_index+'].shxzh_mch" type="text"/></td><td></td></tr>';
		$("#attr_publish_add_table_"+table_index).append(tr);
	}

</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>尚硅谷商城</title>
</head>
<body>
	添加分类属性<br>${class_2_name}
	<form action="save_attr.do" method="post">
		<input type="hidden" value="${class_2_name}" name="class_2_name"/>
		<input type="hidden" value="${class_2_id}" name="class_2_id"/>
		<a href="javascript:attr_publish_add_add_table()">添加属性</a>
		<div id="attr_publish_add_table">
			<table border="1" width="600px"  id="attr_publish_add_table_0">
				<tr><td>属性名：<input name="list_attr[0].shxm_mch" type="text"/></td><td></td><td><a href="javascript:attr_publish_add_add_tr(0)">添加值</a></td></tr>
				<tr><td>属性值：<input name="list_attr[0].list_value[0].shxzh" type="text"/></td><td>
					    属性值名称：<input name="list_attr[0].list_value[0].shxzh_mch" type="text"/></td><td></td></tr>
			</table>
		</div>
		
		<br>
		<input type="submit" value="提交"/>	
		
	</form>
</body>
</html>