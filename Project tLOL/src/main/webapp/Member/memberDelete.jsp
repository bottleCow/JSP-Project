<!-- 회원 탈퇴 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Project.tLOL.gg delete</title>
</head>
<body>
	<c:if test="${result > 0  }">
		<script type="text/javascript">
			alert("회원 탈퇴 되었습니다.");
			location.href="../main.jsp";
		</script>
	</c:if>
	<c:if test="${result == 0  }">
		<script type="text/javascript">
			alert("탈퇴 실패");
			history.back();
		</script>
	</c:if>
</body>
</html>