<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/viewtiles2/include/include-header.jspf" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>회원가입</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style type="text/css">
/*회원가입 이름 가운데정렬 및 두 보더 붙이기*/
.join{
width:30%;
display: block;
justify-content: center;
text-align: left;
margin: auto;
}
.jointitle{
margin-top: 100px;
}
</style>
</head>
<body>
<div class="join">
<div class="jointitle">
<a href="/flower/joinForm"><h1 style="text-align: center; font-size: 50px;">회원가입</h1></a>
</div>
<form id="joinForm" method="POST" action="<c:url value='/joinOk'/>">
<div>
	<h4><label>아이디</label></h4>
		<span class="box">
			<input type="text" id="user_id" name="USER_ID" onkeyup="fn_joinIdCk()" maxlength="20" placeholder="아이디를 입력하세요">&nbsp;&nbsp;<span id="idckok" class="paw"></span>
		</span>
</div>		
<div>
	<h4><label>비밀번호</label></h4>
		<span class="box">
			<input type="password" id="user_pw" name="USER_PW" maxlength="20" onkeyup="fn_passCk()" placeholder="비밀번호를 입력하세요">
		</span>
</div>
<div>
	<h4><lable>비밀번호 확인</lable></h4>
		<span class="box">
			<input type="password" id="user_pw2" name="USER_PW2" maxlength="20" onkeyup="fn_passCk()" placeholder="비밀번호를 확인하세요">&nbsp;&nbsp;<span id="same" class="paw"></span>
		</span>
</div>

<div>
	<h4><label>이름</label></h4>
		<span class="box">
			<input type="text" id="user_name" name="USER_NAME" maxlength="30" placeholder="이름을 입력하세요">
		</span>
</div>

<div>
	<h4><label>이메일</label></h4>
		<span class="box">
			<input type="email" id="user_email" name="USER_EMAIL" maxlength="40" placeholder="이메일을 입력하세요">
		</span>
</div>
<div>
	<h4><label>우편번호</label></h4>
		<span class="box">
			<input type="text" id="user_zipcode" name="USER_ZIPCODE" maxlength="5" placeholder="우편번호를 입력하세요">
		</span>
		<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
</div>
<div>
	<h4><label>주소</label></h4>
		<span class="box">
			<input type="text" id="user_add1" name="USER_ADD1" maxlength="200" placeholder="주소를 입력하세요"> 
		</span>
</div>
<div>
	<h4><label>상세주소</label></h4>
		<span class="box">
			<input type="text" id="user_add2" name="USER_ADD2" maxlength="200" placeholder="상세주소를 입력하세요"> 
		</span>
</div>
<div>
	<h4><label>휴대전화</label></h4>
		<span class="box">
			<input type="text" id="user_phone" name="USER_PHONE" maxlength="13" placeholder="전화번호를 입력하세요">
		</span>
</div><br>
<div>
	<button type="button" onclick="joinform_check();">가입하기</button>&nbsp;&nbsp;
	<button type="reset">취 소</button>
</div>
</form>
</div>
</body>

<script type="text/javascript">
function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
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
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                document.getElementById("user_add2").value = extraAddr;
            
            } else {
                document.getElementById("user_add2").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('user_zipcode').value = data.zonecode;
            document.getElementById("user_add1").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("user_add2").focus();
        }
    }).open();
}
	
function fn_passCk() {
	var user_pw = document.getElementById('user_pw').value;
	var user_pw2 = document.getElementById('user_pw2').value;
	if (user_pw.length < 6 || user_pw.length > 16) {
		document.getElementById('same').innerHTML='비밀번호는 6글자 이상, 16글자 이하만 사용 가능합니다.';
		document.getElementById('same').style.color='black';
	}
	else if(document.getElementById('user_pw').value!='' && document.getElementById('user_pw2').value!='') {
		 if(document.getElementById('user_pw').value==document.getElementById('user_pw2').value) {
			document.getElementById('same').innerHTML='비밀번호가 일치합니다.';
			document.getElementById('same').style.color='blue';
		}
		else {
			document.getElementById('same').innerHTML='비밀번호가 일치하지 않습니다.';
			document.getElementById('same').style.color='red';
		}
	}
}

function fn_joinIdCk() {
	var user_id = $("#user_id").val()
    $.ajax({
        url : "http://localhost:9000/flower/joinIdCk",
        type : "POST",
        dataType :"JSON",
        data : {"id" : $("#user_id").val()},
        success : function (data) {
        	if (user_id == "") {
        		document.getElementById('idckok').innerHTML='아이디를 입력하세요.';
        		document.getElementById('idckok').style.color='black';
            } else if (data == 1) {
            	document.getElementById('idckok').innerHTML='중복된 아이디 입니다.';
            	document.getElementById('idckok').style.color='red';
            } else if (data == 0) {
            	document.getElementById('idckok').innerHTML='사용 가능한 아이디 입니다.';
            	document.getElementById('idckok').style.color='blue';
            }
        }

    });
};
	
//joinform_check 함수로 유효성 검사
function joinform_check() {
  //변수에 담아주기
  	var user_id = $("#user_id").val()
	var user_pw = $("#user_pw").val()
	var user_pw2 = $("#user_pw2").val()
	var user_name = $("#user_name").val()
  	var user_email = $("#user_email").val()
	var user_zipcode = $("#user_zipcode").val()
	var user_add1 = $("#user_add1").val()
	var user_add2 = $("#user_add2").val()
	var user_phone = $("#user_phone").val()

	if (user_id == null || user_id == '') {
		alert("아이디를 입력하세요.");
		return 0;
	} else if (user_pw == null || user_pw == '') {
		alert("비밀번호를 입력하세요");
		return 0;
	} else if (user_pw2 == null || user_pw2 == '') {
		alert("비밀번호를 확인하세요");
		return 0;
	} else if (user_name == null || user_name == '') {
		alert("이름을 입력하세요");
		return 0;
	} else if (user_email == null || user_email == '') {
		alert("이메일을 입력하세요");
		return 0;
	} else if (user_zipcode == null || user_zipcode == '') {
		alert("우편번호를 입력하세요");
		return 0;
	} else if (user_add1 == null || user_add1 == '') {
		alert("주소를 입력하세요");
		return 0;
	} else if (user_add2 == null || user_add2 == '') {
		alert("상세주소를 입력하세요");
		return 0;
	} else if (user_phone == null || user_phone == '') {
		alert("연락처를 입력하세요");
		return 0;
	} else if (user_pw != user_pw2) {
		alert("비밀번호가 서로 다릅니다.");
		return 0;
	} else if (user_pw.length < 6 || user_pw.length > 16) {
		alert("비밀번호는 6글자 이상, 16글자 이하만 이용 가능합니다.");
		return 0;
	} else if (document.getElementById('idckok').innerHTML != '사용 가능한 아이디 입니다.') {
		alert("아이디를 변경해주세요.");
		return 0;
	}

  	$("#USER_ID").val(user_id)
	$("#USER_PW").val(user_pw)
	$("#USER_PW2").val(user_pw2)
	$("#USER_NAME").val(user_name)
  	$("#USER_EMAIL").val(user_email)
	$("#USER_ZIPCODE").val(user_zipcode)
	$("#USER_ADD1").val(user_add1)
	$("#USER_ADD2").val(user_add2)
	$("#USER_PHONE").val(user_phone)
  
  //입력 값 전송
  joinForm.submit(); //유효성 검사의 포인트
  alert("가입을 축하드립니다.")
}    
</script>
</html>