<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 회원가입 하지 않은 사람들이 수정 삭제 못하게 하는 jsp -->
<%@ include file="../sessionChk.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Project.tLOL.gg</title>
</head>
<body>
	<c:if test="${result > 0  }">
		<script type="text/javascript">
			alert("회원정보 수정 성공");
			location.href="view.do";
		</script>
	</c:if>
	
	<c:if test="${result == 0  }">
		<script type="text/javascript">
			alert("회원정보 수정 실패");
			history.go(-1);
		</script>
	</c:if>
</body>
</html>