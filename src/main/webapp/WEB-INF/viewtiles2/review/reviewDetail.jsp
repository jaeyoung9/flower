<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/viewtiles2/include/include-header.jspf" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:forEach items="${reviewDetail}" var="reviewDetail">
<title>${reviewDetail.REVIEW_CONTENT}</title><!-- /* "FLOWER" */ -->
</c:forEach>
<style type="text/css">
.review-detail-name{
    width: 100%;
    display: block;
    padding: 120px 0px 0px 0px;
    box-sizing: border-box;
    position: relative;
}
.review-detail-img{
position: relative;
display: block;
left: 60px;
top: 195px;
}
.review-detail-content{
position: relative;
display: block;
left: 550px;
bottom: 415px;
width: 55%;

}
.review-amin-content{
width: 30%;
position: relative;
display: block;
left: 550px;
bottom: 430px;
}
.reviewReWrite{
    top: 100px;
}
</style>
</head>
<body>


<div class="review-detail-name">
        <h1 align="center" style="font-size:60px;">리뷰 내용</h1>
    </div>
<c:forEach items="${reviewDetail}" var="reviewDetail">
<input type="hidden" id="REVIEW_INDEX" value="${reviewDetail.REVIEW_INDEX}">
<input type="hidden" id="ORDER_NUM" value="${reviewDetail.ORDER_NUM}">
<input type="hidden" id="GOODS_INDEX" value="${reviewDetail.GOODS_INDEX}">
<input type="hidden" id="GOOD" value="${reviewDetail.REVIEW_DATE}"> 

<img  class="review-detail-img" src='images/${reviewDetail.STORED_FILE_REVIEW}' height="600" width="450" />

<textarea class="review-detail-content" id="REVIEW_CONTENT" name="" style="resize: none;"
                            maxlength="150" rows="15" cols="60"
                            placeholder="리뷰를 작성하세요(150자 내외)" readonly="readonly">${reviewDetail.REVIEW_CONTENT}</textarea>            


</c:forEach>
<br>
<br>
<%-- 리뷰 답변 --%>
<div class="review-amin-content">
관리자 댓글<br>
<c:forEach items="${reviewReDetail}" var="reviewReDetail">
${reviewReDetail.REVIEW_RE_DATE}
<br>${reviewReDetail.REVIEW_RE_CONTENT}<br>

<c:if test="${AMIN_TIM eq 'Y'}">
    <button type="button" id="reviewReDelete">답변 삭제</button><br>
    <!-- <input type="button" value="답변 삭제" id="reviewReDelete"> -->
</c:if>
</c:forEach>
</div>
<c:if test="${AMIN_TIM eq 'Y'}">

<%-- 값 꺼내오기  --%>
    
    
    <form  id="frm" name="frm" enctype="multipart/form-data">
    <table>
        <tr>
            <td>
                <div class="reviewReWrite">
                    <textarea id="REVIEW_RE_CONTENT" name=""
                    style="resize: none;" maxlength="150" 
                    rows="5" cols="60" 
                    placeholder="관리자 답변을 작성하세요.(150자 내외)"></textarea><br>
            
                <input type="button" value="등록" id="reviewReWrite">
                <input type="button" value="취소" id="cancel">
                </div>
            </td>
        </tr>
    </table>
    </form>
</c:if>
</body>

<script type="text/javascript">
$(function(){
    $("#reviewReWrite").click(function () {
        $.ajax({
            url : "<c:url value='/reviewReWrite'/>",
            type : "POST",
            dataType : "TEXT",
            data : {
                "REVIEW_INDEX" : $("#REVIEW_INDEX").val(),
                "REVIEW_RE_CONTENT" : $("#REVIEW_RE_CONTENT").val(),
            },
            // 정보 넘길때 사용할 이름: $("jsp로 받아올 값").val() 일단 user_id 는 flower
            success : function(data) {
                alert("작성 완료");
                location.reload();
            },error:function(request, status, error) {
                alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
            }
        })
    })
})
    
$(function(){
    $("#reviewReDelete").click(function () {
        $.ajax({
            url : "<c:url value='/reviewReDelete'/>",
            type : "POST",
            dataType : "TEXT",
            data : {
                "REVIEW_INDEX" : $("#REVIEW_INDEX").val(),
            },success : function(data) {
                alert("삭제 완료");
                location.reload();
            },error:function(request, status, error) {
                alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
            }
        })
    })
})

/* 취소시 뒤로가기. */
$(function() {
    $("#cancel").click(function() {
        history.go(-1);
    })
})



</script>
</html>