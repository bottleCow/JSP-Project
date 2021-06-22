<!-- 작성완료 버튼 누를시 writeAction.do호출 -->
<!-- WriteForm.java에서 받은 값들은  -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<script type="text/javascript" src="../bootstrap/js/jquery.js"></script>
<div class="col-sm-10 bd-content">

	<div class="mt-5 mb-5">
		<font color="white"><h2>게시글 작성</h2></font>
	</div>
	<div style="overflow:auto;">
		<iframe src="../summernote/articleWriteForm.do?board_num=${param.board_num }&pageNum=1" style="width:90%; height: 90vh">
		</iframe>
	</div>
	
</div>
</html>