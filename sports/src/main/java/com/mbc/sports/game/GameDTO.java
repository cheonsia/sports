package com.mbc.sports.game;
public class GameDTO {
	String team1,team2,gamedate,gametime,gameplace,season;
	int gamenum;
	public GameDTO() {}
	public int getGamenum() {
		return gamenum;
	}
	public void setGamenum(int gamenum) {
		this.gamenum = gamenum;
	}
	public String getTeam1() {
		return team1;
	}
	public void setTeam1(String team1) {
		this.team1 = team1;
	}
	public String getTeam2() {
		return team2;
	}
	public void setTeam2(String team2) {
		this.team2 = team2;
	}
	public String getGamedate() {
		return gamedate;
	}
	public void setGamedate(String gamedate) {
		this.gamedate = gamedate;
	}
	public String getGametime() {
		return gametime;
	}
	public void setGametime(String gametime) {
		this.gametime = gametime;
	}
	public String getGameplace() {
		return gameplace;
	}
	public void setGameplace(String gameplace) {
		this.gameplace = gameplace;
	}
	public String getSeason() {
		return season;
	}
	public void setSeason(String season) {
		this.season = season;
	}
	@Override
	public String toString() {
		return "GameDTO [team1=" + team1 + ", team2=" + team2 + ", gamedate=" + gamedate + ", gametime=" + gametime
				+ ", gameplace=" + gameplace + ", season=" + season + ", gamenum=" + gamenum + "]";
	}
}