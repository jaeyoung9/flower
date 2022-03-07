<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/viewtiles2/include/include-header.jspf" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<script type="text/javascript">
function fsubmit() {
	var user_name = $("#user_name").val()
	var user_email = $("#user_email").val()

	if (user_name == null || user_name == '') {
		alert("이름을 입력하세요.");
		return 0;
	} else if (user_email == null || user_email == '') {
		alert("이메일을 입력하세요");
		return 0;
	}

	
	$("#USER_NAME").val(user_name);
	$("#USER_EMAIL").val(user_email);

	frm.submit();
}
</script>
<style>
.fid2 {
	width: 30%;
	height: 100vh;
	display: block;
	justify-content: center;
	align-items: left;
	box-sizing: border-box;
	text-align: left;
	margin: auto;
	
}
</style>
</head>
<body>
<div>
	<div>
		
			<div style="text-align:center; margin-top: 15%; margin-bottom: 100px;">
				<div class="fid3">
					<p>
						<a href="/flower/loginForm/findId">아이디 찾기</a>
						<span> | </span>
						<a href="/flower/loginForm/findPw">비밀번호 찾기</a>
					</p>
					</div>
					<div class="fid" style="font-size:40px;">
						<h1>아이디 찾기</h1>
					</div>
					<div class="fid2">
					<form id="frm" action="/flower/findIdResult" method="POST">
						<input type="hidden" id="USER_NAME" name="USER_NAME">
						<input type="hidden" id="USER_EMAIL" name="USER_EMAIL">
					<div>
						<label>이  름</label>
						<span class="box"><input type="text" class="int" maxlength="20" name="user_name" id="user_name" placeholder="등록한 이름을 쓰시오."></span>
					</div>
					<div>
						<label>E-mail</label>
						<span class="box"><input type="text" class="int" maxlength="40" name="user_email" id="user_email" placeholder="등록한 이메일을 쓰시오."></span>
					</div>
					
					<p>
						<button class="w-btn w-btn-pink" type="button" onclick="fsubmit();">찾기</button>
						<button class="w-btn w-btn-pink" type="button" onclick="location.href='http://localhost:9000/flower/joinForm'">회원가입</button>
					</p>
					</form>
					</div>
				</div>
		
	</div>
</div>
</body>
</html>