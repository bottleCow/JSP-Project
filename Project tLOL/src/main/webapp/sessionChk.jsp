<!-- 회원가입 하지 않은 사람들이 수정 삭제 못하게 하는 jsp -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Project.tLOL.gg</title>
</head>
<body>
<c:set var="member_id" value="${sessionScope.member_id }"></c:set>
<c:if test="${empty member_id }">
	<script type="text/javascript">
		alert("로그인 해주세요")
		location.href="/Project_tLOL/Member/loginForm.do";
	</script>
</c:if>
<c:if test="${member_admin eq 0}">
	<script type="text/javascript">
		alert("접근 권한이 없습니다")
		location.href="../main.jsp"
	</script>
</c:if>
</body>
</html>