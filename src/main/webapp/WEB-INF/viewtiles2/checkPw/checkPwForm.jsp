<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/WEB-INF/viewtiles2/include/include-header.jspf" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<script>
    function checkSubmit() {
        var pw = $("#USER_PW").val();

        if (pw == null || pw == '') {
            alert("비밀번호를 입력하세요.");
            return 0;
        }
        checkPw.submit();
    }
</script>
<style>
.checkpwd {
	display: block;
	text-align: center;
	margin-top: 200px;
	}
	
.checkpwd2 {
width: 20%;
	display: block;
	justify-content: center;
	margin: auto;
	}
.checkpwd2 p{
	padding-bottom: 100px;
	}
</style>
</head>
<body>
<div class="checkpwd" style="font-size:40px;">
<h1>비밀번호 확인</h1><br>
</div>
        <div>
            <div>
                
                <div class="checkpwd2">
                <form id="checkPw" action="<c:url value='/myPage/checkPw'/>" method="POST">
                    <input type="hidden" id="USER_ID" name="USER_ID" value="${USER_ID}">
                    <div>
                        <h4><label>비밀번호 입력</label></h4>
                        <span class="box">
                        <input type="password" class="int" name="USER_PW" id="USER_PW" placeholder="비밀번호를 입력하세요">
                        </span>
                    </div>
                    <p>
                        <button class="w-btn w-btn-pink" type="button" onclick="checkSubmit();">확인</button>
                        <button class="w-btn w-btn-pink" type="button" onclick="location.href='/flower/myPage?USER_ID=${USER_ID}'">돌아가기</button>
                    </p>
                    
                </form>
                </div>
            </div>
        </div>
   
</body>
</html> 
