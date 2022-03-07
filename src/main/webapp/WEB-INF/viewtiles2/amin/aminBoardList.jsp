<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/viewtiles2/include/include-header.jspf"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 및 이벤트 관리</title>
<style type="text/css">
.aminboardlist {
	width: 40%;
	display: block;
	justify-content: center;
	padding: 2rem;
	box-sizing: border-box;
	margin: auto;
}
</style>
</head>
<body>
	<div class="aminboardlist">
		<h1>상품 리스트</h1>
		<table>
			<tbody id="tbody">
				<c:forEach items="${aminGoodsList}" var="aminGoodsList">
					<tr>
						<td><input class="INDEX" type="checkbox" name="goods"
							id="goods"> ${aminGoodsList.GOODS_TITLE}
							<button type="button" name="goodsdelete" id="goodsdelete">삭제</button>

							<form id="items">
								<input type="hidden" id="num"
									value="${aminGoodsList.GOODS_INDEX}">
							</form></td>
					</tr>

				</c:forEach>
			</tbody>
		</table>
		이벤트 리스트 <br>
		<table>
			<tbody id="noticetbody">
				<c:forEach items="${aminNoticeList}" var="aminNoticeList">
					<tr>
						<td><input class="INDEX" type="checkbox" name="notice"
							id="notice"> ${aminNoticeList.NOTICE_TITLE}
							
							<button type="button" name="noticeDelete" id="noticeDelete">삭제</button>
							<form id="items">
								<input type="hidden" id="num"
									value="${aminNoticeList.NOTICE_INDEX}">
							</form></td>
							
					</tr>

				</c:forEach>
			</tbody>
		</table>
		<br>
		<div>
			<button class="w-btn w-btn-pink" type="button"
				onclick="location.href='/flower/aminMyPage'">돌아가기</button>
		</div>
	</div>
</body>
<script type="text/javascript">
	$(document).ready(function() {
		$(document).on('click', '#goodsdelete', function() {
			if ($("input:checkbox[name=goods]:checked").length == 0) {
				alert("삭제할 대상을 선택하세요.");
				return false;
			} else if (confirm("선택한 상품을 삭제하시겠습니까?") == true) {
				$("input:checkbox[name=goods]:checked").each(function() {

					var tr = $(this).closest("tr").index();
					var num = $('#tbody tr').eq(tr).find('#num').val();
					$.ajax({
						type : "POST",
						url : "<c:url value='/aminBoardList/delete'/>",
						dataType : "TEXT",
						data : {
							"GOODS_INDEX" : num
						},
						success : function(data) {
							location.reload();
						}
					});

				});
			}
		});
	});

	$(document).ready(function() {
		$(document).on('click', '#noticeDelete', function() {
			if ($("input:checkbox[name=notice]:checked").length == 0) {
				alert("삭제할 대상을 선택하세요.");
				return false;
			} else if (confirm("선택한 상품을 삭제하시겠습니까?") == true) {
				$("input:checkbox[name=notice]:checked").each(function() {

					var tr = $(this).closest("tr").index();
					var num = $('#noticetbody tr').eq(tr).find('#num').val();
					$.ajax({
						type : "POST",
						url : "<c:url value='/noticeDelete'/>",
						dataType : "TEXT",
						data : {
							"NOTICE_INDEX" : num
						},
						success : function(data) {
							location.reload();
						}
					});

				});
			}
		});
	});
</script>
</html>