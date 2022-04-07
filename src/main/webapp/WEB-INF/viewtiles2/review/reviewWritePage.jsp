<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/viewtiles2/include/include-header.jspf"%>

<!DOCTYPE html>
<html>
<head>

<script type="text/javascript">
	$(document).ready(function() {

		$('.btn-grnl-submit').on('click', function() {

			var REVIEW_CONTENT = $("#REVIEW_CONTENT").val()
			var STORED_FILE_REVIEW = $("#STORED_FILE_REVIEW").val()
			
			var form = $('#upload');
			var formData = new FormData(form[0]);

			formData.append("file", $('input[name=file]')[0].files[0]);
			
			if (REVIEW_CONTENT == null || REVIEW_CONTENT == '') {
				alert("내용을 입력하세요.");
				return 0;
			} else if (STORED_FILE_REVIEW == null || STORED_FILE_REVIEW == '') {
				alert("파일을 첨부하세요.");
				return 0;
			} else if (confirm("작성하시겠습니까??") == true) {
			$.ajax({
				url : '/flower/review/userWrite',
				type : 'POST',
				data : formData,
				processData : false,
				contentType : false,
				beforeSend : function() {
					console.log('jQeury ajax form submit beforeSend');
				},
				success : function(data) {
					
					console.log('jQeury ajax form submit success');
					alert("작성 완료");
					location.href = "<c:url value='/myPage?USER_ID=${USER_ID}'/>";
				},
				error : function(data) {
					console.log('jQeury ajax form submit error');
				},
				complete : function() {
					console.log('jQeury ajax form submit complete');
				}
			});//end ajax
			}
		});
	});

	$(function() {
		$("#cancel").click(function() {
			history.go(-1);
		})
	})
</script>
<meta charset="UTF-8">
<title>리뷰를 등록하슈</title>
<style>

.reviewtitle {
width: 100%;
height: 80vh;
display: block;
text-align: center;
justify-content: center;
}

.reviewWrite {
position: absolute;
content: center;
}

.com-sm-5 {
width:40%;
position: absolute;
left: 50%;
top: 50%;
transform: translate(-50%, -50%);
border: 1px solid #000;

}
.reviewbt {
position: absolute;
left: 50%;
top: 70%;
transform: translate(-50%, -50%);
}

</style>
</head>
<body>

<input type="hidden" id="USER_ID" value="${USER_ID}">
		<c:forEach items="${reviewWritePage}" var="reviewWritePage">
			<input type="hidden" id="USER_NUM"
				value="${reviewWritePage.USER_NUM}">
			<input type="hidden" id="ORDER_NUM"
				value="${reviewWritePage.ORDER_NUM}">
			<input type="hidden" id="GOODS_INDEX"
				value="${reviewWritePage.GOODS_INDEX}">
			<br>
		</c:forEach>
		
	<form id="upload" action="/flower/review/userWrite" method="POST"
		enctype="multipart/form-data">


		<input type="hidden" id="USER_ID" name="USER_ID" value="${USER_ID}">
		<c:forEach items="${reviewWritePage}" var="reviewWritePage">
			<input type="hidden" id="USER_NUM" name="USER_NUM"
				value="${reviewWritePage.USER_NUM}">
			<input type="hidden" id="ORDER_NUM" name="ORDER_NUM"
				value="${reviewWritePage.ORDER_NUM}">
			<input type="hidden" id="GOODS_INDEX" name="GOODS_INDEX"
				value="${reviewWritePage.GOODS_INDEX}">
			<br>
		</c:forEach>
		
		<div class="reviewtitle">
			<label style="font-size: 60px;">리뷰 내용</label>
			<div class="com-sm-5">
				<textarea  rows="5" cols="30" name="REVIEW_CONTENT" maxlength="150" id="REVIEW_CONTENT" class="" required placeholder="리뷰 내용을 작성해주세요."></textarea>
			</div>
			
			<div class="reviewbt">
				<input type="file" id="STORED_FILE_REVIEW" name="file" class="">
			

			
				<button type="button" class="btn btn-primary btn-grnl-submit">리뷰
					등록</button>
				<button class="" type="button" id="cancel">취소</button>
				
			</div>
		</div>



	</form>

</body>
</html>