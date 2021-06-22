<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Project.tLOL.gg join in process</title>
</head>
<body>
	<c:if test="${result ==  1 }">
		<script type="text/javascript">
			alert("회원가입 성공");
			location.href = "loginForm.do";
		</script>
	</c:if>
	<c:if test="${result == 0 }">
		<script type="text/javascript">
			alert("아이디 비밀번호가 맞지 않습니다");
			history.go(-1);
		</script>
	</c:if>
	<c:if test="${result == -1 }">
		<script type="text/javascript">
			alert("이미 있는 아이디 입니다");
			history.go(-1);
		</script>
	</c:if>
</body>
</html>