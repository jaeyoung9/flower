<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/viewtiles2/include/include-header.jspf"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이달의꽃 - 이벤트</title>
<style type="text/css">

/이벤트/
/* .notice_div{
width: 30%;
    height: 100vh;
    display: block;
    justify-content: center;
    padding: 5rem;
    box-sizing: border-box;
    margin: auto;
}
 */

</style>
</head>
<body>
    <div class="notice_div" align="center">

        <c:forEach items="${notice}" var="notice">
            <h2>${notice.NOTICE_TITLE}<h2>
            <br>
            <div class="noticeImg" >


                <a><img src="images/${notice.STORED_FILE_NOTICE}"
                     /></a>
            </div><br>

                 ${notice.NOTICE_CONTENT}<br>





        </c:forEach>
    </div>
</body>
</html>