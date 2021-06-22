<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<div class="wrap">
	<section class="result-container">
	    <div class="profile">
	       <ul class="clearfix">
	           <li>
	               <img src="${sInfo.profileIconAddr}" alt="플레이어 아이콘" onerror="this.src='../images/spell/ignite.png'" />
	           </li>
	           <li>
	               <p class="user-nm">${sInfo.summonerName}</p>
	               <p class="update-btn">
	                   <button onclick="location.reload()">UPDATE</button>
	               </p>
	               <p class="system-date">${sInfo.revisionDate}</p>
	           </li>           
	           <li>
	                <img src="${sInfo.tierImageAddr}" class="rank-img" alt="티어 아이콘" onerror="this.src='../images/spell/ignite.png'" />
	                <p class="rank-info">
	                    <span>솔로랭크</span>
	                    <span class="rank-nm">${sInfo.tier} ${sInfo.rank}</span>
	                    <span><fmt:formatNumber value="${sInfo.wins / (sInfo.losses+sInfo.wins)*100}" pattern=".00"/>%</span> 
	                    <span class="rank-total"> 
	                        <span>${sInfo.wins}승</span>
	                        <span>${sInfo.losses}패</span>       
	                    </span>
	                    <span>${sInfo.leaguePoints}점</span>
	                </p>
	           </li>
	       </ul>
	    </div>
	    <ul class="clearfix">
	    <c:forEach var="match" items="${sInfo.matchInfo }">
	        <li class="record-box">
	            <ul class="text">
	                <li>솔랭</li>
	                <li>${match.date }</li>
	                <c:if test="${match.winLose eq true }">
	                	<li class="win">승리</li> <!-- 승리 : win / 패배 : lose -->  
	                </c:if>  
	                 <c:if test="${match.winLose eq false }">
	                	<li class="lose">패배</li> <!-- 승리 : win / 패배 : lose -->  
	                </c:if> 
	                <li>게임시간</li>   
	                <li><fmt:formatNumber value="${match.gameDuration/60 }" pattern="00"/>분 ${match.gameDuration%60 }초</li>
	            </ul>
	            <ul class="clearfix add-magic">
	                <li style="margin: 10%;">
	                	
	                    <img src="${match.spell_1Addr }" alt="스펠 이미지" />
	                    <img src="${match.spell_2Addr }" alt="스펠 이미지" />
<%-- 	                    <img src="${match.rune_1Addr }" alt="룬 이미지" /> --%>
<%-- 	                    <img src="${match.rune_2Addr }" alt="룬 이미지" /> --%>
	                </li>
	            </ul>
	            <span class="champion">
	                <img src="${match.championAddr }" alt="챔피언 초상화" />
	                <span>Lv. ${match.champLevel }</span>
	            </span>
	            <ul class="clearfix kda">
	                <li>
	                    <span>${match.kill }/${match.death }/${match.assist }</span>
	                    <span>KDA</span>
	                </li>
	                <li>
	                    <span>${match.totalMinion }</span>
	                    <span>CS</span>
	                </li>
	                <li>
	                    <span><fmt:formatNumber value="${(match.kill + match.assist) / match.totalKill}" pattern="00%"/></span>
	                    <span>KP</span>
	                </li>
	            </ul>
	            
	            <ul class="team blue">
	            <c:forEach var="i" begin="5" end="9">
	                <li>
	                    <img src="${match.playerChampionAddr[i] }" alt="챔피언 초상화" />
	                    <a id="blue-team" href="/Project_tLOL/Board/testSummon.do?summonerNick=${match.player[i] }">${match.player[i] }</a>
	                </li>
	             </c:forEach> 
	            </ul>
	            <ul class="team red">
	            <c:forEach var="i" begin="0" end="4">
	                <li>
	                    <img src="${match.playerChampionAddr[i] }" alt="챔피언 초상화" />
	                    <a id="red-team" href="/Project_tLOL/Board/testSummon.do?summonerNick=${match.player[i] }">${match.player[i] }</a>
	                </li>
	            </c:forEach>
	            </ul>
	        </li>
	    </c:forEach>
	    </ul>
	</section>
</div>
</html>