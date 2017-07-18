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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>尚硅谷商城</title>
</head>
<body>
	商品属性列表<br>
	${class_2_id }${class_2_name }<br>
	<c:forEach items="${list_attr }" var="attr">
		${attr.shxm_mch }:<br>
		<c:forEach items="${attr.list_value }" var="val">
			${val.shxzh }${val.shxzh_mch }
		</c:forEach>
	</c:forEach>
	<br>
	<a href="javascript:add_tabs('goto_attr_add.do?class_2_id=${class_2_id}&class_2_name=${class_2_name}','添加分类属性')" >添加分类属性</a><br>
</body>
</html>