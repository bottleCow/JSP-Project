<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<div class="col-10 bd-content">
	<table class="text-white">
		<tr>
			<th>계정명</th><td>${sInfo.accountId }</td>
		</tr>
		<tr>
			<th>소환사명</th><td>${sInfo.summonerName }</td>
		</tr>
		<tr>
			<th>소환사아이콘</th><td><img src="${sInfo.profileIconAddr }"></td>
		</tr>
		<tr>
			<th>갱신일</th><td>${sInfo.revisionDate }</td>
		</tr>
		<tr>
			<th>소환사레벨</th><td>${sInfo.summonerLevel }</td>
		</tr>
		
	</table>
	</div>
</html>