# JSP/Project/LOL

## 👽JSP 중간프로젝트(League of legends 게임 전적 검색 사이트)👽
-RIOT API를 사용한 롤 전적 검색 프로젝트

-게시판 페이지 + 회원(관리자 계정 포함)관리 페이지 
![main](https://user-images.githubusercontent.com/84126480/122900612-cdb26b80-d387-11eb-8af6-4d6cf43ce805.jpg)
## API
-RIOT에서 제공하는 API를 활용해서 OP.GG와 같은 사이트를 만들어보려고 했습니다.

-Riot에서 정식 API key를 승인받기까지 3주정도의 긴 시간이 걸렸으며 메인페이지(main.jsp) 검색창에서 소환사 이름을 검색하게되면 입력된 값이 summonerName 인자로 들어가게 되어 결과를 출력하게 됩니다.

## Member
🙋‍♂️강병우(본인)

1.회원가입 페이지(ORACLE DB에서 입력된 아이디가 사용가능한 아이디인지 사전 체크)

2.로그인 페이지(일반회원은 member_admin의 값을 '0'으로 관리자계정은 '1'로 따로 구분)(session check기능 추가)

3.회원 정보 수정 및 탈퇴(탈퇴를 해도 DB상에서 완전히 삭제되는것이 아닌 member_del값을 'n'또는 'y'값으로 구분해서 관리)

4.페이지 전체 UI관리(Bootstrap 5.0.1, css)

5.중복되는 페이지 sitemesh decorators.xml을 통해 관리


🙋‍♂️곽승민 (API)

🙋‍♂️김영찬 (게시판페이지)

## 🌎개발 환경🌏
OS == Window10

Developing Tool == Eclipse IDE

Data Base == Oracle 11g

Language == Java(1.8), JavaScript, JSP, CSS, HTML

Web Application Server == Apache Tomcat-9.0 🐈

## 🖥주요 화면🖥
![summoner](https://user-images.githubusercontent.com/84126480/122905173-f2a8dd80-d38b-11eb-83b9-e7eba0bdc2e7.jpg)
^ 소환사 검색 결과창 ^

![loginPage](https://user-images.githubusercontent.com/84126480/122904867-b2e1f600-d38b-11eb-8c1b-45235104e5f3.jpg)
^ 로그인 페이지 ^

![option](https://user-images.githubusercontent.com/84126480/122904973-c68d5c80-d38b-11eb-8e24-245ac08a4ab0.jpg)
< Drop Down Menu <

![community](https://user-images.githubusercontent.com/84126480/122905035-d73dd280-d38b-11eb-8182-b7f75c4f8dce.jpg)
^ 게시판 페이지 ^

![community2](https://user-images.githubusercontent.com/84126480/122905087-e45ac180-d38b-11eb-9931-20d804d1a890.jpg)
^ 게시판 댓글 작성 / 추천 기능 ^

![summernote](https://user-images.githubusercontent.com/84126480/122905137-ee7cc000-d38b-11eb-9339-3c2ea15eb0b0.jpg)
^게시글 작성 summernote ^

