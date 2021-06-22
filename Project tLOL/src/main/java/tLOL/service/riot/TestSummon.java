package tLOL.service.riot;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Set;
import java.util.logging.Level;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.rithms.riot.api.ApiConfig;
import net.rithms.riot.api.RiotApi;
import net.rithms.riot.api.RiotApiAsync;
import net.rithms.riot.api.RiotApiException;
import net.rithms.riot.api.endpoints.league.constant.LeagueQueue;
import net.rithms.riot.api.endpoints.league.dto.LeagueEntry;
import net.rithms.riot.api.endpoints.match.dto.Match;
import net.rithms.riot.api.endpoints.match.dto.MatchList;
import net.rithms.riot.api.endpoints.match.dto.MatchReference;
import net.rithms.riot.api.endpoints.match.dto.Participant;
import net.rithms.riot.api.endpoints.match.dto.ParticipantIdentity;
import net.rithms.riot.api.endpoints.match.dto.ParticipantStats;
import net.rithms.riot.api.endpoints.summoner.dto.Summoner;
import net.rithms.riot.api.request.AsyncRequest;
import net.rithms.riot.api.request.RequestAdapter;
import net.rithms.riot.constant.Platform;
import tLOL.service.CommandProcess;

public class TestSummon implements CommandProcess {
	class ExtendedSummoner {
		public Summoner summoner;
		public LeagueEntry leagueSolo;
		public LeagueEntry leagueFlexSR;
		public LeagueEntry leagueFlexTT;
	}
	
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws RiotApiException {
		// TODO Auto-generated method stub
		String summonerNick = request.getParameter("summonerNick");
		SummonerInfo sInfo = new SummonerInfo();
		
		ApiConfig config = new ApiConfig().setKey("RGAPI-972a7043-6423-4bb3-94c1-de98fe50b7ef");
		RiotApi api = new RiotApi(config);
		RiotApiAsync apiAsync = api.getAsyncApi();

		Summoner summoner = api.getSummonerByName(Platform.KR, summonerNick);
		if(summoner == null) {
			System.out.println("그런 소환사는 없습니다");
			return "searchResult";
		}
		// TODO need to rewrite this example to properly work with v4 endpoints
		String summonerId = summoner.getId(); // Encrypted summonerId to request
		Platform platform = Platform.KR; // platform to request
		final ExtendedSummoner eSummoner = new ExtendedSummoner(); // Object where we want to store the data

		// Asynchronously get summoner information
		AsyncRequest requestSummoner = apiAsync.getSummoner(platform, summonerId);
		requestSummoner.addListeners(new RequestAdapter() {
			@Override
			public void onRequestSucceeded(AsyncRequest request) {
				eSummoner.summoner = request.getDto();
			}
		});

		// Asynchronously get league information
		AsyncRequest requestLeague = apiAsync.getLeagueEntriesBySummonerId(platform, summonerId);
		requestLeague.addListeners(new RequestAdapter() {
			@Override
			public void onRequestSucceeded(AsyncRequest request) {
				Set<LeagueEntry> leagueEntries = request.getDto();
				if (leagueEntries == null || leagueEntries.isEmpty()) {
					return;
				}
				for (LeagueEntry leagueEntry : leagueEntries) {
					if (leagueEntry.getQueueType().equals(LeagueQueue.RANKED_SOLO_5x5.name())) {
						eSummoner.leagueSolo = leagueEntry;
					} else if (leagueEntry.getQueueType().equals(LeagueQueue.RANKED_FLEX_SR.name())) {
						eSummoner.leagueFlexSR = leagueEntry;
					} else if (leagueEntry.getQueueType().equals(LeagueQueue.RANKED_FLEX_TT.name())) {
						eSummoner.leagueFlexTT = leagueEntry;
					}
				}
			}
		});

		try {
			// Wait for all asynchronous requests to finish
			apiAsync.awaitAll();
		} catch (InterruptedException e) {
			// We can use the Api's logger
			RiotApi.log.log(Level.SEVERE, "Waiting Interrupted", e);
		}

		// Print information stored in eSummoner
		sInfo.setSummonerName(eSummoner.summoner.getName()); // 소환사명 기록
		sInfo.setProfileIconAddr("http://ddragon.leagueoflegends.com/cdn/10.11.1/img/profileicon/" + eSummoner.summoner.getProfileIconId() +".png");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); // ^ 프로필 아이콘 주소
		sInfo.setRevisionDate(sdf.format(eSummoner.summoner.getRevisionDate())); // 최근 활동일
		sInfo.setSumonerLevel(eSummoner.summoner.getSummonerLevel()); // 소환사 레벨

		if (eSummoner.leagueSolo == null) {
			sInfo.setRank("unranked"); // 언랭
		} else {
			sInfo.setRank(eSummoner.leagueSolo.getRank()); // 랭크
			sInfo.setTier(eSummoner.leagueSolo.getTier()); // 티어
			sInfo.setWins(eSummoner.leagueSolo.getWins()); // 승리수
			sInfo.setLosses(eSummoner.leagueSolo.getLosses()); // 패배수
			sInfo.setLeaguePoints(eSummoner.leagueSolo.getLeaguePoints()); // 랭크점수
			sInfo.setTierImageAddr("/Project_tLOL/images/tiers/" + eSummoner.leagueSolo.getTier() + ".png"); // 티어 아이콘
			
			String accountId = eSummoner.summoner.getAccountId();
			// 최근 10개의 경기
			MatchList matchList = api.getMatchListByAccountId(platform, accountId, null, null, null, -1,-1,0,10);
			int kill = 0, death = 0, assist = 0;
			// 최근 10개의 경기 불러오기
			List<MatchReference> gameList = matchList.getMatches();
			sInfo.setGames(gameList.size()); // 게임수
			for(MatchReference game : gameList) {
				MatchInfo mi = new MatchInfo();
				Long gameId = game.getGameId();
				 // gameId 기반으로 게임정보 검색
				Match match = api.getMatch(platform, gameId, accountId); // match : 게임 정보
				Participant part = match.getParticipantBySummonerId(summonerId); // part : 게임 중 내 정보
				ParticipantStats ps = part.getStats(); // ps : 게임 중 내 세부정보
				// System.out.println(match.toString(true));
				// System.out.println(part.toString(true));
				// 위와 같은 방식으로, 어떤 데이터가 넘어오는지 콘솔로 확인 가능
				
				mi.setWinLose(ps.isWin()); // 승리 여부
				mi.setChampion(part.getChampionId()); // 챔피온
				AllChampionList acl = new AllChampionList();
				mi.setChampionAddr("http://ddragon.leagueoflegends.com/cdn/11.12.1/img/champion/" + acl.champions.get(mi.getChampion()) + ".png");
				mi.setSpell_1Addr("https://ddragon.leagueoflegends.com/cdn/11.12.1/img/spell/" + acl.spells.get(part.getSpell1Id()) + ".png");
				mi.setSpell_2Addr("https://ddragon.leagueoflegends.com/cdn/11.12.1/img/spell/" + acl.spells.get(part.getSpell2Id()) + ".png");
				mi.setTeamId(part.getTeamId());
				
				mi.setKill(ps.getKills());
				mi.setDeath(ps.getDeaths());
				mi.setAssist(ps.getAssists());
				Date date = new Date(game.getTimestamp()); 
			    sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
			    mi.setDate(sdf.format(date));
				
			    mi.setChampLevel(ps.getChampLevel());
				mi.setTotalMinion(ps.getTotalMinionsKilled());
				mi.setGameDuration(match.getGameDuration());
				

				int totalKill = 0;
				List<ParticipantIdentity> players= match.getParticipantIdentities();
				List<Participant> champions = match.getParticipants();
				for(int i =0;i<10;i++) {
					totalKill += champions.get(i).getStats().getKills();
					mi.player.add(players.get(i).getPlayer().getSummonerName());
					mi.playerChampion.add(champions.get(i).getChampionId());
					mi.playerChampionAddr.add("http://ddragon.leagueoflegends.com/cdn/11.12.1/img/champion/" + acl.champions.get(champions.get(i).getChampionId()) + ".png");
				}
				mi.setTotalKill(totalKill);
				sInfo.matchInfo.add(mi);
				kill += ps.getKills();
				death += ps.getDeaths();
				assist += ps.getAssists();
			}
			sInfo.setKda(((float)kill + assist) / death);
			sInfo.setKills(kill / sInfo.getGames());
			
		}

		/*System.out.print("Flex SR Rank: ");
		if (eSummoner.leagueFlexSR == null) {
			System.out.println("unranked");
		} else {
			System.out.println(eSummoner.leagueFlexSR.getTier() + " " + eSummoner.leagueFlexSR.getRank());
		}

		System.out.print("Flex TT Rank: ");
		if (eSummoner.leagueFlexTT == null) {
			System.out.println("unranked");
		} else {
			System.out.println(eSummoner.leagueFlexTT.getTier() + " " + eSummoner.leagueFlexTT.getRank());
		}*/
		
		
		
		request.setAttribute("sInfo", sInfo);
		return "searchResult";
	}

}
