<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="deco" uri="http://www.opensymphony.com/sitemesh/decorator"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="">
	<meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
	<meta name="generator" content="Hugo 0.83.1">
	<title>롤 전적 검색 - tLOL</title>
	<link rel="icon" href="/Project_tLOL/images/icon.png">
	
	<!-- Bootstrap core CSS -->
	<link href="/Project_tLOL/bootstrap/css/bootstrap.min.css" rel="stylesheet"
		integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
	<link href="/Project_tLOL/bootstrap/css/styles.css" rel="stylesheet">
	<link href="/Project_tLOL/bootstrap/css/darkmode.css" rel="stylesheet">
	<link rel="stylesheet" href="/Project_tLOL/bootstrap/css/resultStyle.css">
	<link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/headers/">
	<!-- Custom styles for this template -->
	<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
	<script src="https://kit.fontawesome.com/6cd41253e5.js" crossorigin="anonymous"></script>
</head>

<body class="col-12 bg-dark">
	<header class="bg-dark text-white fixed-top">
		<div class="container">
			<div class="d-flex flex-nowrap align-items-center justify-content-between">
				<a class="navbar-brand" href="/Project_tLOL/main.jsp">
					<img src="/Project_tLOL/images/logo-remove.png" alt="" width="230" height="100">
				</a>
				<div class="p-2 bd-highlight">
				    <form class="input-group" action="/Project_tLOL/Board/testSummon.do">
				      <input type="search" class="form-control form-control-dark" placeholder="Search..." name="summonerNick" aria-label="Search">
				      <button class="btn btn-outline-secondary" type="submit" id="button-addon2"><i class="fa fa-search"></i></button>
				    </form>
			    </div>
				<c:choose>
					<c:when test="${sessionScope.member_id == null }">
						<div class="dropdown text-end">
							<button type="button" class="btn btn-outline-secondary text-white me-2" onclick="location.href='/Project_tLOL/Member/loginForm.do'">Login</button>
						</div>
					</c:when>
					<c:when test="${sessionScope.member_id != null }">
						<div class="dropdown text-end">
							<c:choose>
								<c:when test="${sessionScope.member_admin == 0 }">
									<span class="textUserNick">${sessionScope.member_nickname }</span>
									<span class="textUserEnd">님 환영합니다!</span>
									<span style="padding: 10px"></span>
									<button type="button" class="btn btn-info dropdown-toggle" data-bs-toggle="dropdown" 
									data-bs-display="static" aria-expanded="false">내정보</button>
									<ul class="dropdown-menu dropdown-menu-end">
										<li><a class="dropdown-item" href="/Project_tLOL/Member/memberUpdateForm.do">회원정보 수정</a></li>
										<li><a class="dropdown-item" href="/Project_tLOL/Board/board.do?member_num=${sessionScope.member_num }">내 글 보기</a></li>
										<li><a class="dropdown-item" href="/Project_tLOL/Board/myComment.do?member_num=${sessionScope.member_num }">내 댓글 보기</a></li>
										<li><hr class="dropdown-divider"></li>
										<li><a class="dropdown-item" href="/Project_tLOL/Member/logout.do">로그아웃</a></li>
									</ul>
								</c:when>
								<c:when test="${sessionScope.member_admin == 1 }">
									<span class="textUserNick">관리자</span>
									<span class="textUserEnd">님 환영합니다!</span>
									<span style="padding: 10px"></span>
									<button type="button" class="btn btn-warning dropdown-toggle" data-bs-toggle="dropdown" 
									data-bs-display="static" aria-expanded="false">관리메뉴</button>
									<ul class="dropdown-menu dropdown-menu-end">
										<li><a class="dropdown-item" href="/Project_tLOL/Manager/memberManage.do">회원관리</a></li>										
										<li><a class="dropdown-item" href="/Project_tLOL/Board/manageArticle.do">게시글 관리</a></li>
										<li><hr class="dropdown-divider"></li>
										<li><a class="dropdown-item" href="/Project_tLOL/Board/board.do?member_num=${sessionScope.member_num }">내 글 보기</a></li>
										<li><a class="dropdown-item" href="/Project_tLOL/Board/myComment.do?member_num=${sessionScope.member_num }">내 댓글 보기</a></li>
										<li><hr class="dropdown-divider"></li>
										<li><a class="dropdown-item" href="/Project_tLOL/Member/logout.do">로그아웃</a></li>
									</ul>
								</c:when>
							</c:choose>
						</div>
					</c:when>
				</c:choose>
			</div>
		</div>
		<div class="bg-secondary" style="height:20px"></div>
	</header>

	<!-- Sidebar -->
  	<div class="container-fluid">
      <div class="flex-nowrap">
        <div class="sidebar bg-dark text-white">
			<form action="/Project_tLOL/Board/boardSearchAll.do" method="get" class="input-group">
				 <input type="search" pattern=".{2,}" required title="2 글자 이상 입력해주세요" name="keyword" class="form-control form-control-dark" placeholder="전체 검색..." aria-label="Search">
				 <button class="btn btn-outline-secondary" type="submit" id="button-addon2"><i class="fa fa-search"></i></button>
			</form>

          <ul class="list-unstyled ps-0">
			<li class="border-top my-3"></li>
			<li class="mb-1">
				<button class="btn btn-toggle align-items-center rounded collapsed text-white"
					data-bs-toggle="collapse" data-bs-target="#home-collapse" aria-expanded="true">뉴스&정보</button>
				<div class="collapse show" id="home-collapse">
					<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
						<li><a href="/Project_tLOL/Board/board.do?board_num=1" class="link-dark rounded text-white">공지사항</a></li>
						<li><a href="/Project_tLOL/Board/board.do?board_num=2" class="link-dark rounded text-white">뉴스</a></li>
					</ul>
				</div>
			</li>
		  </ul>
          <ul class="list-unstyled ps-0">
			<li class="border-top my-3"></li>
			<li class="mb-1">
				<button class="btn btn-toggle align-items-center rounded collapsed text-white"
					data-bs-toggle="collapse" data-bs-target="#dashboard-collapse" aria-expanded="true">커뮤니티</button>
				<div class="collapse show" id="dashboard-collapse">
					<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
						<li><a href="/Project_tLOL/Board/board.do?board_num=3" class="link-dark rounded text-white">자유게시판</a></li>
						<li><a href="/Project_tLOL/Board/board.do?board_num=6" class="link-dark rounded text-white">팁/노하우</a></li>
						<li><a href="/Project_tLOL/Board/board.do?board_num=5" class="link-dark rounded text-white">이미지/영상</a></li>
					</ul>
				</div>
			</li>
          </ul>
        </div>
        
        <div class="col-sm-12 main">
          <div class="row justify-content-center" style="padding-top:50px;">
			<deco:body></deco:body>
          </div>
        </div>
      </div>
    </div>
    
	<!-- footer -->    
	<footer class="footer bg-dark text-white">
		<div class="container" style="padding-top:150px;">
			<ul class="nav">
				<li class="nav-item"><a class="nav-link active text-white" aria-current="page" href="#">About Project-Tlol</a></li>
				<li class="nav-item"><a class="nav-link text-white" href="#">도움말</a></li>
			</ul>
			<div class="footer_copyright text-center">
			© 2012-2021 tLOL.GG. tLOL.GG isn’t endorsed by Riot Games and doesn’t reflect the views or opinions of Riot Games or anyone officially involved in producing or managing
                            League of Legends. League of Legends and Riot Games are trademarks or registered trademarks of Riot Games, Inc. League of Legends © Riot Games, Inc.                                 
			</div>
			<div></div>
		</div>
	</footer>
	
	<script src="/Project_tLOL/bootstrap/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
	<script src="/Project_tLOL/bootstrap/js/sidebar.js"></script>	
</body>
</html>