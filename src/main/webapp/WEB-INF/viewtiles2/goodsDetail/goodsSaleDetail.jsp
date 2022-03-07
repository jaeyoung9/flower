<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/viewtiles2/include/include-header.jspf"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:forEach items="${goodsSaleDetail}" var="goodsSaleDetail">
	<title>${goodsSaleDetail.GOODS_TITLE}</title>
	<!-- /* "FLOWER" */ -->
</c:forEach>
<style type="text/css">
.goodsDetail {
	width: 30%;
	display: block;
	justify-content: center;
	text-align: center;
	margin: auto;
	position: relative;
}

.goodsDetailthum {
	margin-top: 100px;
	right: 320px;
	top: 70px;
	position: relative;
}

.goodsDetailContent {
	position: relative;
	margin-top: 0px;
	top: -300px;
	left: 150px;
	list-style: none;
}

.goodsDetailtitle {
	top: -30px;
	position: relative;
	font-size: 34px;
	list-style: none;
}

.goodsDetailli {
	position: relative;
	left: 48px;
	list-style: none;
}

.goodsDetailoption {
	position: relative;
	left: -13px;
	list-style: none;
}

.goodsDetailprice {
	position: relative;
	bottom: -30px;
	left: 132px;
	list-style: none;
}

.goodsDetail-btn {
	position: relative;
	display: block;
	left: 52px;
	bottom: -90px;
}

.goodsDetailImg {
	padding-top: 0px;
	position: relative;
	right: 300px;
}

.goodsDetailreviewtitle {
	position: relative;
	right: 320px;
}

.goodsDetailreview {
	position: relative;
	bottom: 90px;
}

.gdhr {
	position: relative;
	bottom: 20px;
}
</style>
</head>
<body>
	<div class="goodsDetail">

		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br> <input type="hidden" id="USER_ID" value="${USER_ID}">
		<%-- 아이디 히든으로 숨김 --%>
		<c:forEach items="${goodsSaleDetail}" var="goodsSaleDetail">

			<div class="goodsDetailthum">
				<a><img src="../../images/${goodsSaleDetail.STORED_FILE_THUMB}"
					height="400" width="450" /></a>
			</div>

			<div class="goodsDetailContent">
				<ul>
					<li class="goodsDetailtitle">${goodsSaleDetail.GOODS_TITLE}</li>
					<li class="goodsDetailli">${goodsSaleDetail.GOODS_CONTENT}</li>
					<li class="goodsDetailprice"><fmt:formatNumber
							value="${goodsSaleDetail.GOODS_PRICE}" pattern="#,###" />원</li>

				</ul>
				<div class="goodsDetail-btn">
					<button class="w-btn w-btn-pink" type="button" id="put"
						onclick="basket_put()">담기</button>
					<button class="w-btn w-btn-pink" type="button" id="order"
						onclick="orderPayPage()">구매</button>
				</div>

				<input type="hidden" id="GOODS_INDEX"
					value="${goodsSaleDetail.GOODS_INDEX}"> <input
					type="hidden" id="GOODS_TITLE"
					value="${goodsSaleDetail.GOODS_TITLE}"> <input
					type="hidden" id="GOODS_PRICE"
					value="${goodsSaleDetail.GOODS_PRICE}"> <input
					type="hidden" id="GOODS_OP1" value="${goodsSaleDetail.GOODS_OP1}">
				
			</div>
			<div class="goodsDetailImg">
				<a><img src="../../images/${goodsSaleDetail.STORED_FILE_IMG} "
					height="500" width="910" /></a>


			</div>
		</c:forEach>

		<!-- op. -->
		<li class="goodsDetailoption"><select id="GOODS_OP4">
				<c:forEach items="${list11}" var="list11">
					<option id="GOODS_OP4" value="${list11}">${list11}</option>
				</c:forEach>
		</select> <select id="GOODS_OP3">
				<c:forEach items="${list12}" var="list12">
					<option id="GOODS_OP3" value="${list12}">${list12}</option>
				</c:forEach>
		</select> <select id="GOODS_OP2">
				<c:forEach items="${list13}" var="list13">
					<option id="GOODS_OP2" value="${list13}">${list13}</option>
				</c:forEach>
		</select></li>
		
		
		

		<%-- 리뷰 --%>
		<div class="goodsDetailreviewtitle">
			<span
				style="font-size: 35px; margin-right: 660px; white-space: nowrap;">리뷰</span><br>
		</div>

		<c:forEach items="${review2}" var="review">
			<div class="goodsDetailreviewtitle">
				<a style="line-height: 30px;"
					href="/flower/reviewDetail?ORDER_NUM=${review.ORDER_NUM}&GOODS_INDEX=${review.GOODS_INDEX}"
					id="ReviewDetail"> <img
					src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2Fdh0ZzI%2FbtruuiD3Elb%2FzyvabSbYc5JYubPjBDRoT0%2Fimg.jpg"
					height="100" width="140" /></a>
			</div>
			<div class="goodsDetailreview">
				<a style="line-height: 30px;"
					href="/flower/reviewDetail?ORDER_NUM=${review.ORDER_NUM}&GOODS_INDEX=${review.GOODS_INDEX}"
					id="ReviewDetail">${review.REVIEW_CONTENT}</a>
			</div>
			<div class="gdhr">
				<hr>
			</div>
		</c:forEach>
		<br> <br> <br>
		<%-- 리뷰 답변 --%>
		관리자 답변<br>
		<c:forEach items="${reviewRe}" var="reviewRe">
	${reviewRe.REVIEW_RE_CONTENT}	<br>
		</c:forEach>


	</div>
</body>
<script type="text/javascript">
	function basket_put() {
		$.ajax({
			url : "<c:url value='/basket/put'/>",
			type : "POST",
			dataType : "TEXT",
			data : {
				"USER_ID" : $("#USER_ID").val(),
				"GOODS_INDEX" : $("#GOODS_INDEX").val(),
				"GOODS_TITLE" : $("#GOODS_TITLE").val(),
				"GOODS_PRICE" : $("#GOODS_PRICE").val(),
				"GOODS_OP1" : $("#GOODS_OP1").val(),
				"GOODS_OP2" : $("#GOODS_OP2 option:selected").val(),
				"GOODS_OP3" : $("#GOODS_OP3 option:selected").val(),
				"GOODS_OP4" : $("#GOODS_OP4 option:selected").val()
			},
			// 정보 넘기기때 사용할 이름: $("jsp로받아올값").val() 일단 user_id 는 flower
			success : function(data) {
				alert("담기완료");
				/* 
				 if(data != null) {
				        alert("이미 담겨김");
				    } else{
				        $('#put').attr("value", "Y");
				        alert("담기완료"); 
				    } */
			}
		});
	}

	function orderPayPage() {
		$.ajax({
			url : "<c:url value='/order/PayPage'/>",
			type : "POST",
			dataType : "JSON",
			data : {
				"USER_ID" : $("#USER_ID").val(),
				"GOODS_INDEX" : $("#GOODS_INDEX").val(),
				"GOODS_TITLE" : $("#GOODS_TITLE").val(),
				"GOODS_PRICE" : $("#GOODS_PRICE").val(),
				"GOODS_OP1" : $("#GOODS_OP1").val(),
				"GOODS_OP2" : $("#GOODS_OP2 option:selected").val(),
				"GOODS_OP3" : $("#GOODS_OP3 option:selected").val(),
				"GOODS_OP4" : $("#GOODS_OP4 option:selected").val()
			},
			// 정보 넘기기때 사용할 이름: $("jsp로받아올값").val() 일단 user_id 는 flower
			success : function(data) {

				location.href = "/flower/order/PayPage?GOODS_INDEX="
						+ $("#GOODS_INDEX").val() 
						+ "&USER_ID="
						+ $("#USER_ID").val()
						+ "&GOODS_OP2="
				+ $("#GOODS_OP2 option:selected").val()
				+ "&GOODS_OP3="
				+ $("#GOODS_OP3 option:selected").val()
				+ "&GOODS_OP4="
				+ $("#GOODS_OP4 option:selected").val(); 
				
				
			},
			error : function(request, status, error) {

				alert("code:" + request.status + "\n" + "message:"
						+ request.responseText + "\n" + "error:" + error);

			}
		})
		// 
		//  location.href="<c:url value='/order/PayPage?GOODS_INDEX=${GOODS_INDEX}'/>";
	}
</script>
</html>

<%-- /* function ReviewDetail(){
    $.ajax({
        url : "<c:url value='/reviewDetail'/>",
        type : "POST",
        dataType :"TEXT",
        data : {"ORDER_NUM" :  $("#ORDER_NUM").val(), "GOODS_INDEX" : $("#GOODS_INDEX").val()},
        // 정보 넘기기때 사용할 이름: $("jsp로받아올값").val() 일단 user_id 는 flower
        success : function (data) {
        	let url = "/flower/reviewDetail?ORDER_NUM="+$("#ORDER_NUM").val()+"&GOODS_INDEX="+$("#GOODS_INDEX").val();
        	//location.href="/flower/order/PayPage2?BASKET_INDEX="+num+"&USER_ID="+$("#USER_ID").val();
        	location.replace(url);
                }

    })
 // 
  //  location.href="<c:url value='/order/PayPage?GOODS_INDEX=${GOODS_INDEX}'/>";
}  */
/* 
$(document).ready(function(){
	$(document).on('click','#ReviewDetail', function(){
 		if(true){
 	 		$("input:hidden[name=ORDER_NUM]:checked").each(function(){
 	 	 		var tr = $(this).closest("tr").index();
 				var num = $('#tbody tr').eq(tr).find('#ORDER_NUM').val();
 				$.ajax({
 	 				type: "POST",
 	 				url:"<c:url value='/reviewDetail'/>",
 	 				dataType : "text",JSON 
 	 				data:{"GOODS_INDEX" : $('#GOODS_INDEX').val(),
 	 					"ORDER_NUM":num},
 	 					success : function(data) {
 	 						location.href="/flower/reviewDetail?ORDER_NUM="+num+"&GOODS_INDEX="+$("#GOODS_INDEX").val();
 	 					}
 	 	        });
 	 	        
 	 		});
 	 	}
 	});
});
  --%>