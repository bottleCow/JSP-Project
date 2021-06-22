<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<c:if test="${result > 0 }">
	<script type="text/javascript">
		location.href="content.do?board_num=${board_num}&article_num=${article_num}&pageNum=${pageNum}";
	</script>
</c:if>
<c:if test="${result == 0 }">
	<script type="text/javascript">
		alert("이미 추천한 댓글입니다");
		history.go(-1);
	</script>
</c:if>
</html>