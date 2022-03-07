<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/viewtiles2/include/include-header.jspf"%>

<!-- JS -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>

<style>

/*메뉴판*/
.div_menu {
	text-align: center;
}

/*전체글자*/
@font-face {
	font-family: 'paybooc-Bold';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-07@1.0/paybooc-Bold.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

/*비밀번호 확인 글자크기*/
.paw {
	font-size: 10px;
}

/*모든 type=text 이름들*/
h3 {
	margin: 19px 0 8px;
	font-size: 20px;
	font-weight: 700;
}

/* . 지우기 */
ul {
	list-style: none;
}
/* header a태그 밑줄 지우기/ 색지우기  */
header a {
	display: inline-block;
	text-transform: uppercase;
	text-decoration: none;
	color: #333;
	padding: 0 40px;
	line-height: 5rem;
	height: 5rem;
}

.header a {
	white-space: nowrap;
	overflow: hidden;
	display: inline-block;
	text-transform: uppercase;
	text-decoration: none;
	color: #333;
	padding: 0 40px;
	line-height: 5rem;
	height: 5rem;
	z-index: 1;
	right: 0;
	left: 0;
	box-sizing: border-box;
}

a {
	color: #333;
	text-transform: uppercase;
	text-decoration: none;
}

/* 헤더 */
.header a:hover {
	content: '';
	height: 5px;
	width: auto;
	background-color: pink;
	border-radius: 10px;
	transition: 5s;
	bottom: 0;
	left: 0;
}

.header {
	width: 100%;
	height: 5rem;
	background: #fff;
	position: absolute;
	top: 0;
	left: 0;
	z-index: 1;
}

.header ul {
	width: 100%;
	height: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
	z-index: 1;
}

.header.drop {
	position: fixed;
	animation: dropHeader 0.3s;
	z-index: 1;
}

@
keyframes dropHeader { 0% {
	top: -5rem;
}

100




%
{
top




:




0


;
}
}

/*로고*/
header .div_img {
	position: absolute;
	right: auto;
	left: 0px;
	box-sizing: border-box;
}



</style>
<body>
	<header class="header">
		<div class="inner-header">
			<nav>
				<c:choose>
					<c:when test="${USER_ID == null}">
						<div style="float: right;">
							<a href="<c:url value='/loginForm'/>">로그인 </a> <a
								href="<c:url value='/joinForm'/>">회원가입 </a>
						</div>

					</c:when>
					<c:when test="${USER_ID != null}">
						<c:if test="${AMIN_TIM eq 'Y'}">
							<div style="float: right;">
								<a href="<c:url value='/aminMyPage'/>">관리자페이지 </a>
							</div>
						</c:if>
						<div style="float: right;">
							<a class="user"><c:out value="${USER_ID} 님" /></a> <a
								href="<c:url value='/basket?USER_ID=${USER_ID} '/>">장바구니</a> <a
								href="<c:url value='/logout'/>">로그아웃 </a>
						</div>
					</c:when>
					<c:otherwise>
					</c:otherwise>
				</c:choose>

				<div class="div_menu">
					<c:choose>
						<c:when test="${USER_ID != null}">
							<div class="div_img">
								<a href="<c:url value='/main'/>"><img
									src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FBVqz1%2FbtrubK2Yr7T%2FZI5KqbGaUxiHR8OdSjtBvK%2Fimg.png" /></a>
							</div>
							<div class="">
								<a href="<c:url value='/goods/sub'/>">정기구독 </a> <a
									href="<c:url value='/goods/sale'/>">일반배송</a> <a
									href="<c:url value='/notice'/>">이벤트</a>
								<c:if test="${AMIN_TIM eq 'N'}">
									<a href="<c:url value='/myPage?USER_ID=${USER_ID }'/>"
										id="myPage">마이페이지</a>
									<input type="hidden" id="USER_ID" value="${USER_ID }">
								</c:if>

							</div>
						</c:when>
						<c:otherwise>
							<div class="div_img">
								<a href="<c:url value='/main'/>"><img
									src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FBVqz1%2FbtrubK2Yr7T%2FZI5KqbGaUxiHR8OdSjtBvK%2Fimg.png" /></a>
							</div>
							<div class="">
								<a href="<c:url value='/goods/sub'/>">정기구독 </a> <a
									href="<c:url value='/goods/sale'/>">일반배송</a> <a
									href="<c:url value='/notice'/>">이벤트</a>
							</div>
						</c:otherwise>
					</c:choose>
				</div>
			</nav>
		</div>
	</header>
</body>
<script>
	let header = document.querySelector(".header");
	let headerHeight = header.offsetHeight;

	window.onscroll = function() {
		let windowTop = window.scrollY;
		if (windowTop >= headerHeight) {
			header.classList.add("drop");
		} else {
			header.classList.remove("drop");
		}
	};
</script>