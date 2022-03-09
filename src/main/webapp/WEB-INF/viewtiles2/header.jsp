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
header a:hover {
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

header.drop {
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




/* 추가 */

.logo img {
  width: 150px;
}

body {
  margin: 0;
  padding: 0;
  font-family: sans-serif;
}
section {
  position: relative;
  width: 100%;
  background: url(bg.jpg);
  /* background-position: center center; */
  background-size: cover;
  background-repeat: no-repeat;
}

header {
  padding: 0 100px;
  width: 100%;
  height: 80px;
  box-sizing: border-box;
  background: rgba(255, 255, 255, 0.2);
  box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
  transition: 0.5s;
}

ul {
  position: relative;
  margin: 0;
  padding: 0;
  display: flex;
  float: right;
  transition: 0.5s;
}

ul li {
  list-style: none;
}

ul li a {
  position: relative;
  display: block;
  padding: 10px 20px;
  margin: 20px 0;
  text-transform: uppercase;
  text-decoration: none;
  color: #262626;
  font-weight: bold;
  transition: 0.5s;
}

ul li a:hover {
  background: #000;
  color: #fff;
}

.toggle {
  display: none;
  position: absolute;
  right: 10px;
  top: 26px;
  background: #fff;
  color: #fff;
  padding: 5px;
  cursor: pointer;
  font-weight: bold;
}

@media (max-width: 992px) {
  .logo img {
    margin-left: 20px;
  }
  .toggle {
    display: block;
  }
  header {
    padding: 0 0;
    background: rgba(255, 255, 255, 0.5);
  }
  header ul {
    width: 100%;
    display: none;
  }
  header ul.active {
    display: block;
  }

  header ul li a {
    margin: 0;
    display: block;
    text-align: center;
    color: #fff;
    background: rgba(0, 0, 0, 0.5);
  }
}
</style>
<script>
        $(document).ready(function () {
            $('.toggle').click(function () {
                $('ul').toggleClass('active');
            })
        })
    </script>
<body>
<section>
        <header class="heade">
            <a href="<c:url value='/main'/>" class="logo">
                <img src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FBVqz1%2FbtrubK2Yr7T%2FZI5KqbGaUxiHR8OdSjtBvK%2Fimg.png" alt="logo">
            </a>
            <a class="toggle">📁</a>
            <ul class="">
                <c:choose>
						<c:when test="${USER_ID != null}">
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
							</div>
							<div class="">
								<a href="<c:url value='/goods/sub'/>">정기구독 </a> <a
									href="<c:url value='/goods/sale'/>">일반배송</a> <a
									href="<c:url value='/notice'/>">이벤트</a>
							</div>
						</c:otherwise>
					</c:choose>
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
            </ul>
            
            
          
	
        </header>
    </section>
	
</body>
<script>
	let header = document.querySelector(".heade");
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