<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/viewtiles2/include/include-header.jspf" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">

function fsubmit() {
	var user_id = $("#user_id").val()
	var user_pw = $("#user_pw").val()

	if (user_id == null || user_id == '') {
		alert("아이디를 입력하세요.");
		return 0;
	} else if (user_pw == null || user_pw == '') {
		alert("비밀번호를 입력하세요");
		return 0;
	}

	
	$("#USER_ID").val(user_id);
	$("#USER_PW").val(user_pw);

	loginForm.submit();
}
</script>
<style>
/* 로그인, 메인*/
.logindeco {
	width: 40%;
	display: block;
	justify-content: center;
	padding: 5rem;
	box-sizing: border-box;
	margin: auto;
}
a{
text-decoration: none; 
color : black;
}
.login {
	position: relative;
	text-align: center;
}

</style>
</head>
<body>
<div class="logindeco">
<div class="login">
         <div style=font-size:40px;>
            <a href="<c:url value='/main'/>"><h1>LOGIN</h1></a>
         </div>
         <p><h2>welcome<h2></p>
      </div>
      <div style="text-align:center">
         <div>
            <div>
               <form id="loginForm" method="POST" action="<c:url value='/login'/>" >
                  <div style="text-align: left;">
                     <label>아이디</label>
                     <span class="box"><input type="text" class="int" id="user_id" maxlength="20" name="USER_ID" placeholder="아이디를 입력하세요"></span>
                  </div>
                  <br>
                  <div style="text-align: left;">
                     <label>비밀번호</label>
                     <span class="box"><input type="password" class="int" id="user_pw" maxlength="20" name="USER_PW" placeholder="비밀번호를 입력하세요"></span>
                  </div>
                  <br>
                  <!-- <button type="button" onclick="fsubmit();" class="btn btn-secondary">로그인</button> -->
                  <button class="w-btn w-btn-pink" type="button" onclick="fsubmit();">
						로그인</button>
					<button class="w-btn w-btn-pink" type="button" onclick="location.href='http://localhost:9000/flower/joinForm'">
						회원가입</button>
               </form>
               <div>
				<a href="<c:url value='/loginForm/findId'/>">아이디 찾기</a>
				<span>|</span>
				<a href="<c:url value='/loginForm/findPw'/>">비밀번호 찾기</a>
				</div>
            </div>
         </div>
      </div>
      </div>
</body>
</html>