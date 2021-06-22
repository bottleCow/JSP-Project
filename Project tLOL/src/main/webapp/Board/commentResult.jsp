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
		location.href = "content.do?article_num=${article_num}&board_num=${board_num}&pageNum=${pageNum }";
	</script>
</c:if>
<c:if test="${result == 0 }">
	<script type="text/javascript">
		alert("잘못된 접근입니다.");
		history.go(-1);
	</script>
</c:if>
</body>
</html>