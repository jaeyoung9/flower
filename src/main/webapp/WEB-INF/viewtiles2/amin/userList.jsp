<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/viewtiles2/include/include-header.jspf" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 회원 정보 관리 페이지</title>

<style type="text/css">

.userlist {
width: 40%;
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
<div class="userlist">
	<h1>회원 관리</h1>
	<div>
		<h4>회원 ID로 검색하기</h4>
			<div>
				<label>검색할 회원 아이디 입력</label>
				<span class="box"><input type="text" class="int" name="USER_ID" id="USER_ID" maxlength="20" placeholder="검색할 아이디를 쓰시오."></span>
				<button type="button" onclick="findUser();">검색하기</button>
				<br>
				&nbsp;&nbsp;<span id="findUserResult1"></span>
				&nbsp;&nbsp;<span id="findUserResult2"></span>
				&nbsp;&nbsp;<span id="findUserResult3"></span>
				&nbsp;&nbsp;<span id="findUserResult4"></span>
				&nbsp;&nbsp;<span id="findUserResult5"></span>
				&nbsp;&nbsp;<span id="findUserResult6"></span>
				&nbsp;&nbsp;<span id="findUserResult7"></span>
				&nbsp;&nbsp;<span type="button" id="userListDelete" onclick="userListDelete();"></span>
			</div>
	</div>
<hr>
	<div>
		<h4>회원 전체 목록</h4>
			<c:forEach var="userList" items="${userList}">
			<p> - ${userList.USER_ID}</p>
			</c:forEach>
	</div>
	<div>
		<button class="w-btn w-btn-pink" type="button" onclick="location.href='/flower/aminMyPage'">돌아가기</button>
	</div>
</div>

<script type="text/javascript">
function findUser() {
    $.ajax({
        type: "POST",
        url : "http://localhost:9000/flower/aminMyPage/findUser",
        dataType :"JSON",
        data : {"USER_NUM" : $("#USER_NUM").val(), 
                    "USER_ID" : $("#USER_ID").val(),
                    "USER_NAME" : $("#USER_NAME").val(),
                    "USER_PHONE" : $("#USER_PHONE").val(),
                    "USER_ZIPCODE" : $("#USER_ZIPCODE").val(),
                    "USER_ADD1" : $("#USER_ADD1").val(),
                    "USER_ADD2" : $("#USER_ADD2").val(),
            },
        success : function(data) {
            if (document.getElementById('USER_ID').value == data.USER_ID) {
                 document.getElementById('findUserResult1').innerHTML=data.USER_NUM;
                 document.getElementById('findUserResult2').innerHTML=data.USER_ID;
                 document.getElementById('findUserResult3').innerHTML=data.USER_NAME;
                 document.getElementById('findUserResult4').innerHTML=data.USER_PHONE;
                 document.getElementById('findUserResult5').innerHTML=data.USER_ZIPCODE;
                 document.getElementById('findUserResult6').innerHTML=data.USER_ADD1;
                 document.getElementById('findUserResult7').innerHTML=data.USER_ADD2;
                 const btn = document.createElement("button");
                 btn.innerHTML = "회원삭제"
                 document.getElementById('userListDelete').appendChild(btn);
            }
        }
        , error: function(e) {
            console.log(e);
        }
    });
}
$(function(){
    $("#userListDelete").click(function () {
		$.ajax({
			url : "<c:url value='/aminMyPage/userList/delete'/>",
			type : "POST",
			dataType : "TEXT",
			data : {
				"USER_ID" : $("#USER_ID").val(),
			},success : function(data) {
				alert("삭제 완료");
				location.reload();
			},error:function(request, status, error) {
	    		alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	    	}
		})
	})
})
/*
function userListDelete() {
	if (confirm("정말 이 회원을 삭제하시겠습니까??") == true) {			 
		 alert("삭제되었습니다.");
		 location.href="<c:url value='/aminMyPage/userList/delete'/>";
	 } else {   
	     return false;
	 }
}
*/
</script>

</body>
</html>