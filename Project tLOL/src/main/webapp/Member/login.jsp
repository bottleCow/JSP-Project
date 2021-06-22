<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Project.tLOL.gg login in process</title>
</head>
<body>
	<c:if test="${result == 2 }">
		<script type="text/javascript">
			alert("관리자 계정 접속 성공!");
			location.href = "${referer}";
		</script>
	</c:if>
	<c:if test="${result == 1 }">
		<script type="text/javascript">
			alert("환영합니다!");
			location.href = "${referer}";
		</script>
	</c:if>
	<c:if test="${result == 0 }">
		<script type="text/javascript">
			alert("비밀번호가 틀립니다");
			history.go(-1);
		</script>
	</c:if>
	<c:if test="${result == -1 }">
		<script type="text/javascript">
			alert("없는 아이디 입니다");
			history.go(-1);
		</script>
	</c:if>
</body>
</html>