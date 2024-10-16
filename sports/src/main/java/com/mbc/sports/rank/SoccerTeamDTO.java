package com.mbc.sports.rank;

public class SoccerTeamDTO {
	
	String rank, title, round,points,win,draw,lose,score,conceded,difference,assist,foul;
	public SoccerTeamDTO() {}
	public SoccerTeamDTO(String rank, String title, String round, String points, String win, String draw, String lose,
			String score, String conceded, String difference, String assist, String foul) {
		super();
		this.rank = rank;
		this.title = title;
		this.round = round;
		this.points = points;
		this.win = win;
		this.draw = draw;
		this.lose = lose;
		this.score = score;
		this.conceded = conceded;
		this.difference = difference;
		this.assist = assist;
		this.foul = foul;
	}
	public String getRank() {
		return rank;
	}
	public void setRank(String rank) {
		this.rank = rank;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getRound() {
		return round;
	}
	public void setRound(String round) {
		this.round = round;
	}
	public String getPoints() {
		return points;
	}
	public void setPoints(String points) {
		this.points = points;
	}
	public String getWin() {
		return win;
	}
	public void setWin(String win) {
		this.win = win;
	}
	public String getDraw() {
		return draw;
	}
	public void setDraw(String draw) {
		this.draw = draw;
	}
	public String getLose() {
		return lose;
	}
	public void setLose(String lose) {
		this.lose = lose;
	}
	public String getScore() {
		return score;
	}
	public void setScore(String score) {
		this.score = score;
	}
	public String getConceded() {
		return conceded;
	}
	public void setConceded(String conceded) {
		this.conceded = conceded;
	}
	public String getDifference() {
		return difference;
	}
	public void setDifference(String difference) {
		this.difference = difference;
	}
	public String getAssist() {
		return assist;
	}
	public void setAssist(String assist) {
		this.assist = assist;
	}
	public String getFoul() {
		return foul;
	}
	public void setFoul(String foul) {
		this.foul = foul;
	}
}
