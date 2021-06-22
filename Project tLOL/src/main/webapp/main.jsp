<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
	<c:if test="${hotList == null }">
		<script type="text/javascript">
			location.href = "main.do";
		</script>
	</c:if>
	<script>
		var date1 = new Date(sessionStorage.getItem("hotList.article_date"));
		var date2 = new Date();
		
		var elapsedMsec = date2.getTime() - date1.getTime();
		var elapsedHour = elapsedMsec / 1000 / 60 / 60;
		sessionStorage.setItem("elapsedHour", elapsedHour);
	</script>
	<div class="row col-8 mt-5 mb-2">
		<a href="/Project_tLOL/main.jsp"><img src="images/logo-remove.png" class="rounded mx-auto d-block" alt="" style="width:100%; height:100%; max-width: 460px; max-height: 200px;"></a>
	</div>
	<div class="row d-flex justify-content-center">
		<div class="col-6">
			 <form class="input-group" action="/Project_tLOL/Board/testSummon.do">
				      <input type="search" class="form-control form-control-dark" placeholder="Search..." name="summonerNick" aria-label="Search">
				      <button class="btn btn-outline-secondary" type="submit" id="button-addon2"><i class="fa fa-search"></i></button>
			</form>	
    	</div>
    </div>
    <div style="height:250px"></div>

    <div id="hotTopic" class="col-12 row d-flex justify-content-center">
	    <div id="community-best" class="col-7 bg-white">
	    	 <div class="community-best__title" style="height:50px">
	    	 	<a id="community-best_title">TLoL.GG 인기글</a>
	    	 </div>
	    	 <div id="community-best_content_left" style="width:50%; float:left;">
	    	 	<ul class="list-group">
	    	 		<c:forEach var="hot" items="${hotList}" begin="0" end="4" step="1" varStatus="status">
	    	 		<li class="list-group-item">
	    	 		<a href="/Project_tLOL/Board/content.do?article_num=${hot.article_num }&board_num=${hot.board_num }">
	    	 			<div class="community-article__list__item__rank">${status.index + 1 }</div>
	    	 			<div class="community-article__list__item__thumbnail">${hot.article_content }</div>
	    	 			<div class="community-article__list__item__title"><span>${hot.article_title }</span><em>&#91;${hot.comment_count }&#93;</em></div>
	    	 			<div class="community-article__list__item__sub">
	    	 				<div class="community-article__list__item__sub__item"><span>${hot.article_date }</span></div>
	    	 				<div class="community-article__list__item__sub__item">${hot.member_nickname }</div>
	    	 			</div>
	    	 		</a></li>
	    	 		</c:forEach>
	    	 	</ul>
	    	 </div>
	    	 <div id="community-best_content_right" style="width:50%; float:right;">
	    	 	<ul class="list-group">
	    	 		<c:forEach var="hot" items="${hotList}" begin="5" end="9" step="1" varStatus="status">
	    	 		<li class="list-group-item">
	    	 		<a href="/Project_tLOL/Board/content.do?article_num=${hot.article_num }&board_num=${hot.board_num }">
	    	 			<div class="community-article__list__item__rank">${status.index + 1 }</div>
	    	 			<div class="community-article__list__item__thumbnail">${hot.article_content }</div>
	    	 			<div class="community-article__list__item__title"><span>${hot.article_title }</span><em>&#91;${hot.comment_count }&#93;</em></div>
	    	 			<div class="community-article__list__item__sub">
	    	 				<div class="community-article__list__item__sub__item"><span>${hot.article_date }</span></div>
	    	 				<div class="community-article__list__item__sub__item">${hot.member_nickname }</div>
	    	 			</div>
	    	 		</a></li>
	    	 		</c:forEach>
	    	 	</ul>
	    	 </div>
    	 </div>
   	 </div>
  <!-- content end -->
</html>
