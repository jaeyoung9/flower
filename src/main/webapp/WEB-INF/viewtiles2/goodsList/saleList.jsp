<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ include file="/WEB-INF/viewtiles2/include/include-header.jspf" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이달의꽃 - 일반</title>
<style type="text/css">
.PAGE_NAVI{
text-align: center;
}
/* 노말라이즈 */
body, html {
    overflow-x:hidden;
}
body, ul, li {
width: 100%;
justify-content: center;
display: block;
    padding:0;
    margin:0;
    list-style:none;
}
a {
    text-decoration:none;
    color:inherit;
}
/* 노말라이즈 끝 */

/* 라이브러리 */
/* 상단 로고 및 메뉴 */
.con {
    max-width:1000px;
    margin:0 auto;
}

/* 배너 및 상품 목록 */
.img-box > img {
    width:100%;
    display:block;
}
.row::after {
    content:"";
    display:block;
    clear:both;
}
.row .cell{

    float:left;
    box-sizing:border-box;
}

/* 커스텀 */
.bn-box-1 {
    margin-top:20px;
}

/* 상품 정렬 */
.list-box-1 .cell {
width: 50%;
display: block;
justify-content: center;
    padding:0 10px;
    margin-top:20px;
    cursor:pointer;
}
.list-box-1 .row {
    margin:0 -10px;
}

/* 상품 제목 및 가격 */
.list-box-1 .cell > .prod-name, .list-box-1 .cell > .prod-price {
    text-align:center;
    font-weight:bold;
    margin-top:5px;
}
.list-box-1 .cell > .prod-price {
    font-size:1.2rem;
}

.list-box-1 .cell:hover > .prod-name, .list-box-1 .cell:hover > .prod-price {
    color:red;
}

/* 기타 효과 */
.list-box-1 .cell > .img-box > img {
    transition:transform 1s;
}
.list-box-1 .cell:hover > .img-box > img {
    transform:scale(1.25);
}
.list-box-1 .cell > .img-box {
    overflow:hidden;
    position:relative;
}
.list-box-1 .cell > .img-box > .ico-view {
    color:white;
    position:absolute;
    top:50%;
    left:50%;
    transform:translatex(-50%) translatey(-50%);
    opacity:0;
    transition:opacity 1s;
    z-index:1;
    border:2px solid white;
    border-radius:10px;
    padding:5px;
}
.list-box-1 .cell > .img-box > .ico-view:after {
    content:"VIEW";
    padding-left:5px;
}
.list-box-1 .cell:hover > .img-box > .ico-view {
    opacity:1;
}
.list-box-1 .cell:hover > .img-box::before {
    opacity:1;
}
.list-box-1 .cell > .img-box::after {
    content:"";
    background-color:rgba(0,0,0,0);
    position:absolute;
    top:0;
    left:0;
    right:0;
    bottom:0;
    transition:background-color 1s;
}
.list-box-1 .cell:hover > .img-box::after {
    background-color:rgba(0,0,0,0.5);
}
/* 무료배송 */
.list-box-1 .cell > .free-del {
    text-align:center;
    margin-top:12px;
}
.list-box-1 .cell > .free-del > span::after {
    content:"무료배송";
    font-size:0.8rem;
    border:1px solid red;
    color:red;
    padding:4px;
}
/* 반응형 사이즈 */
@media (max-width:600px) {
    .bn-box-1 > .img-box {
        margin-left:-50%;
    }
}
@media (min-width:1001px){
    .list-box-1 .cell:nth-child(5n + 1) {
        clear:both;
    }
}
@media (max-width:1000px) and (min-width:801px) {
    .list-box-1 .cell {
        width:25%;
    }
    .list-box-1 .cell:nth-child(4n + 1) {
        clear:both;
    }
}
@media (max-width:800px) and (min-width:601px) {
    .list-box-1 .cell {
        width:33.3333%;
    }
    .list-box-1 .cell:nth-child(3n + 1) {
        clear:both;
    }
}
@media (max-width:600px) and (min-width:401px) {
    .list-box-1 .cell {
        width:50%;
    }
    .list-box-1 .cell:nth-child(2n + 1) {
        clear:both;
    }
}
@media (max-width:400px) and (min-width:0px) {
    .list-box-1 .cell {
        width:100%;
    }
}
@media (max-width:1000px) {
    .menu-box-1 {
        display:none;
    }
}
@media (max-width:1000px) {
    .menu-box-1-m > img, .share > img {
        display:block;
    }
}
/* 커스텀 끝 */
/* 하단 */
.copy {
    text-align:center;
    padding:30px;
    background-color:#dfdfdf;
    margin-top:70px;
    font-weight:bold;
    }
</style>
</head>
<body>
<div>
		<table>
			

			<tbody>
<div class="bn-box-1 con">
    <div class="img-box"><img src='https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2Fb6wQWU%2Fbtruok4bOZc%2FAAZuqKYKU1Fk6KG2XO3360%2Fimg.jpg' 
    height='300' width='450'/>
    </div>
    </div>
    
			</tbody>
		</table>
	
    
    
<div class="PAGE_NAVI" id="PAGE_NAVI"></div>  <!-- 앞으로 페이징 태그가 그려질 부분 (밑에서 공통할수를 이용해 페이징 태그가 작성됨.) -->
<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX"/>  <!-- 현재 페이지 번호가 저장될 부분 -->
</div>
<!-- include를 하여 어떤 화면을 만들더라도 <body>태그 안쪽의 내용만 바뀌고, 나머지는 항상 똑같이 작성 -->
<%@ include file="/WEB-INF/viewtiles2/include/include-body.jspf" %>
<script type="text/javascript">
	$(document).ready(function() {
		fn_goodsSaleList(1);  //최초에 화면이 호출되면 1페이지의 내용을 조회하는 것을 의미.
		
	/* 	$("#write").on("click", function(e) { //글쓰기 버튼
			e.preventDefault();
			fn_openBoardWrite();
		}); */
		
		$("a[name='title']").on("click", function(e) {  //제목
			e.preventDefault();
			fn_goodsSaleDetail($(this)); //제목클릭하면 fn_openBoardDetail함수가 실행, 인자값으로 $(this)가 넘겨짐.
		});								 //이를 jQuery객체를 뜻한다. (게시글 제목인 <a>태그를 의미)
	});
	
/* 	function fn_openBoardWrite() {
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/sample/openBoardWrite.do'/>");
		comSubmit.submit();
	} */
	
	function fn_goodsSaleDetail(obj) {
		var comSubmit = new ComSubmit(); //폼에 동적으로 값을 추가하는 기능을 편하게 사용하기 위함인데, (ComSubmit객체 생성)
		comSubmit.setUrl("<c:url value='/goods/sale/page'/>");
		/* obj.parent().find("#IDX").val()은 jQuery를 이용하여 <a>태그의 부모노드 내에서 IDX라는 값을 가진 태그를 찾아
		   그 태그의 값을 가져오도록 한 것이다. */
		comSubmit.addParam("GOODS_INDEX", obj.parent().find("#GOODS_INDEX").val()); //이것을 addParam함수가 그 역할을 해주고,
		comSubmit.submit();											//서버로 전송될 키,값을 인자값으로 받는다.
	}
	
	function fn_goodsSaleList(pageNo) { //파라미터로 pageNo를 받는다. (pageNo는 호출하고자 하는 페이지 번호를 의미)
		var comAjax = new ComAjax();  //coomon.js파일에 ComAjax를 사용.
		comAjax.setUrl("<c:url value='/goods/goodsSaleList'/>");
		comAjax.setCallback("fn_goodsSaleListCallback"); //ajax요청이 완료된 후 호출될 함수의 이름을 지정
		comAjax.addParam("PAGE_INDEX", pageNo);  //현재 페이지 번호
		comAjax.addParam("PAGE_ROW", 5);  //한페이지에 보여줄 행(데이터)의 수
		comAjax.ajax();
	}
	
	//ajax호출이 되고 난 후 실행되는 콜백함수로 여기서는 화면을 다시 그리는 역할을 수행.
	function fn_goodsSaleListCallback(data) {  //(data)는 서버에 전송된 json형식의 결과값이다.
		var total = data.TOTAL;
		var body = $("table>tbody");
		body.empty();
						  //기존 c:otherwise태그 부분
		if(total == 0) {  //만약 조회된 결과가 0일 경우(데이터가 없을경우), 조회된 결과가 없기 때문에
			var str = "<tr>" + "<td colspan='4'>조회된 결과가 없습니다.</td>" + "</tr>"; //이 문구가 표시된다.
			body.append(str);
		}
		else {  //조회된 결과가 0이 아닐경우(데이터가 존재할 경우)
			var params = {  /* common.js파일에서 만든 gfn_renderPaging함수를 수행하기 위해서 파라미터를 만드는 과정이고
						       var변수명={} 선언을 하면 Object가 만들어지고, 거기에 각각 key와 value형식으로 값을 추가한다.*/
					divId : "PAGE_NAVI", //( divId는 key, "PAGE_NAVI"는 value형식이다.")
					pageIndex : "PAGE_INDEX", //( pageIndex는 key, "PAGE_INDEX"는 value형식이다.")
					totalCount : total, //( totalCount는 key, "total"는 value형식이다.")
					eventName : "fn_goodsSaleList" //( eventName는 key, "fn_selectBoardList"는 value형식이다.")
			};
			gfn_renderPaging(params); //gfn_rederPageing함수를 호출하면 object의 값을 이용하여 페이징 태그를 만든다.
			
			/* 기존 c:forEach태그 부분 */
			var str = "";
			//data.list가 서버에서 보내준 데이터, 이를 이용해서 jQuery의 .each함수를 사용하여 HTML태그를 만들어준다.
			$.each(data.list, function(key, value) {
				str += "<div class='list-box-1 con'>"
                    + "<ul class='row'>"
                    + "<li class='cell'>"
                    + "<div class='img-box'>"
                    + "<a href='#this' name='title'>" + "</a>"
                    + "<input type='hidden' name='title' id='GOODS_INDEX' value=" + value.GOODS_INDEX + ">"
                    + " <img src='../images/"+value.STORED_FILE_THUMB +"'height='300' width='450'/>"
                    + "<div class='ico-view'>"
                    + "<i class='fas fa-search'>"
                    + "</i>"
                    + "</div>"
                    + "</div>"
                    
                    + "<div class='prod-name'>"
                    + "<p>"
                    + "<a href='#this' name='title'>" + value.GOODS_TITLE + "</a>"
                    + "<input type='hidden' name='title' id='GOODS_INDEX' value=" + value.GOODS_INDEX + ">"
                    + "</p>"
                    
                    + "<p>"
                    + "<a href='#this' name='title'>" + value.GOODS_CONTENT+ "</a>"
                    + "<input type='hidden' name='title' id='GOODS_INDEX' value=" + value.GOODS_INDEX + ">"
                    
                    + "</p>"
                    + "</div>"
                    + "<div class='prod-price'>"
                    + "<p>"
                    + "<a href='#this' name='title'>" + value.GOODS_PRICE + '원' + "</a>"
                    + "<input type='hidden' name='title' id='GOODS_INDEX' value=" + value.GOODS_INDEX + ">"
                    + "</p>"
                    + "</div>"
                    + "<div class='free-del'>" + "<span>" + "</span>" + "</div>"
                    
                    + "</li>"
                
                    + "</ul>"
                    + "</div>";

        });
			body.append(str);
			
			//새롭게 추가된 각각의 목록의 제목에 상세보기로 이동할 수 있도록 click이벤트를 바인딩 함.
			$("a[name='title']").on("click", function(e) {  //제목
				e.preventDefault();
				fn_goodsSaleDetail($(this));
			});
		}
	}
</script>
</body>
</html>