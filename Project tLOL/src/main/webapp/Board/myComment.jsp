<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<div class="col-10 bd-content">
	<div class="mt-5 mb-5">
		<font color="white" size="6">내가 쓴 댓글</font>
	</div>
	<table class="table table-hover">
		<tr class="table-dark">
			<th style="width:10%;">게시판</th>
			<th style="width:10%;">글번호</th>
			<th style="width:20%;">글제목</th>
			<th style="width:40%;">댓글내용</th>
			<th style="width:20%;">작성일</th>
		</tr>
		<c:if test="${empty list }">
			<tr>
				<th colspan="5"><font color="white">게시글이 없습니다</font></th>
			</tr>
		</c:if>
		<c:if test="${not empty list }">
			<c:forEach var="comment" items="${list }">
				<tr>
					<td><font color="white">${comment.board_name }</font></td>
					<td><font color="white">${comment.article_num }</font></td>
					<c:if test="${comment.comment_del == 'y' }">
						<th colspan="3"><font color="white">삭제된 댓글 입니다</font></th>
					</c:if>
					<c:if test="${comment.comment_del != 'y' }">
						<td>
							<a href="content.do?article_num=${comment.article_num}&board_num=${comment.board_num}">
								${comment.article_title}
							</a>
						</td>
						<td><font color="white">${comment.comment_content}</font></td>
						<td><font color="white">${comment.comment_date}</font></td>
					</c:if>
				</tr>
			</c:forEach>
		</c:if>
	</table>
	<div align="center">
		<c:if test="${startPage > PAGE_PER_BLOCK}">
			<button class="btn btn-primary" onclick="location.href='myComment.do?member_num=${member_num }&pageNum=${startPage - 1}'">이전</button>
		</c:if>
		<c:forEach var="i" begin="${startPage}" end="${endPage}">
			<button class="btn btn-primary" onclick="location.href='myComment.do?member_num=${member_num }&pageNum=${i}'">${i }</button>
		</c:forEach>
		<c:if test="${endPage < totalPage}">
			<button class="btn btn-primary" onclick="location.href='myComment.do?member_num=${member_num }&pageNum=${endPage + 1}'">다음</button>
		</c:if>
	</div>
</div>
</html>