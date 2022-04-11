## 이달의 꽃 (flower)

Problem 
--------
> 꽃 판매 쇼핑몰


Idea
-----
> 꽃집을 자주 찾는 고객들이 어떤 꽃들이 있고 어떤 것들이 없는지 방문해서 확인하는 것보단 전체적으로 꽃을 파악하기 쉽고 편하게 볼 수 있기에 이러한 것을 바탕으로 프로젝트를 개발하게 되었습니다.
상품을 등록하고 옵션에 맞게 카테고리로 들어가게 추가하고, 상품 옵션 기능을 넣어 원하는 개월 수, 수량 등 가격이 변동되도록 수정하였습니다.
가장 처음으로 계획한 프로젝트가 되었고, 기본적인 리뷰, 장바구니, 구매 등 여러 기능을 담고 있습니다.
구매가 들어올 경우 관리자는 주문명세에서 배송 여부 등을 수정할 수 있습니다.


개발환경
-----
+ 프레임 워크 : Spring 4.0.4 Mybatis
+ 개발 언어 : java 11, javaScript, JSP, CSS
+ DB : Oracle 11g
+ WAS : Tomcat 9.0

Front 
-----
> Javascript, Ajax, Json, CSS 

Back 
-----
> Java - Spring data jdbc- Jquery, MVC,  Oracle  


Erd
-----
![GetImage (1)](https://user-images.githubusercontent.com/83907504/160504280-9a137d12-ca24-46af-97dd-1a39c2f0fd32.png)


주요기능과 로직: 
-----

### 반응형 
+  헤더
+  푸터
+  메인
+  상품리스트에 반응형 제공.

### 옵션
+ 상품 등록 시 옵션을 ,로 구분하고  상품 상세 페이지에선 ,가 제외된 옵션을 드롭 다운으로 표시.
<img width="770" alt="화면 캡처 2022-04-01 111744" src="https://user-images.githubusercontent.com/94159810/161181520-3bb15475-cdcc-43a2-becd-290706475e64.png">

### Json
+  상품 리스트 제이슨 형식 제공.
 
### Ajax
+ 페이지 Ajax

### 메인 페이지
+ 슬라이드 및 상품 판매 리스트 제공.
![localhost_9000_flower_main](https://user-images.githubusercontent.com/94159810/161180319-0dbd2ef9-e4df-4f9a-8a15-b6a1e228b40b.png)

### 페이징 기능
+ 상품 페이지를 6개씩 끊어서 보여줌.
<img width="447" alt="화면 캡처 2022-04-01 110822" src="https://user-images.githubusercontent.com/94159810/161180621-a204079a-7e80-486d-9a3d-c7773eca0254.png">

### 로그인, 회원가입
+  로그인, 아이디 중복 확인
+  비밀번호 일치여부 
+  JSON방식을 이용한 DB와 입력된 ID값 중복확인
+  네이버 주소api
+  탈퇴회원
+  아이디 비밀번호 찾기
<img width="735" alt="화면 캡처 2022-04-01 104759" src="https://user-images.githubusercontent.com/94159810/161178869-bd86ce65-fca3-4ad1-8cd1-2c83e92243d2.png">

### DB
+ Oracle 11g를 설치 및 사용하여 데이터 삽입, 수정, 삭제

### 리뷰 기능
+ 주문 구매 후 리뷰 작성
+ 관리자 리뷰 답글
+ 삭제 기능 제공.
+ 상품 상세페이지에 달린 리뷰
<img width="812" alt="화면 캡처 2022-04-01 123413" src="https://user-images.githubusercontent.com/94159810/161190226-92e6cb68-baee-4271-a92b-6cdec7ad2f42.png">

### 장바구니
+ 원하는 리스트 및 옵션 선택 후 장바구니 담기, 수정, 삭제 기능 제공.
<img width="1100" alt="화면 캡처 2022-04-01 112707" src="https://user-images.githubusercontent.com/94159810/161183183-35e4b304-aca4-465c-b30e-22bfa7bf8dd3.png">

개발기간  
-----
> 2022-01-24 ~ 2022-03-14


기획 & 설계
-----
<img width="472" alt="4" src="https://user-images.githubusercontent.com/83907504/160307328-49a5bdbe-3d0c-4e67-93f3-e8deaa7fb60d.png">


다이어그램
-----
![GetImage](https://user-images.githubusercontent.com/83907504/160504369-b0a394f5-0d72-4e9a-8316-ce72ea2504d7.png)


DB 설계(테이블, 제약조건)
-----
<img width="1082" alt="화면 캡처 2022-04-01 101746" src="https://user-images.githubusercontent.com/94159810/161176229-5eee4432-e77f-4a47-8f07-e9aa2949e2be.png">


개발자
-----
> 민재영 김형태 정주영 김성법 이 솔 조영준



index.html / index.jsp ( mata ) 불가;
-----
https://github.com/jaeyoung9/flower/  접속불가;
