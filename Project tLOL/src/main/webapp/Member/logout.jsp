<!-- 로그 아웃 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Project.tLOL.gg logout</title>
</head>
<body>
	<script type="text/javascript">
		alert("로그아웃 되었습니다");
		location.href="${referer}";
	</script>
</body>
</html>