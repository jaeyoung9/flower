<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8" %>
    <%@ include file="/WEB-INF/viewtiles2/include/include-header.jspf" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 확인 결과</title>
<script>
    $(document).ready(function() {
        var USER_ID = "${sessionScope.USER_ID}";
        var message = "${message}";
        if (message != null && message != '') {
            alert(message);
            location.href = "/flower/myPage/checkPwForm";
        } else {
            location.href = "/flower/myPage/myUpdate?USER_ID=${USER_ID}";
        }
    })
</script>
</head>
<body>
    <input type="hidden" id="USER_ID" name="USER_ID" value="${USER_ID}">
</body>
</html>