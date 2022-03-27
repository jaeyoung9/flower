# flower

Problem : 
> 꽃파는 쇼핑몰
--------

Idea : 
> 꽃집을 자주 찾는 고객들이  어떤  꽃들이 있고  어떤것들이 없는지 방문해서 확인하는 것 보단 전체적으로  꽃을 파악하기 쉽고 편하게 볼수있기에 이러한 것을 바탕으로 프로젝트를 개발하게  되었습니다. 고객 입장으로 계획했던 프로그램을 만들고 직접  관리할수 있는 관리자가 필요하다 생각되었습니다. 상품을 등록하고 옵션에 맞게 카테고리로 들어가게 추가하고, 상품 옵션  기능을 넣어  원하는 개월수, 수량등 가격이 변동되도록 수정하였습니다. 가장 처음으로 계획한 프로젝트가 되었고, 기본적인 리뷰, 장바구니, 구매등  여러 기능을  담고 있습니다.  구매가 들어올경우 관리자는 주문내역에서 배송여부등을 수정할 수 있습니다.
-----


ERD
<img width="700" alt="KakaoTalk_20220328_083341373" src="https://user-images.githubusercontent.com/83907504/160306010-1a2edb77-5a96-44d1-af3c-78f61b2c4756.png">

주요기능과 로직: 
-----
+ 반응형 : 헤더, 푸터, 메인, 상품리스트에 반응형 제공.
++ 100%![1](https://user-images.githubusercontent.com/83907504/160306192-89ef3b10-95be-42fd-af48-29274ac227ab.png)
++ 50% ![2](https://user-images.githubusercontent.com/83907504/160306196-0c781c01-8b11-4a9d-b562-d87cfb1e3438.png)
++ 25% ![3](https://user-images.githubusercontent.com/83907504/160306200-0118f10f-bccc-4e42-84fe-0a89b5a40243.png)

+ 옵션 : 상품 등록시 옵션을 ,로 구분하고  페이지에선 드롭다운으로 표시.
+ Json : 상품리스트 제이슨 형식 제공.
+ Ajax : 다른 페이지 Ajax datatype : text 제공.
+ 메인 페이지 : 슬라이드 및 상품 리스트 제공.
+ 페이징 기능 : 상품 페이지를 6개씩 끊어서 보여줌.
+ 로그인 : 네이버 API 예정.(미구현)
+ DB : MySQL에 새로 생기는 데이터 저장
+ 리뷰 기능 : 주문 구매후 리뷰 작성단 , 관리자 리뷰답글단,  삭제 기능 제공.
+ 장바구니 : 원하는 리스트 및 옵션 선택후 장바구니 담기, 수정, 삭제 기능 제공.


Front : 
Javascript, Ajax, json, Css <br>
Back : 
Java - Spring data jdbc- Jquery, MVC패턴이용,  oracle,  <br>

개발기간 :  2022-01-24 ~ 2022-03-14<br>

기획 & 설계<br>
흐름도, 일정, 정의서, DB테이블 명칭 제공 <br>


https://jaeyoung9.github.io/flower/  접속불가;
