<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<jsp:useBean id="recom" class="tLOL.service.article.ArticleRecom" scope="session"/>
<script type="text/javascript" src="../bootstrap/js/jquery.js"></script>
<script type="text/javascript">
	function article_delete() {
		if(confirm("정말 삭제하시겠습니까?") == true) {
			location.href='articleDelete.do?board_num=${board_num }&article_num=${article_num}&pageNum=${pageNum}';
		} else {
			return;
		}
	}
</script>
<div class="col-10 bd-content">
<div class="mt-5 mb-5">
	<font color="white" size="6">${article.board_name }</font>
</div>
	<table class="table table-hover">
		<tr class="table-dark"><th width="100">제목</th><td>${article.article_title }</td></tr>
		<tr class="table-dark"><th>작성자</th><td>${article.member_nickname }</td></tr>
		<tr class="table-dark"><th>조회수</th><td>${article.article_read }</td></tr>
		<tr class="table-dark"><th>작성일</th><td>${article.article_date }</td></tr>
		<tr class="table-dark" id="recom"><th>추천수</th><td>${article.article_recom }</td></tr>
		<tr class="table-dark"><th>내용</th><td><pre>${article.article_content }</pre></td></tr>
	</table>
	<div align="center"><br>
		<c:if test="${not empty member_num }">
			<button class="btn btn-primary" onclick="location.href='articleRecom.do?board_num=${board_num }&article_num=${article_num}&pageNum=${pageNum }'">추천</button>
		</c:if>
		<c:if test="${member_num eq article.member_num or member_admin eq 1}">
			<button class="btn btn-primary" onclick="location.href='articleUpdateForm.jsp?board_num=${board_num }&article_num=${article_num}&pageNum=${pageNum}'">수정</button> 
			<button class="btn btn-primary" onclick="article_delete()">삭제</button> 
		</c:if>
		<button class="btn btn-primary" onclick="location.href='board.do?board_num=${board_num }&pageNum=${pageNum}'">게시글 목록</button>
	</div>
	<br><br>
	<div id="disp"></div>
	<form action="commentWrite.do" method="post">
		<input type="hidden" name="member_num" value="${member_num }">
		<input type="hidden" name="board_num" value="${board_num }">
		<input type="hidden" name="article_num" value="${article_num }">
		<input type="hidden" name="pageNum" value="${pageNum }">
		<table class="table table-hover">
			<tr class="table-dark">
				<th style="width: 10%">작성자</th>
				<th style="width: 50%">내용</th>
				<th style="width: 15%" colspan="2">추천수</th>
				<th style="width: 20%">작성일</th>
				<th style="width: 5%"></th>
			</tr>
			<tr>
				<c:if test="${empty list }">
					<tr>
						<th colspan="6"><font color="white">댓글이 없습니다</font></th>
					</tr>
				</c:if>
				<c:if test="${not empty list }">
					<c:forEach var="comment" items="${list }">
						<tr>
							<c:if test="${comment.comment_del == 'y' }">
								<th colspan="6"><font color="white">삭제된 댓글 입니다</font></th>
							</c:if>
							<c:if test="${comment.comment_del != 'y' }">
								<td><font color="white">${comment.member_nickname }</font></td>
								<td><font color="white">${comment.comment_content}</font></td>
								<td><font color="white">${comment.comment_recom}</font></td>
								<td>
									<c:if test="${not empty member_num }">
										<button class="btn btn-primary" onclick="location.href='commentRecom.do?board_num=${board_num }&article_num=${article_num}&comment_num=${comment.comment_num }&pageNum=${pageNum }'">추천</button>
									</c:if>
								</td>
								<td><font color="white">${comment.comment_date}</font></td>
								<c:if test="${member_num eq comment.member_num or member_admin eq 1}">
									<td><a href="commentDelete.do?comment_num=${comment.comment_num }&article_num=${article_num }&board_num=${board_num}&pageNum=${pageNum }">삭제</a></td>
								</c:if>
								<c:if test="${member_num ne comment.member_num and member_admin ne 1}">
									<td></td>
								</c:if>
							</c:if>
						</tr>
					</c:forEach>
				</c:if>
			</tr>
			<c:if test="${empty member_id }">
				<tr>
					<th colspan="5"><font color="white">로그인 후 댓글을 작성할 수 있습니다</font></th>
				</tr>
			</c:if>
			<c:if test="${not empty member_id }">
				<tr>
					<th><font color="white">${member_nickname }</font></th>
					<th colspan="3"><textarea style="resize: none; box-sizing: border-box; width: 100%" name="comment_content" required="required"></textarea></th>
					<th><input type="submit" class="btn btn-primary" value="확인"></th>
				</tr>
			</c:if>
		</table>
	</form>
	</div>
</html>