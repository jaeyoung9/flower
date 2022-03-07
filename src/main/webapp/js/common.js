function gfn_isNull(str) {
	if(str == null) return true;
	if(str == "NaN") return true;
	if(new String(str).valueOf() == "undefined") return true;
	var chkStr = new String(str);
	if(chkStr.valueOf() == "undefined") return true;
	if(chkStr == null) return true;
	if(chkStr.toString().length == 0) return true;
	return false;
}
/* ComSumit을 공통함수로 만들어 사용 */
function ComSubmit(opt_formId) {
	this.formId = gfn_isNull(opt_formId) == true ? "commonForm" : opt_formId;
	this.url = "";
	
	if(this.formId == "commonForm") {
		$("#commonForm")[0].reset();
		$("#commonForm").empty();
	}
	
	this.setUrl = function setUrl(url) {
		this.url = url;
	};
	
	this.addParam = function addParam(key, value) {
		$("#"+this.formId).append($("<input type='hidden' name='"+key+"' id='"+key+"' value='"+value+"' >"));
	};
	/* submit의 겨우 어떻한 요청을 하면 화면이 바뀌기 때문에 그 안의 기능이 많지 않다. */
	this.submit = function submit() {
		var frm = $("#"+this.formId)[0];
		frm.action = this.url;
		frm.method = "post";
		frm.submit();
	};
}
/* ComAjax를 공통함수로 만들어 사용 */
var gfv_ajaxCallback = "";
function ComAjax(opt_formId) {
	this.url = "";
	this.formId = gfn_isNull(opt_formId) == true ? "commonForm" : opt_formId;
	this.param = "";
	
	if(this.formId == "commonForm") {
		var frm = $("#commonForm");
		if(frm.length > 0) {
			frm.remove();
		}
		
		var str = "<form id='commonForm' name='commonForm'></form>";
		$('body').append(str);
	}
	
	this.setUrl = function setUrl(url) {
		this.url = url;
	};
	
	this.setCallback = function setCallback(callBack) {
		fv_ajaxCallback = callBack;
	};
	
	this.addParam = function addParam(key, value) {
		this.param = this.param + "&" + key + "=" + value;
	};
	
	/* ajax의 경우는 설정해야할게 submit보다 많다. */
	this.ajax = function ajax() {
		if(this.formId != "commonForm") {
			this.param += "&" + $("#" + this.formId).serialize();
		}
		$.ajax({
			url : this.url,  //호출할 url
			type : "POST",  //POST방식, GET방식의 통신을 설정 
			data : this.param,  /* ajax를 이용하여 서버에 요청을 할 때 서버로 전달할 인자(Parameter)를 의미 
									원래는 object형식으로 data를 지정하지만, 여기서는 addParam, form자체를 전송하기 때문이다. */
			async : false,  /* 동기식과 비동기식의 통신방식을 의미, *동기식: 클라이언트->서버->클라이언트의 과정에서 서버의 답변이
								올때까지 다른일을 수행하지 못하고 기다리기만 하는 방식, *비동기식: 요청을 보내고 다른일을 수행할 수 있다. */ 
			success : function(data, status) {
				if(typeof(fv_ajaxCallback) == "function") {
					fv_ajaxCallback(data);
				}
				else {
					eval(fv_ajaxCallback + "(data);");
				}
			}
		});
	};
}

/* 페이징 태그를 만드는 부분 
   (2가지 함수: 
   		1. gfn_renderPaging함수 페이징 태그를 작성하는 역할
   		2. _movePage함수 페이징 태그를 클릭하였을 경우 해당 페이지로 이동하는 역할. )
   divId: 페이징 태그가 그려질 div
   pageIndex: 현재 페이지 위치가 저장될 input 태그 id
   recordCount: 페이징당 레코드 수
   totalCount: 전체 조회 건수
   eventName: 페이징 하단의 숫자 등의 버튼이 클릭되었을 때 호출될 함수 이름
*/
var gfv_pageIndex = null;
var gfv_eventName = null;
function gfn_renderPaging(params) { //함수에서 파라미터는 params라는 값 하나만 받는다.
	var divId = params.divId; //페이징이 그려질 div id  (사용할때 필요한 파라미터)
	gfv_pageIndex = params.pageIndex; //현재 위치가 저장될 input 태그 (사용할때 필요한 파라미터)
	var totalCount = params.totalCount; //전체 조회 건수 (사용할때 필요한 파라미터)
	var currentIndex = $("#"+params.pageIndex).val(); //현재 위치 (사용할때 필요한 파라미터)
	if($("#"+params.pageIndex).length == 0 || gfn_isNull(currentIndex) == true) {
		currentIndex = 1;
	}
	
	var recordCount = params.recordCount; //페이지당 레코드 수
	if(gfn_isNull(recordCount) == true) {
		recordCount = 5;
	}
	
	var totalIndexCount = Math.ceil(totalCount / recordCount); //전체 인덱스 수
	gfv_eventName = params.eventName;
	
	$("#"+divId).empty();
	var preStr = "";  //맨앞으로 이동 태그
	var postStr = "";  //맨뒤로 이동 태그
	var str = "";  //1~10등과 같은 인덱스 태그
	
	var first = (parseInt((currentIndex-1) / 10) * 10) +1;
	var last = (parseInt(totalIndexCount/10) == parseInt(currentIndex/10)) ? totalIndexCount%10 : 10;
	var prev = (parseInt((currentIndex-1)/10)*10) -9 > 0 ? (parseInt((currentIndex-1)/10)*10) -9 : 1;
	var next = (parseInt((currentIndex-1)/10)+1) * 10 + 1 < totalIndexCount ? (parseInt((currentIndex-1)/10)+1) * 10 + 1 : totalIndexCount;
	
	if(totalIndexCount > 10) {  //전체 인덱스가 10이 넘을 경우에 preStr변수는 맨압, 앞 태그 작성
		preStr += "<a href='#this' class='pad_5' onclick='_movePage(1)'>[<<]</a>" +
					"<a href='#this' class='pad_5' onclick='_movePage("+prev+")'>[<]</a>";
	}
	else if(totalIndexCount <= 10 && totalIndexCount > 1) { //전체 인덱스가 10보다 작을 경우 preStr변수는 맨앞 태그 작성
		preStr += "<a href='#this' class='pad_5' onclick='_movePage(1)'>[<<]</a>";
	}
	
	if(totalIndexCount > 10) {  //전체 인덱스가 10이 넘을 경우에 postStr변수는 맨뒤, 뒤 태그 작성
		postStr += "<a href='#this' class='pad_5' onclick='_movePage("+next+")'>[>]</a>" +
					"<a href='#this' class='pad_5' onclick='_movePage("+totalIndexCount+")'>[>>]</a>";
	}
	else if(totalIndexCount <= 10 && totalIndexCount > 1) {  //전체 인덱스가 10보다 작을 경우 postStr변수는 맨뒤 태그 작성
		postStr += "<a href='#this' class='pad_5' onclick='_movePage("+totalIndexCount+")'>[>>]</a>" ;
	}
	
	//str변수는 인덱스가 담긴다.
	for(var i=first; i<(first+last); i++) {
		if(i != currentIndex) {
			str += "<a href='#this' class='pad_5' onclick='_movePage("+i+")'>"+i+"</a>";
		}
		else {
			str +="<b><a href='#this' class='pad_5' onclick='_movePage("+i+")'>"+i+"</a></b>";
		}
	}
	$("#"+divId).append(preStr + str + postStr);
}
//_movePage는 해당 태그가 클릭되었을 때, JSP에서 선언한 함수를 호출하게 끔 구성됨.
function _movePage(value) {
	$("#"+gfv_pageIndex).val(value);
	if(typeof(gfv_eventName) == "function") {
		gfv_eventName(value);
	}
	else {
		eval(gfv_eventName + "(value);");
	}
}




