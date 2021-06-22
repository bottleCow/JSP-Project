<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Project.tLOL.gg memberOut</title>
</head>
<body>
	<c:if test="${result > 0  }">
		<script type="text/javascript">
			alert(${result } + "명의 회원 탈퇴 처리가 완료되었습니다.");
			location.href = document.referrer
		</script>
	</c:if>
	<c:if test="${result == 0  }">
		<script type="text/javascript">
			alert("탈퇴 처리 실패");
			history.back();
		</script>
	</c:if>
</body>
</html>