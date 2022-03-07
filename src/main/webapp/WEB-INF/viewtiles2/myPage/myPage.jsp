<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/viewtiles2/include/include-header.jspf"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이달의꽃 - 마이페이지</title>
<style type="text/css">
.mypagemain{
   width: 30%;
   display: block;
   justify-content: center;
   text-align: left;
   margin: auto;
}
.mypagetop{
margin-top: 100px;
left: 50px;
top:30px;
position: absolute;
}
.mypageorder{
display: block;
margin-top: 365px;
}
.mypageorderimg{
position: absolute;
left: 50px;
}
.mypageorderlist{
position: relative;
right: 180px;
top: 0px;
}
.mypagebaesong{
position: relative;
left: 270px;
bottom: 115px;
}
.mypageorder-btn{
position: relative;
left: 130px;
bottom: 85px;
}
.box-mypage{
display: block;
    width: 100%;
    height: 51px;
    border: solid 1px #dadada;
    padding: 4px 12px 4px 12px;
    box-sizing: border-box;
    background: #fff;
    position: relative;
}
.mypagetrans{
width: 20%;
position: absolute;
left: -140px;
bottom: 0px;

}
</style>
</head>
<body>
   <div class="mypagemain">
   
      <div class="mypagetop"><h1>마이페이지</h1>
      <a href="/flower/myPage/checkPwForm"><p>회원정보수정</p></a> <a href=""><p>주문내역</p></a>
   </div>

      <input type="hidden" id="USER_NUM" value="${USER_NUM}">
      <%-- 아이디 히든으로 숨김 --%>
      <div class="mypageorder">
      <c:forEach items="${orderList}" var="orderList">
         <div class="mypageorderimg">
         <img src='images/${orderList.STORED_FILE_THUMB}' height="100" width="140" /></a>
            </div>
         <div class="mypageorderlist">
         ${orderList.GOODS_TITLE}<br><br>
         <fmt:formatNumber value="${orderList.ORDER_PRICE}" pattern="#,###"/>원
         </div>
         <div class="mypagebaesong">
         <div class="mypagetrans">
         <span class="mypage">
         <input type="text" class="text" placeholder="${orderList.TRANS}" readonly="readonly">
         </span>
         </div>
         <a
            href="https://service.epost.go.kr/iservice/usr/trace/usrtrc001k01.jsp">배송조회</a><br>
         </div>
         <div class="mypageorder-btn">
         <button class="w-btn w-btn-pink" type="button"
            onClick="location.href='/flower/reviewDetail?ORDER_NUM=${orderList.ORDER_NUM}&GOODS_INDEX=${orderList.GOODS_INDEX}'">리뷰</button>
         <button class="w-btn w-btn-pink" type="button"
            onClick="location.href='/flower/reviewWritePage?ORDER_NUM=${orderList.ORDER_NUM}'">리뷰작성</button>
         </div>
      </c:forEach>
      </div>
   </div>
   <span class="bottom"></span>
</body>
</html>