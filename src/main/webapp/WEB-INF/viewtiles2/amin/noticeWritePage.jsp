<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/viewtiles2/include/include-header.jspf"%>

<!DOCTYPE html>
<html>
<head>

<script type="text/javascript">
	$(document).ready(function() {

		$('.btn-grnl-submit').on('click', function() {

			var form = $('#upload');

			var formData = new FormData(form[0]);

			formData.append("file", $('input[name=file]')[0].files[0]);

			$.ajax({
				url : '/flower/noticeWritePage/noticeWrite',
				type : 'POST',
				data : formData,
				processData : false,
				contentType : false,
				beforeSend : function() {
					console.log('jQeury ajax form submit beforeSend');
				},
				success : function(data) {
					console.log('jQeury ajax form submit success');
					alert("업로드완료");
				},
				error : function(data) {
					console.log('jQeury ajax form submit error');
				},
				complete : function() {
					console.log('jQeury ajax form submit complete');
				}
			});//end ajax

		});
	});
</script>
<meta charset="UTF-8">
<title>이벤트를 등록하슈</title>

<style type="text/css">

.noticewritepage {
width: 45%;
height: 100vh;
display: block;
justify-content: center;
padding: 5rem;
box-sizing: border-box;
margin: auto;
}

textarea {
line-height: 15px;
}

</style>

</head>
<body>

<div class="noticewritepage">
	<form id="upload" action="/flower/noticeWritePage/noticeWrite"
		method="POST" enctype="multipart/form-data">

		<label class="">이벤트 제목</label>

		<div class="">
			<input type="text" maxlength="300" id="NOTICE_TITLE" name="NOTICE_TITLE" class=""
				required>
		</div>

		<label class="">이벤트 내용</label>
		<div class="com-sm-5">
			<textarea name="NOTICE_CONTENT" maxlength="3000" id="NOTICE_CONTENT" cols="50"
				rows="25" class="" required></textarea>
		</div>

		<div>
			<input type="file" id="STORED_FILE_NOTICE" name="file" class="">
		</div>
		<button type="button" class="btn btn-primary btn-grnl-submit">이벤트
			등록</button>
		<div>
		<button class="w-btn w-btn-pink" type="button" onclick="location.href='/flower/aminMyPage'">돌아가기</button>
		</div>
	</form>
</div>
</body>
</html>