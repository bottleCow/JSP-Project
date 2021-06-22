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
	
	<title>Project tLOL.gg join</title>
	<script type="text/javascript" src="../bootstrap/js/jquery.js"></script>
	
	<!-- Bootstrap -->
	<link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/sign-in/">
	<link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
	<link href="../bootstrap/css/bootstrap.css" rel="stylesheet">
	<link href="../bootstrap/css/login.css" rel="stylesheet">	
	
	<script type="text/javascript" >
	function chk() {
		if (!frm.member_id.value) {	
			alert('중복확인이 필요합니다');
			frm.member_id.focus();		
			return false;		
			}
		$.post("confirm.do", "member_id="+frm.member_id.value, function(data) {
			$('#err').html(data);
		});
	}
	</script>
</head>

<body class="text-center bg-dark">
		<form class="form-signin" method="post" action="join.do" name="frm">	
			<div class="mb-4 nav justify-content-center" onclick="location.href='../main.jsp'"><img src="../images/logo-remove.png" alt=""></div>
			<font color="white"><h1 class="h3 mb-4 mt-5 fw-normal">회원가입</h1></font>
			<div class="form-floating">
				<input type="text" class="form-control" placeholder="아이디" name="member_id" required="required" autofocus="autofocus" maxlength="20">
				<label for="floatingInput">ID</label>
				<input type="button" class="mt-2 mb-1 w-40 btn btn-outline-primary btn-sm" value="중복체크" onclick="chk()">		
			</div>
			<div id="err"></div>
			<div class="mt-1 form-floating">
				<input type="password" class="form-control" placeholder="비밀번호" name="member_pw" required="required" maxlength="20">
				<label for="floatingInput">Password</label>	
			</div>
			<div class="form-floating">
				<input type="text" class="form-control" placeholder="닉네임" name="member_nickname" required="required" maxlength="20">
				<label for="floatingInput">Nickname</label>	
			</div>
			<div class="mt-1 form-floating">
				<input type="email" class="form-control" placeholder="e-mail" name="member_email" required="required" maxlength="30">
				<label for="floatingInput">e-mail</label>	
			</div>
			<button class="mt-2 w-100 btn btn-lg btn-primary" type="submit">회원가입</button>
			<p class="mt-5 mb-3 text-muted">&copy; Project.tLOL.gg</p>
		</form>
</body>
</html>