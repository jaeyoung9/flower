<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/viewtiles2/include/include-header.jspf"%>

<!DOCTYPE html>
<html>


<head>
<meta charset="UTF-8">
<title>판매글 등록</title>

<style type="text/css">

.goodswritepage {
width: 40%;
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
<div class="goodswritepage">
	<h1>상품</h1>
	<form id="upload" action="/flower/upload/insertgoodsimg" method="POST"
		enctype="multipart/form-data">
		<form id="upload" action="/flower/upload/insertgoodsthumb" method="POST" enctype="multipart/form-data">
			<div class="">
				<label class="">상품 이름</label>
				<div class="">
					<span class="box"><input type="text" maxlength="30" id="GOODS_TITLE" name="GOODS_TITLE" class="int" required></span>
				</div>
			</div>

			<br>
			<div class="">
				<label class="">가격</label>
				<div class="">
					<span class="box"><input type="text" class="int" id="GOODS_PRICE" name="GOODS_PRICE" required></span>
				</div>
			</div>
			<br>
			<div class="goodscontent">
				<label class="">상품 정보글</label>
				<div class="com-sm-5">
					<textarea name="GOODS_CONTENT" maxlength="3000" id="GOODS_CONTENT" cols="50"
						rows="25" class="" required></textarea>
				</div>
			</div>

			<label>옵션2</label> <span class="box"><input type="text" class="int" id="GOODS_OP2"></span>  <br>
			<label>옵션3</label> <span class="box"><input type="text" class="int" id="GOODS_OP3"></span>  <br> 
			<label>옵션4</label> <span class="box"><input type="text" class="int" id="GOODS_OP4"></span>  <br>



			<div class="">
				<div class="">
					구독/일반 <select id="GOODS_OP1">
						<option value="구독">구독</option>
						<option value="일반">일반</option>

					</select>
				</div>
			</div>

			<label class="">상품이미지</label>
			<div>
				<input type="file" id="GOODS_IMG" name="goods_img" class="">
			</div>
		</form>

		<label class="">상품썸네일</label>
		<div>
			<input type="file" id="GOODS_THUMB" name="file" class="">
		</div>
	</form>



	<br>
	<div>
		<input type="button" class="btn btn-submit" value="등록"
			onclick="goodsWrite();">
	</div>

	<button onclick="location.href='/flower/insertgoodsthumbPage'">썸네일
		수정하기</button>
	<button onclick="location.href='/flower/insertgoodsimgPage'">이미지
		수정하기</button>
	
		<button class="w-btn w-btn-pink" type="button" onclick="location.href='/flower/aminMyPage'">돌아가기</button>
	
</div>


	<script type="text/javascript">
		function goodsWrite() {

			/* 	 var op2Value = $("input[name='goods_op_select2']").length;
			var op2Data = new Array(op2Value);
			for(var i=0; i<op2Value; i++){                          
			     op2Data[i] = $("input[name='goods_op_select2']")[i].value;
			} 
			 */

			$.ajax({
				url : '<c:url value="/goodsWritePage/goodsWrite"/>',
				type : "POST",
				dataType : "TEXT",
				data : {
					"GOODS_OP1" : $("#GOODS_OP1").val(),
					"GOODS_TITLE" : $("#GOODS_TITLE").val(),
					"GOODS_CONTENT" : $("#GOODS_CONTENT").val(),
					"GOODS_PRICE" : $("#GOODS_PRICE").val(),
					"GOODS_OP2" : $("#GOODS_OP2").val(),
					"GOODS_OP3" : $("#GOODS_OP3").val(),
					"GOODS_OP4" : $("#GOODS_OP4").val()
				},

				// 정보 넘기기때 사용할 이름: $("jsp로받아올값").val() 일단 user_id 는 flower
				success : function(data) {

					alert("등록완료");

					location.href = "/flower/goodsWritePage";

				}
			})
		}

		$(document)
				.ready(
						function() {

							/**
							 * 1.Form 태그 자체로 전송하기
							 */
							/*   $('.btn-form-submit').on('click', function() {
							      $('#upload').submit();
							  });
							 */

							$('.btn-submit')
									.on(
											'click',
											function() {

												var form = $('#upload');

												//formdata 생성
												var formData = new FormData(
														form[0]);

												formData
														.append(
																"file",
																$('input[name=goods_img]')[0].files[0]);

												/* var len = $('input[name="file"]')[1].file.length;
												for (var i = 0; i < len; i++) {
													formData.append("file" + i, $('input[name=file]')[1].files[i]);
												} */

												$
														.ajax({
															url : '/flower/upload/insertgoodsimg',
															type : 'POST',
															data : formData,
															processData : false,
															contentType : false,
															beforeSend : function() {
																console
																		.log('jQeury ajax form submit beforeSend');
															},
															success : function(
																	data) {
																console
																		.log('jQeury ajax form submit success');
																alert("업로드완료");
															},
															error : function(
																	data) {
																console
																		.log('jQeury ajax form submit error');
															},
															complete : function() {
																console
																		.log('jQeury ajax form submit complete');
															}
														});//end ajax

											});
						});
		$(document).ready(function() {

			/**
			 * 1.Form 태그 자체로 전송하기
			 */
			/*   $('.btn-form-submit').on('click', function() {
			      $('#upload').submit();
			  });
			 */

			$('.btn-submit').on('click', function() {

				var form = $('#upload');

				//formdata 생성
				var formData = new FormData(form[0]);

				formData.append("file", $('input[name=file]')[0].files[0]);

				/*  var len = $('input[name="file"]')[1].file.length;
				for (var i = 0; i < len; i++) {
					formData.append("file" + i, $('input[name=file]')[1].files[i]);
				} 
				 */
				$.ajax({
					url : '/flower/upload/insertgoodsthumb',
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








</body>
</html>