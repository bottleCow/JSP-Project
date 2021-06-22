<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<!-- include libraries(jQuery, bootstrap) -->
<link href="http://bootswatch.com/3/darkly/bootstrap.css" rel="stylesheet">
<script type="text/javascript" src="../bootstrap/js/jquery.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script type="text/javascript">
	var article_content = parent.article_content;
	$(function() {
		$('#summernote').summernote({
			  height: 450,   //set editable area's height
			});
		$("#summernote").summernote('code',  '${article.article_content}');
	});
	function checkForm() {
		if($('#summernote').summernote('isEmpty')) {
		    preventDefault();
		  }
		else {
			document.iframe_form.target = "_parent";
			document.iframe_form.action = "../Board/articleUpdate.do"
			document.iframe_form.submit();
		}
	}
</script>

<form method="post" onsubmit="checkForm()" name="iframe_form">

	<input type="hidden" name="board_num" value="${article.board_num }">
	<input type="hidden" name="member_num" value="${article.member_num }">
	<input type="hidden" name="article_num"  value="${article.article_num }">
	<input type="hidden" name="pageNum" value="${pageNum }">
	<table class="table table-hover">
		<tr class="table-dark">
			<th><font color="white">제목</font></th>
			<td><input type="text" name="article_title" required="required"
				autofocus="autofocus" size="50" value="${article.article_title }"></td>
		</tr>
	</table>
	<textarea id="summernote" name="article_content" id="article_content" required="required"></textarea>
	<input type="submit" class="col-4 btn btn-primary" value="확인">

</form>
</html>