package tLOL.service.riot;

import java.util.ArrayList;
import java.util.List;

public class SummonerInfo {
	private String summonerName;
	private String profileIconAddr;

	private String revisionDate;
	private int sumonerLevel;
	private String tierImageAddr;
	private String tier;
	private String rank;
	private int leaguePoints;
	private int wins;
	private int losses;
	private int games;
	
	private int pWins;
	private int pLosses;
	private String progress;
	
	private int kills;
	private int deathes;
	private int assists;
	private float kda;
	
	public List<MatchInfo> matchInfo;
	
	public List<MatchInfo> getMatchInfo() {
		return matchInfo;
	}
	public void setMatchInfo(List<MatchInfo> matchInfo) {
		this.matchInfo = matchInfo;
	}
	public SummonerInfo() {
		matchInfo = new ArrayList<MatchInfo>();
	}
	public String getSummonerName() {
		return summonerName;
	}
	public void setSummonerName(String summonerName) {
		this.summonerName = summonerName;
	}
	public String getProfileIconAddr() {
		return profileIconAddr;
	}
	public void setProfileIconAddr(String profileIconAddr) {
		this.profileIconAddr = profileIconAddr;
	}
	public String getRevisionDate() {
		return revisionDate;
	}
	public void setRevisionDate(String revisionDate) {
		this.revisionDate = revisionDate;
	}
	public int getSumonerLevel() {
		return sumonerLevel;
	}
	public void setSumonerLevel(int sumonerLevel) {
		this.sumonerLevel = sumonerLevel;
	}

	public String getTierImageAddr() {
		return tierImageAddr;
	}
	public void setTierImageAddr(String tierImageAddr) {
		this.tierImageAddr = tierImageAddr;
	}
	public String getTier() {
		return tier;
	}
	public void setTier(String tier) {
		this.tier = tier;
	}
	public String getRank() {
		return rank;
	}
	public void setRank(String rank) {
		this.rank = rank;
	}
	public int getLeaguePoints() {
		return leaguePoints;
	}
	public void setLeaguePoints(int leaguePoints) {
		this.leaguePoints = leaguePoints;
	}
	public int getWins() {
		return wins;
	}
	public void setWins(int wins) {
		this.wins = wins;
	}
	public int getLosses() {
		return losses;
	}
	public void setLosses(int losses) {
		this.losses = losses;
	}
	
	public int getGames() {
		return games;
	}
	public void setGames(int games) {
		this.games = games;
	}
	public int getpWins() {
		return pWins;
	}
	public void setpWins(int pWins) {
		this.pWins = pWins;
	}
	public int getpLosses() {
		return pLosses;
	}
	public void setpLosses(int pLosses) {
		this.pLosses = pLosses;
	}
	public String getProgress() {
		return progress;
	}
	public void setProgress(String progress) {
		this.progress = progress;
	}
	public int getKills() {
		return kills;
	}
	public void setKills(int kills) {
		this.kills = kills;
	}
	public int getDeathes() {
		return deathes;
	}
	public void setDeathes(int deathes) {
		this.deathes = deathes;
	}
	public int getAssists() {
		return assists;
	}
	public void setAssists(int assists) {
		this.assists = assists;
	}
	public float getKda() {
		return kda;
	}
	public void setKda(float kda) {
		this.kda = kda;
	}
}
