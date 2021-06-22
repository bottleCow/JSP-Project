<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${result > 0 }">
	<script type="text/javascript">
		alert("입력 성공");
		location.href = "board.do?pageNum=${pageNum}&board_num=${board_num}";
	</script>
</c:if>
<c:if test="${result == 0 }">
	<script type="text/javascript">
		alert("입력 실패");
		history.go(-1);
	</script>
</c:if>
<!-- 입력 성공 or 입력실패 알림창 다음페이지 (목록으로 or 실패 시 글쓰기화면으로 넘어감) -->
</body>
</html>