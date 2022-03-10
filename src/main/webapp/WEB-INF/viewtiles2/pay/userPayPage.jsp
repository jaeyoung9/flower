<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/viewtiles2/include/include-header.jspf"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이달의 꽃 - 결제페이지</title>

<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<style>
/*결제페이지*/

.userpaypage {
width: 30%;
position: relative;
top: 100px;
margin: auto;
}
.paypageli {
position: relative;
left: 150px;
top: -178px;
font-size: 25px;
list-style: none;
}
.paypageli2 {
position: relative;
left: 150px;
top: -190px;
list-style: none;

}
.paypageli3 {
position: relative;
left: 350px;
top: -225px;
list-style: none;
}

.userpaypage2 {
width: 30%;
display: block;
justify-content: center;
text-align: left;
margin: auto;
}

</style>

</head>
<body>

<div class="userpaypage">
<div style="font-size:20px;">
						<h1>상품정보</h1>
</div>					
<div>
	<c:forEach items="${orderPayPage}" var="orderPage">
<div>
<a><img src='../images/${orderPage.STORED_FILE_THUMB}' height="160" width="145"/></a>
</div>
<div>
<ul>
<li class="paypageli">${orderPage.GOODS_TITLE}</li><br>
<li class="paypageli3"></li>
</ul>
</div>
		<input type="hidden" class="int" id="GOODS_INDEX" value="${orderPage.GOODS_INDEX}">
		<input type="hidden" class="int" id="GOODS_TITLE" value="${orderPage.GOODS_TITLE}">
		<input type="hidden" class="int" id="GOODS_OP1" value="${orderPage.GOODS_OP1}">
	</c:forEach>
</div>	
<!-- OP1 -->
<div class="paypageli3">
<c:forEach items="${goodsprice}" var="goodsprice">
<input type="hidden" class="int" id="GOODS_PRICE" value="${goodsprice}">
<fmt:formatNumber value="${goodsprice}" pattern="#,###"/>원 <br>

</c:forEach>
<c:forEach items="${op2}" var="op2">
${op2}
<input type="hidden" class="int" id="GOODS_OP2" value="${op2}"><br>
</c:forEach>
<c:forEach items="${op3}" var="op3">
${op3}
<input type="hidden" class="int" id="GOODS_OP3" value="${op3}"><br>
</c:forEach>
<c:forEach items="${op4}" var="op4">
${op4} 
<input type="hidden" class="int" id="GOODS_OP4" value="${op4}">
</c:forEach>
</div>
</div>

<div class="userpaypage2">
	<c:forEach items="${orderMember}" var="orderMember">

		<input type="hidden" name="OR_NUM" id="USER_NUM"
			value="${orderMember.USER_NUM}">
		<br>
		
		<div style="font-size:20px; text-align:left;">
						<h1>주문자</h1>
		</div>
		<div>
			<h4>이름</h4>	<span class="box"><input type="text" maxlength="20" class="int" id="USER_NAME"
			value="${orderMember.USER_NAME}"></span>
		</div>
		<div>
			<h4>전화번호</h4> 	<span class="box"><input type="text" maxlength="13" class="int" id="USER_PHONE"
			value="${orderMember.USER_PHONE}"></span>
		</div>
		<div>
		<h4>우편번호</h4><span class="box"><input type="text" class="int" id="USER_ZIPCODE"
			value="${orderMember.USER_ZIPCODE}" placeholder="우편번호" readonly></span>
		<button class="w-btn w-btn-pink" type="button" onclick="sample6_execDaumPostcode()">우편번호 찾기</button>
		</div>
		<div>
		<h4>주소</h4>
		<span class="box"><input type="text" id="USER_ADD1" maxlength="200" class="int" value="${orderMember.USER_ADD1 }"
			placeholder="주소"></span>
		</div>
		<div>
		<h4>상세주소</h4>
		<span class="box"><input type="text" id="USER_ADD2" maxlength="200" class="int" value="${orderMember.USER_ADD2 }"
			placeholder="상세주소"></span>
		</div>
		
	</c:forEach>
	
	
<button class="w-btn w-btn-pink" type="button" id="orderPay" onclick="orderPay();">구매</button>
<button class="w-btn w-btn-pink" type="reset" id="취소" onclick="location.href='/flower/main?USER_ID=${USER_ID}'">취소</button>
</div>

</body>

<script>
	function sample6_execDaumPostcode() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 각 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var addr = ''; // 주소 변수
				var extraAddr = ''; // 참고항목 변수

				//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					addr = data.roadAddress;
				} else { // 사용자가 지번 주소를 선택했을 경우(J)
					addr = data.jibunAddress;
				}

				// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
				if (data.userSelectedType === 'R') {
					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraAddr += (extraAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if (extraAddr !== '') {
						extraAddr = ' (' + extraAddr + ')';
					}
					// 조합된 참고항목을 해당 필드에 넣는다.
					document.getElementById("USER_ADD2").value = extraAddr;

				} else {
					document.getElementById("USER_ADD2").value = '';
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('USER_ZIPCODE').value = data.zonecode;
				document.getElementById("USER_ADD1").value = addr;
				// 커서를 상세주소 필드로 이동한다.
				document.getElementById("USER_ADD2").focus();
			}
		}).open();
	}
</script>

<script>
$(document).ready(function() {
	fn_goodsorder(1); //최초에 화면이 호출되면 1페이지의 내용을 조회하는 것을 의미.
	
	function fn_goodsorder(pageNo) { //파라미터로 pageNo를 받는다. (pageNo는 호출하고자 하는 페이지 번호를 의미)
		var comAjax = new ComAjax(); //coomon.js파일에 ComAjax를 사용.
		comAjax.setUrl("<c:url value='/order/PayPage/json'/>");
		comAjax.setCallback("fn_goodsoderCallback"); //ajax요청이 완료된 후 호출될 함수의 이름을 지정
		comAjax.addParam("GOODS_INDEX", GOODS_INDEX); //현재 페이지 번호
		comAjax.addParam("USER_ID", USER_ID); //한페이지에 보여줄 행(데이터)의 수
		comAjax.ajax();
	}

</script>
<script type="text/javascript">
function orderPay(){
    $.ajax({
    
        url : "<c:url value='/order/Pay'/>",
        type : "POST",
        dataType :"TEXT",
        data : { "GOODS_INDEX" : $("#GOODS_INDEX").val(),
        	"GOODS_TITLE" : $("#GOODS_TITLE").val(), "GOODS_PRICE" : $("#GOODS_PRICE").val(),
        	"GOODS_OP1" : $("#GOODS_OP1").val(), "GOODS_OP2" : $("#GOODS_OP2").val(),"GOODS_OP3" : $("#GOODS_OP3").val(),
        	"GOODS_OP4" : $("#GOODS_OP4").val() ,
        	"USER_NUM" : $("#USER_NUM").val() , "USER_NAME" : $("#USER_NAME").val() ,
        	"USER_PHONE" : $("#USER_PHONE").val() , "USER_ZIPCODE" : $("#USER_ZIPCODE").val() ,
        	"USER_ADD1" : $("#USER_ADD1").val() , "USER_ADD2" : $("#USER_ADD2").val()},
        	
        	
        	
        // 정보 넘기기때 사용할 이름: $("jsp로받아올값").val() 일단 user_id 는 flower
        success : function (data) {
        	
        	
        	alert("구매완료");
        	history.go(-2);

        }

    })
} 
</script>

</html>







