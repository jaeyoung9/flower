<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/viewtiles2/include/include-header.jspf"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:forEach items="${goodsSubDetail}" var="goodsSubDetail">
	<title>${goodsSubDetail.GOODS_TITLE}</title>
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
<body  onload="init();">
	<div class="goodsDetail">
		<input type="hidden" id="USER_ID" value="${USER_ID}">
		<%-- 아이디 히든으로 숨김 --%>
		

		<c:forEach items="${goodsSubDetail}" var="goodsSubDetail">

			<div class="goodsDetailthum">
				<a><img src="../../images/${goodsSubDetail.STORED_FILE_THUMB} "
					height="400" width="450" /></a>
			</div>

			<div class="goodsDetailContent">
				<ul>
					<li class="goodsDetailtitle">${goodsSubDetail.GOODS_TITLE}</li>
					<li class="goodsDetailli">${goodsSubDetail.GOODS_CONTENT}</li>
					<li class="goodsDetailprice">
				<li><select id="GOODS_OP4">
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
						 <form name="form" method="get">
 <input type=hidden name="sell_price" value="${goodsSubDetail.GOODS_PRICE}">
 <input type="text" name="amount" value="1" size="3" onchange="change();">
 <input type="button" value=" + " onclick="add();">
 <input type="button" value=" - " onclick="del();"><br>
 <input type="text" id="GOODS_PRICE" name="sum" size="13" readonly>
 </form>		
							</li>
				</ul>
				<div class="goodsDetail-btn">
					<button class="w-btn w-btn-pink" type="button" id="put"
						onclick="basket_put()">담기</button>
					<button class="w-btn w-btn-pink" type="button" id="order"
						onclick="orderPayPage()">구매</button>
				</div>

				<input type="hidden" id="GOODS_INDEX"
					value="${goodsSubDetail.GOODS_INDEX}"> <input type="hidden"
					id="GOODS_TITLE" value="${goodsSubDetail.GOODS_TITLE}">
					<input type="hidden" id="GOODS_OP1" value="${goodsSubDetail.GOODS_OP1}">
			</div>
			<div class="goodsDetailImg">
				<a><img src="../../images/${goodsSubDetail.STORED_FILE_IMG} "
					height="500" width="910" /></a>
			</div>
		</c:forEach>

		<!-- OP! -->
		<ul>
			
		</ul>

		<%-- 리뷰 --%>
		<div class="goodsDetailreviewtitle">
			<span
				style="font-size: 35px; margin-right: 660px; white-space: nowrap;">리뷰</span><br>
		</div>

		<c:forEach items="${review}" var="review">
			<div class="goodsDetailreviewtitle">
				<a style="line-height: 30px;"
					href="/flower/reviewDetail?ORDER_NUM=${review.ORDER_NUM}&GOODS_INDEX=${review.GOODS_INDEX}"
					id="ReviewDetail"> <img
					src='../../images/${review.STORED_FILE_REVIEW}' height="100"
					width="140" /></a>

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

				location.href = "/flower/order/PayPage?GOODS_INDEX="
					+ $("#GOODS_INDEX").val() 
					+ "&USER_ID="
					+ $("#USER_ID").val()
					+ "&GOODS_OP2="
			+ $("#GOODS_OP2 option:selected").val()
			+ "&GOODS_OP3="
			+ $("#GOODS_OP3 option:selected").val()
			+ "&GOODS_OP4="
			+ $("#GOODS_OP4 option:selected").val()
			+ "&GOODS_PRICE="
			+ $("#GOODS_PRICE").val(); 

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
<script language="JavaScript">
// 변경된 값을 저장
var sell_price;
var amount;


// init 초기값을 지정할 수 있다.
function init () {
  sell_price = document.form.sell_price.value;
  amount = document.form.amount.value;
  document.form.sum.value = sell_price;
  change();
}


  // add
// howmany 값을 1 증가 시키고, 합계를 계산.
function add () {
  hm = document.form.amount;
  sum = document.form.sum;
hm.value ++ ;

  sum.value = parseInt(hm.value) * sell_price;

  }

 

 

  // del

  // howmany 값을 1 감소 시키고, 합계를 계산.

  function del () {

  hm = document.form.amount;

  sum = document.form.sum;

 

  // 에러 처리 : 음수 값

  if (hm.value > 1) {

    hm.value -- ;

    sum.value = parseInt(hm.value) * sell_price;

  }

  }





  function change () {



  hm = document.form.amount;

  sum = document.form.sum;

 

  if (hm.value < 0) {

    hm.value = 0;

  }

  sum.value = parseInt(hm.value) * sell_price;

  } 



//-->

</script>
</html>
