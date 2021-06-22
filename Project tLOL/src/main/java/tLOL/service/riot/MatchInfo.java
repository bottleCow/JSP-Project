package tLOL.service.riot;

import java.util.ArrayList;
import java.util.List;

public class MatchInfo {
	private boolean winLose;
	private int champion;
	private String championAddr;
	private String spell_1Addr;
	private String spell_2Addr;
	private int rune_1Addr;
	private int rune_2Addr;
	private int champLevel;
	private int totalMinion;
	private long gameDuration;
	private int totalKill;
	
	public int getTotalKill() {
		return totalKill;
	}
	public void setTotalKill(int totalKill) {
		this.totalKill = totalKill;
	}
	public int getChampLevel() {
		return champLevel;
	}
	public void setChampLevel(int champLevel) {
		this.champLevel = champLevel;
	}
	public int getTotalMinion() {
		return totalMinion;
	}
	public void setTotalMinion(int totalMinion) {
		this.totalMinion = totalMinion;
	}
	public long getGameDuration() {
		return gameDuration;
	}
	public void setGameDuration(long gameDuration) {
		this.gameDuration = gameDuration;
	}
	public int getRune_1Addr() {
		return rune_1Addr;
	}
	public void setRune_1Addr(int rune_1Addr) {
		this.rune_1Addr = rune_1Addr;
	}
	public int getRune_2Addr() {
		return rune_2Addr;
	}
	public void setRune_2Addr(int rune_2Addr) {
		this.rune_2Addr = rune_2Addr;
	}
	private int kill;
	private int death;
	private int assist;
	
	private int team1Kill;
	private int team2Kill;
	private int teamId;
	private String date;
	
	public List<String> player;
	public List<Integer> playerChampion;
	public List<String> playerChampionAddr;
	public MatchInfo() {
		player = new ArrayList<String>();
		playerChampion = new ArrayList<Integer>();
		playerChampionAddr = new ArrayList<String>();
	}
	public boolean isWinLose() {
		return winLose;
	}
	public void setWinLose(boolean winLose) {
		this.winLose = winLose;
	}
	public int getChampion() {
		return champion;
	}
	public void setChampion(int champion) {
		this.champion = champion;
	}
	public String getChampionAddr() {
		return championAddr;
	}
	public void setChampionAddr(String championAddr) {
		this.championAddr = championAddr;
	}
	public String getSpell_1Addr() {
		return spell_1Addr;
	}
	public void setSpell_1Addr(String spell_1Addr) {
		this.spell_1Addr = spell_1Addr;
	}
	public String getSpell_2Addr() {
		return spell_2Addr;
	}
	public void setSpell_2Addr(String spell_2Addr) {
		this.spell_2Addr = spell_2Addr;
	}
	public int getTeam1Kill() {
		return team1Kill;
	}
	public void setTeam1Kill(int team1Kill) {
		this.team1Kill = team1Kill;
	}
	public int getTeam2Kill() {
		return team2Kill;
	}
	public void setTeam2Kill(int team2Kill) {
		this.team2Kill = team2Kill;
	}
	public int getTeamId() {
		return teamId;
	}
	public void setTeamId(int teamId) {
		this.teamId = teamId;
	}
	public List<String> getPlayer() {
		return player;
	}
	public void setPlayer(List<String> player) {
		this.player = player;
	}
	public List<Integer> getPlayerChampion() {
		return playerChampion;
	}
	
	public List<String> getPlayerChampionAddr() {
		return playerChampionAddr;
	}
	public void setPlayerChampionAddr(List<String> playerChampionAddr) {
		this.playerChampionAddr = playerChampionAddr;
	}
	public void setPlayerChampion(List<Integer> playerChampion) {
		this.playerChampion = playerChampion;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public int getKill() {
		return kill;
	}
	public void setKill(int kill) {
		this.kill = kill;
	}
	public int getDeath() {
		return death;
	}
	public void setDeath(int death) {
		this.death = death;
	}
	public int getAssist() {
		return assist;
	}
	public void setAssist(int assist) {
		this.assist = assist;
	}
	
}
