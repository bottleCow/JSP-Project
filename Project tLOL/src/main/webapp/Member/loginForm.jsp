<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="">
	<meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
	<meta name="generator" content="Hugo 0.83.1">
	
	<title>Project tLOL.gg login</title>
	
	<!-- Bootstrap -->
	<link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/sign-in/">
	<link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
	<link href="../bootstrap/css/bootstrap.css" rel="stylesheet">
	<link href="../bootstrap/css/login.css" rel="stylesheet">	
	
</head>
<body class="text-center bg-dark">
	<main class="form-signin">
		<form method="post" action="login.do">
		<input type="hidden" name="referer" value="${referer }">
			<div class="mb-4 nav justify-content-center" onclick="location.href='../main.jsp'"><img src="../images/logo-remove.png" alt=""></div>
			<font color="white"><h1 class="h3 mb-3 mt-5 fw-normal">로그인</h1></font>
			<div class="form-floating">
				<input type="text" class="form-control" placeholder="아이디" name="member_id" required="required" autofocus="autofocus" maxlength="20">
				<label for="floatingInput">ID</label>
			</div>
			<div class="mt-1 form-floating">
				<input type="password" class="form-control" placeholder="비밀번호" name="member_pw" required="required" maxlength="20">
				<label for="floatingInput">Password</label>	
			</div>
			<button class="mt-2 w-100 btn btn-lg btn-primary" type="submit">로그인</button>
			<a href="joinForm.do" class="mt-1 w-100 btn btn-lg btn-primary">회원가입</a>
			<p class="mt-5 mb-3 text-muted">&copy; Project.tLOL.gg</p>
		</form>
	</main>
</body>
</html>