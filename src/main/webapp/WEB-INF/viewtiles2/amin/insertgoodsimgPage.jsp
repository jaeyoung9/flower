<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/viewtiles2/include/include-header.jspf"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>상품이미지업로드</title>


<script type="text/javascript">
	$(document).ready(function() {

		/**
		 * 1.Form 태그 자체로 전송하기
		 */
		/*   $('.btn-form-submit').on('click', function() {
		      $('#upload').submit();
		  });
		 */

		$('.btn-grnl-submit').on('click', function() {

			var form = $('#upload');

			//formdata 생성
			var formData = new FormData(form[0]);

			formData.append("file", $('input[name=file]')[0].files[0]);

			/* var len = $('input[name="file"]')[1].file.length;
			for (var i = 0; i < len; i++) {
				formData.append("file" + i, $('input[name=file]')[1].files[i]);
			} */

			$.ajax({
				url : '/flower/upload/insertgoodsimg',
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


</head>
<body>


		

	

	<form id="upload" action="/flower/upload/insertgoodsimg" method="POST"
		enctype="multipart/form-data">

	<!-- 	<label class="">상품 썸</label> <input type="file" id="GOODS_THUMB"
			name="file" class=""> <br> 
			 -->
			<label class="">상품이미지</label>
		<div>
			<input type="file" id="GOODS_IMG" name="file" class="">
		</div>
		
		<label class="">상품 이름</label>
			<input type="text" id="GOODS_TITLE" name="GOODS_TITLE" class=""
				required>
		
	
		<!-- 상품 이름<input type="text" id="GOODS_TITLE" name="GOODS_TITLE" class=""
			required> -->
		<!-- 상품 가격<input type="text" id="GOODS_PRICE" name="GOODS_PRICE" class=""
			required>
		상품 내용<input type="text" id="GOODS_CONTENT" name="GOODS_CONTENT" class=""
			required>
			 -->			
			
		<button type="button" class="btn btn-primary btn-grnl-submit">파일업로드</button>
	</form>


</body>
</html>