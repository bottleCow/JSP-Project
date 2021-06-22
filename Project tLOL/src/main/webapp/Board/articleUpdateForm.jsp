<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<script type="text/javascript" src="../bootstrap/js/jquery.js"></script>
<script type="text/javascript">
	var pageNum = ${pageNum};
	var article = ${article};
</script>
<div class="col-sm-10 bd-content">
	<div class="mt-5 mb-5">
		<font color="white"><h2>게시글 수정</h2></font>
	</div>
	<div style="overflow:auto;">
		<iframe src="../summernote/articleUpdateForm.do?board_num=${param.board_num }&article_num=${param.article_num}&pageNum=${param.pageNum}" style="width:90%; height: 90vh">
		</iframe>
	</div>

</div>
</html>