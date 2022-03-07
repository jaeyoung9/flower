<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/viewtiles2/include/include-header.jspf"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 받은 내역</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style type="text/css">

.orderlist {
width: 65%;
height: 100vh;
display: block;
justify-content: center;
padding: 5rem;
box-sizing: border-box;
margin: auto;
}

</style>
</head>
<body>
	<div class="orderlist">
		<h1>주문 받은 내역</h1>
		
		<c:forEach var="orderList" items="${orderList}">
			<tr align="center" id="row">
				 <br>
					<div>
						<img src="../images/${orderList.STORED_FILE_THUMB}" height="100" width="100"/> <br>
						주문 번호: ${orderList.ORDER_NUM} <br>
						주문회원 ID: ${orderList.USER_ID} <br>
						상품명: ${orderList.GOODS_TITLE} <br>
						옵션: ${orderList.ORDER_OP2}
						${orderList.ORDER_OP3}
						${orderList.ORDER_OP4}
						<form id="trans" method="POST" action="<c:url value='/aminMyPage/orderList/trans'/>">												
						<input type="text" maxlength="20" id="TRANS" value="${orderList.TRANS}" name="TRANS">
						<input type="hidden" id="ORDER_NUM" value="${orderList.ORDER_NUM}" name="ORDER_NUM">							
						<button type="submit" onclick="trans();">배송 여부 수정</button>
						</form>
					</div>
			</tr>
		</c:forEach>
		<div>
		<button class="w-btn w-btn-pink" type="button" onclick="location.href='/flower/aminMyPage'">돌아가기</button>
	</div>
	</div>
<script type="text/javascript">
function trans() {
		var TRANS = $("#TRANS").val()
		if (TRANS == null || TRANS == '') {
			alert("배송 여부 내용을 입력하세요.");
			return 0;
		}
		
		$("#TRANS").val(TRANS)
		TRANS.submit();   
  		alert("배송정보가 수정되었습니다.")	
}
</script>
</body>
</html>