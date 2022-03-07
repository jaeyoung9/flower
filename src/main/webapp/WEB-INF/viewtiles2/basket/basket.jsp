<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/viewtiles2/include/include-header.jspf"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>이달의 꽃 - 장바구니</title>

<style>
.table td {
	display: block;
	justify-content: center;
	text-align: center;
	margin: auto;
	white-space: nowrap;
	width: 50%;


width: 0px;
height: 300px;
}

/*장바구니*/
.tbody {
	position: relative;
	width: 98%;
}

.baskettext {
	width: 30%;
	display: block;
	padding: 120px 0px 0px 100px;
	box-sizing: border-box;
}

.basket-td {
	width: 30%;
	position: relative;
	padding: 0px;
}

.basket-ck-name {
	width: 30%;
	position: relative;
	right: 500px;
}

.basket-ck {
	position: relative;
	top: 60px;
	right: 500px;
	
}

.basket-img-name {
	width: 30%;
	position: relative;
	right: 220px;
	bottom: 90px;
}

.basket-img {
	width: 30%;
	position: relative;
	right: 275px;
	bottom: 60px;
}

.basket-op-name {
	width: 30%;
	position: relative;
	left: 5px;
	bottom: 304px;
	
}

.basket-op {
	width: 30%;
	position: relative;
	lift: 500px;
	bottom: 280px;
}

.basket-price-name {
	width: 30%;
	position: relative;
	left: 285px;
	bottom: 623px;
}

.basket-price {
	width: 30%;
	position: relative;
	left: 280px;
	bottom: 530px;
}

.basketbutton {
	position: relative;
}
</style>

</head>
<body>
	<table class="table">
		<div class="baskettext">
			<h1>장바구니 목록</h1>
		</div>
		<tbody class="tbody" id="tbody">

			<c:forEach items="${basketList}" var="basketList">

				<tr align="center" id="row">
					<td><label class="basket-ck-name">선 택</label> <br>
						<div class="basket-ck">

							<input class="INDEX" type="checkbox" name="BASKET_INDEX"
								id="BASKET_INDEX">
						</div> <label class="basket-img-name">상 품</label>
						<div class="basket-img">

							<a><img
								src='images/${basketList.STORED_FILE_THUMB}'
								height="150" width="150" /></a>
						</div> <label class="basket-op-name">옵션</label>
						<div class="basket-op">
							${basketList.BASKET_TITLE}<br> <br>
							${basketList.BASKET_OP2}<br> ${basketList.BASKET_OP3}<br>
							${basketList.BASKET_OP4}<br> <br>
							<form id="items">
								<input class="num" type="hidden"
									value="${basketList.BASKET_INDEX }" id="num"
									name="BASKET_INDEX"> <input type="hidden" id="USER_ID"
									value="${USER_ID}">

							</form>

						</div> <label class="basket-price-name">가격</label>
						<div class="basket-price">
							<fmt:formatNumber value="${basketList.BASKET_PRICE}"
								pattern="#,###" />
							원
						</div></td>
				</tr>
			</c:forEach>

		</tbody>
	</table>
	<div class="basketbutton" style="text-align: center;">
		<button class="w-btn w-btn-pink" type="button" id="order">구매</button>
		<button class="w-btn w-btn-pink" type="button" id="delete">삭제</button>
	</div>
</body>

<script>
	$(document).ready(function() {
		$(document).on('click', '#delete', function() {
			if ($("input:checkbox[name=BASKET_INDEX]:checked").length == 0) {
				alert("삭제할 대상을 선택하세요.");
				return false;
			} else if (confirm("선택한 상품을 삭제하시겠습니까?") == true) {
				$("input:checkbox[name=BASKET_INDEX]:checked").each(function() {

					var tr = $(this).closest("tr").index();
					var num = $('#tbody tr').eq(tr).find('#num').val();
					$.ajax({
						type : "POST",
						url : "<c:url value='/basket/Delete'/>",
						dataType : "TEXT",
						data : {
							"USER_ID" : $('#USER_ID').val(),
							"BASKET_INDEX" : num
						},
						success : function(data) {
							location.reload();
						}
					});

				});
			}
		});
	});

	$(document)
			.ready(

					function() {
						$(document)
								.on(
										'click',
										'#order',

										function() {
											if ($("input:checkbox[name=BASKET_INDEX]:checked").length == 0) {
												alert("구매할 대상을 선택하세요.");
												return false;
											} else if (confirm("선택한 상품을 구매하시겠습니까?") == true) {
												$(
														"input:checkbox[name=BASKET_INDEX]:checked")
														.each(
																function() {

																	var tr = $(
																			this)
																			.closest(
																					"tr")
																			.index();
																	var num = $(
																			'#tbody tr')
																			.eq(
																					tr)
																			.find(
																					'#num')
																			.val();
																	$
																			.ajax({
																				type : "POST",
																				url : "<c:url value='/order/PayPage2'/>",
																				dataType : "text",/* JSON */
																				data : {
																					"USER_ID" : $(
																							'#USER_ID')
																							.val(),
																					"BASKET_INDEX" : num
																				},
																				success : function(
																						data) {
																					location.href = "/flower/order/PayPage2?BASKET_INDEX="
																							+ num
																							+ "&USER_ID="
																							+ $(
																									"#USER_ID")
																									.val();
																				}
																			});

																});
											}
										});
					});
</script>
</html>