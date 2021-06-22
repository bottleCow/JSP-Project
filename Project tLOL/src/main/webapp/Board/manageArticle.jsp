<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<div class="col-10 bd-content">
	<div class="mt-5 mb-5">
		<font color="white" size="6">게시글 관리</font>
	</div>
	<table class="table table-hover">
		<tr class="table-dark">
			<th style="width:10%;">게시판</th>
			<th style="width:10%;">글번호</th>
			<th style="width:40%;">글제목</th>
			<th style="width:10%;">조회수</th>
			<th style="width:10%;">추천수</th>
			<th style="width:20%;">작성일</th>
		</tr>
		<c:if test="${empty list }">
			<tr>
				<th colspan="6"><font color="white">게시글이 없습니다</font></th>
			</tr>
		</c:if>
		<c:if test="${not empty list }">
			<c:forEach var="article" items="${list }">
				<tr>
					<td><font color="white">${article.board_name }</font></td>
					<td><font color="white">${article.article_num }</font></td>
					<c:if test="${article.article_del == 'y' }">
						<th colspan="5"><font color="white">삭제된 게시글 입니다</font></th>
					</c:if>
					<c:if test="${article.article_del != 'y' }">
						<td>
							<a href="content.do?article_num=${article.article_num}&board_num=${article.board_num}&pageNum=${currentPage }">
								${article.article_title}</a>
						</td>
						<td><font color="white">${article.article_read}</font></td>
						<td><font color="white">${article.article_recom}</font></td>
						<td><font color="white">${article.article_date}</font></td>
					</c:if>
				</tr>
			</c:forEach>
		</c:if>
	</table>
	<div align="center">
		<c:if test="${startPage > PAGE_PER_BLOCK}">
			<button class="btn btn-primary" onclick="location.href='manageArticle.do?pageNum=${startPage - 1}'">이전</button>
		</c:if>
		<c:forEach var="i" begin="${startPage}" end="${endPage}">
			<button class="btn btn-primary" onclick="location.href='manageArticle.do?pageNum=${i}'">${i }</button>
		</c:forEach>
		<c:if test="${endPage < totalPage}">
			<button class="btn btn-primary" onclick="location.href='manageArticle.do?pageNum=${endPage + 1}'">다음</button>
		</c:if>
	</div>
</div>

</html>