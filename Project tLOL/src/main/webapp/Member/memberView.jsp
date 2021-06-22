<!-- 회원정보 조회 jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 회원가입 하지 않은 사람들이 수정 삭제 못하게 하는 jsp -->
<%@ include file="../sessionChk.jsp" %>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="">
	<meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
	<meta name="generator" content="Hugo 0.83.1">
	
	<title>Project tLOL.gg update</title>
	<script type="text/javascript" src="../bootstrap/js/jquery.js"></script>
	
	<!-- Bootstrap -->
	<link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/sign-in/">
	<link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
	<link href="../bootstrap/css/bootstrap.css" rel="stylesheet">
	<link href="../bootstrap/css/login.css" rel="stylesheet">	
	<style>
		label,
		h2 {
			color: white;
		}
	</style>
</head>

<body class="text-center bg-dark">
	<div class="container">
		<form method="post" action="memberUpdate.do" name="frm" onsubmit="return chk()">	
			<div class="row mb-3 align-items-center">
				<div class="col form-floating">
					<div class="mb-5" onclick="location.href='../main.jsp'"><img src="../images/logo-remove.png" alt=""></div>
				</div>
			</div>
			<div class="row align-items-center">
				<div class="col form-floating mb-1">
					<h2>회원 정보 확인</h2>
				</div>
			</div>	
			<input type="hidden" name="member_id" value="${member.member_id}">
			<div class="row mb-2 align-items-center">
				<div class="col-sm-3"></div>
				<label for="inputId" class="col-sm-2 col-form-label">아이디</label>
				<div class="col-sm-4 form-floating">
					<input type="text" readonly class="form-control" id="inputId" value="${member.member_id }">
				</div>
				<div class="col-sm-3"></div>
			</div>
			<div class="row mb-2 align-items-center">
				<div class="col-sm-3"></div>
				<label for="inputNickname" class="col-sm-2 col-form-label">닉네임</label>
				<div class="col-sm-4 form-floating">
					<input type="text" readonly class="form-control" id="inputNickname" value="${member.member_nickname }">
				</div>
				<div class="col-sm-3"></div>
			</div>
			<div class="row mb-2 align-items-center">
				<div class="col-sm-3"></div>
				<label for="inputEmail" class="col-sm-2 col-form-label">이메일</label>
				<div class="col-sm-4 form-floating">
					<input type="text" readonly class="form-control" id="inputEmail" value="${member.member_email }">
				</div>
				<div class="col-sm-3"></div>
			</div>
			<div class="row mb-2 align-items-center">
				<div class="col-sm-3"></div>
				<label for="inputDate" class="col-sm-2 col-form-label">등록일</label>
				<div class="col-sm-4 form-floating">
					<input type="text" readonly class="form-control" id="inputDate" value="${member.member_reg_date}">
				</div>
				<div class="col-sm-3"></div>
			</div>
			<div class="d-grid gap-2 col-5 mx-auto">
				<button class="btn btn-lg btn-primary" onclick="location.href='../main.jsp'">메인화면으로 돌아가기</button>
			</div><br>
			<p class="mt-2 text-muted">&copy; Project.tLOL.gg</p>
		</form>
	</div>	
</body>
</html>