package com.mbc.sports.rank;

public class BaseballPlayerDTO {
	String rank, name, team, era, round, inning, win, lose, save, hold, out, hit, homerun, losepnt, fourball, deadball, winper;
	
	public BaseballPlayerDTO() {
		super();
	}
	public BaseballPlayerDTO(String rank, String name, String team, String era, String round, String inning, String win,
			String lose, String save, String hold, String out, String hit, String homerun, String losepnt,
			String fourball, String deadball, String winper) {
		super();
		this.rank = rank;
		this.name = name;
		this.team = team;
		this.era = era;
		this.round = round;
		this.inning = inning;
		this.win = win;
		this.lose = lose;
		this.save = save;
		this.hold = hold;
		this.out = out;
		this.hit = hit;
		this.homerun = homerun;
		this.losepnt = losepnt;
		this.fourball = fourball;
		this.deadball = deadball;
		this.winper = winper;
	}
	public String getRank() {
		return rank;
	}
	public void setRank(String rank) {
		this.rank = rank;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTeam() {
		return team;
	}
	public void setTeam(String team) {
		this.team = team;
	}
	public String getEra() {
		return era;
	}
	public void setEra(String era) {
		this.era = era;
	}
	public String getRound() {
		return round;
	}
	public void setRound(String round) {
		this.round = round;
	}
	public String getInning() {
		return inning;
	}
	public void setInning(String inning) {
		this.inning = inning;
	}
	public String getWin() {
		return win;
	}
	public void setWin(String win) {
		this.win = win;
	}
	public String getLose() {
		return lose;
	}
	public void setLose(String lose) {
		this.lose = lose;
	}
	public String getSave() {
		return save;
	}
	public void setSave(String save) {
		this.save = save;
	}
	public String getHold() {
		return hold;
	}
	public void setHold(String hold) {
		this.hold = hold;
	}
	public String getOut() {
		return out;
	}
	public void setOut(String out) {
		this.out = out;
	}
	public String getHit() {
		return hit;
	}
	public void setHit(String hit) {
		this.hit = hit;
	}
	public String getHomerun() {
		return homerun;
	}
	public void setHomerun(String homerun) {
		this.homerun = homerun;
	}
	public String getLosepnt() {
		return losepnt;
	}
	public void setLosepnt(String losepnt) {
		this.losepnt = losepnt;
	}
	public String getFourball() {
		return fourball;
	}
	public void setFourball(String fourball) {
		this.fourball = fourball;
	}
	public String getDeadball() {
		return deadball;
	}
	public void setDeadball(String deadball) {
		this.deadball = deadball;
	}
	public String getWinper() {
		return winper;
	}
	public void setWinper(String winper) {
		this.winper = winper;
	}
	@Override
	public String toString() {
		return "BaseballPlayerDTO [rank=" + rank + ", name=" + name + ", team=" + team + ", era=" + era + ", round="
				+ round + ", inning=" + inning + ", win=" + win + ", lose=" + lose + ", save=" + save + ", hold=" + hold
				+ ", out=" + out + ", hit=" + hit + ", homerun=" + homerun + ", losepnt=" + losepnt + ", fourball="
				+ fourball + ", deadball=" + deadball + ", winper=" + winper + "]";
	}
}
