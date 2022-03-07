<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/viewtiles2/include/include-header.jspf"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 마이페이지</title>
<style type="text/css">
.t{
width: 50%;
height: 100vh;
display: block;
justify-content: center;
text-align: left;
padding: 5rem;
box-sizing: border-box;
margin: auto;
font-size: 60px;
}
</style>

</head>
<body>
<div class="t">
    <div>
        <a href="/flower/aminMyPage/userList">회원관리</a>
    </div>
    <div>
        <a href="/flower/aminMyPage/orderList">주문받은내역</a>
    </div>
    <div>
        <a href="/flower/goodsWritePage">판매글작성</a>
    </div>
    <div>
        <a href="/flower/notice/writePage">이벤트작성</a>
    </div>
    <div>
        <a href="/flower/aminBoardList">판매글 및 이벤트 삭제</a>
    </div>
    </div>
</body>
</html>