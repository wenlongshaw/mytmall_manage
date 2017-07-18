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
	
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>尚硅谷商城</title>
</head>
<body>
	分类属性列表<br>
	请选择属性：<br>
	<c:forEach items="${list_attr }" var="attr" varStatus="index">
		<input type="checkbox" name="list_sku_attr_value[${index.index}].shxm_id" value="${attr.id}">${attr.shxm_mch }:${attr.id }<br>
	</c:forEach>
	请选择属性值：<br>
	<c:forEach items="${list_attr }" var="attr" varStatus="index">
		<c:forEach items="${attr.list_value }" var="val" varStatus="index_2">
		<input type="radio" name="list_sku_attr_value[${index.index}].shxzh_id" value="${val.id}"/>${val.shxzh }${val.shxzh_mch }:${val.id }
		</c:forEach><br>
	</c:forEach>
	<br>
	<hr>
	库存：<input type="text" name="kc"/><br>
	价格：<input type="text" name="jg"/><br>
	名称：<input type="text" name="sku_mch"/><br>
	地址：<input type="text" name="kcdz"/><br>
	<input type="submit" value="发布库存信息"/>
</body>
</html>