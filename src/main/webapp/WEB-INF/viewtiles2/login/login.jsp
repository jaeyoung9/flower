<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/viewtiles2/include/include-header.jspf" %>
<!DOCTYPE html>
<html>
<head>

<script charset="utf-8"></script>
<script type="text/javascript">
$(document).ready(function(){ 
	var message = "${message}";
	if(message!=null && message!=''){
		alert(message);
		location.href = "<c:url value='/loginForm'/>";
	}else{
		alert("로그인 성공!");
		location.href = "<c:url value='/main'/>";
	}
})
</script>
</head>
</html>