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
function attr_publish_goto_attr_add(){
	var class_2_name = $("#attr_publish_class_2_select option:selected").html();
	var class_2_id = $("#attr_publish_class_2_select").val();
	var url = "goto_attr_add.do?class_2_id="+class_2_id+"&class_2_name="+class_2_name;
	add_tabs(url,'添加分类属性');
}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>尚硅谷商城</title>
</head>
<body>
	商品属性列表<br>
	${class_2_id }${class_2_name }<br>
	<div class="easyui-datagrid" id="attr_inner_grid"></div>
	<br>
	<a href="javascript:attr_publish_goto_attr_add();">添加分类属性</a><br>
</body>
</html>