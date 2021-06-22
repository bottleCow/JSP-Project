<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<script type="text/javascript" src="../bootstrap/js/jquery.js"></script>	
<script type="text/javascript">
	function del() {
		var con = confirm("정말로 탈퇴 처리 하시겠습니까?");
		if (con) {
			document.select_member.action = "memberOut.do"
			document.select_member.submit();
		}
		else {
			alert("회원 탈퇴 처리가 취소되었습니다");
			return;
		}
	}
	function res() {
		var con = confirm("정말로 복구 처리 하시겠습니까?");
		if (con) {
			document.select_member.action = "memberRes.do"
			document.select_member.submit();
		}
		else {
			alert("회원 복구 처리가 취소되었습니다");
			return;
		}
	}
</script>
<div class="col-10 bd-content">
<div class="mt-5 mb-5">
	<font color="white" size="6">회원관리</font>
</div>
	<form method="post" name="select_member">
		<table class="table table-hover">
			<thead class="table-primary">
			<tr class="table-dark">
				<th style="width: 5%">선택</th>
				<th style="width: 12%">회원번호</th>
				<th style="width: 13%">회원ID</th>
				<th style="width: 10%">닉네임</th>
				<th style="width: 20%">가입일</th>
				<th style="width: 25%">이메일</th>
				<th style="width: 10%">ID상태</th>
			</tr>
			</thead>
			<tbody class="table-light">
			<c:forEach var="member" items="${memberList}">
				<tr class="table-dark">
					<td><c:if test="${member.member_admin eq 0}">
						<input type="checkbox" name="chk_member_id" value="${member.member_id }"></c:if></td>
					<td>${member.member_num }</td>
					<td>${member.member_id }</td>
					<td>${member.member_nickname }</td>
					<td>${member.member_reg_date }</td>
					<td>${member.member_email }</td>
					<td><c:choose>
						<c:when test="${member.member_del eq 'y'}">탈퇴</c:when>
						<c:when test="${member.member_del eq 'n'}">가입</c:when></c:choose></td>
				<tr>	
			</c:forEach>
			</tbody>
		</table>
		<div align="center">
			<nav aria-label="Page navigation example">
			  <ul class="pagination justify-content-center">
			  <c:if test="${startPage > PAGE_PER_BLOCK}">
			    <li class="page-item">
			      <a class="page-link" href="memberManage.do?&pageNum=${startPage - 1}" aria-label="Previous">
			        <span aria-hidden="true">&laquo;</span>
			      </a>
			    </li>
			    </c:if>
				    <c:forEach var="i" begin="${startPage}" end="${endPage}">
				    	<c:choose>
				    		<c:when test="${currentPage eq i }">
					    		<li class="page-item active" aria-current="page"><a class="page-link" href="memberManage.do?&pageNum=${i}">${i}</a></li>
					    	</c:when>
					    	<c:otherwise>
					    		<li class="page-item"><a class="page-link" href="memberManage.do?&pageNum=${i}">${i}</a></li>
					    	</c:otherwise>
					    </c:choose>
					</c:forEach>
					<c:if test="${endPage < totalPage}">
			    <li class="page-item">
			      <a class="page-link" href="memberManage.do?&pageNum=${endPage + 1}" aria-label="Next">
			        <span aria-hidden="true">&raquo;</span>
			      </a>
			    </li>
			    </c:if>
			  </ul>
			</nav>
		</div>
	    <button class="mt-2 btn btn-danger btn-sm" onclick="del()">회원삭제</button>
		<button class="mt-2 btn btn-primary btn-sm" onclick="res()">회원복구</button>
	</form>
</div>
</html>