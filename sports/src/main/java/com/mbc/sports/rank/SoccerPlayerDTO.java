package com.mbc.sports.rank;

public class SoccerPlayerDTO {
	String rank,playerName,teamName,score,assist,attackPoint,conceded,conner,
	foul,shooting,offside,warning,exit,scoreless,businessTrip,change,record;
	public SoccerPlayerDTO() {}
	public SoccerPlayerDTO(String rank, String playerName, String teamName, String score, String assist,
			String attackPoint, String conceded, String conner, String foul, String shooting, String offside,
			String warning, String exit, String scoreless, String businessTrip, String change, String record) {
		super();
		this.rank = rank;
		this.playerName = playerName;
		this.teamName = teamName;
		this.score = score;
		this.assist = assist;
		this.attackPoint = attackPoint;
		this.conceded = conceded;
		this.conner = conner;
		this.foul = foul;
		this.shooting = shooting;
		this.offside = offside;
		this.warning = warning;
		this.exit = exit;
		this.scoreless = scoreless;
		this.businessTrip = businessTrip;
		this.change = change;
		this.record = record;
	}
	public String getRank() {
		return rank;
	}
	public void setRank(String rank) {
		this.rank = rank;
	}
	public String getPlayerName() {
		return playerName;
	}
	public void setPlayerName(String playerName) {
		this.playerName = playerName;
	}
	public String getTeamName() {
		return teamName;
	}
	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}
	public String getScore() {
		return score;
	}
	public void setScore(String score) {
		this.score = score;
	}
	public String getAssist() {
		return assist;
	}
	public void setAssist(String assist) {
		this.assist = assist;
	}
	public String getAttackPoint() {
		return attackPoint;
	}
	public void setAttackPoint(String attackPoint) {
		this.attackPoint = attackPoint;
	}
	public String getConceded() {
		return conceded;
	}
	public void setConceded(String conceded) {
		this.conceded = conceded;
	}
	public String getConner() {
		return conner;
	}
	public void setConner(String conner) {
		this.conner = conner;
	}
	public String getFoul() {
		return foul;
	}
	public void setFoul(String foul) {
		this.foul = foul;
	}
	public String getShooting() {
		return shooting;
	}
	public void setShooting(String shooting) {
		this.shooting = shooting;
	}
	public String getOffside() {
		return offside;
	}
	public void setOffside(String offside) {
		this.offside = offside;
	}
	public String getWarning() {
		return warning;
	}
	public void setWarning(String warning) {
		this.warning = warning;
	}
	public String getExit() {
		return exit;
	}
	public void setExit(String exit) {
		this.exit = exit;
	}
	public String getScoreless() {
		return scoreless;
	}
	public void setScoreless(String scoreless) {
		this.scoreless = scoreless;
	}
	public String getBusinessTrip() {
		return businessTrip;
	}
	public void setBusinessTrip(String businessTrip) {
		this.businessTrip = businessTrip;
	}
	public String getChange() {
		return change;
	}
	public void setChange(String change) {
		this.change = change;
	}
	public String getRecord() {
		return record;
	}
	public void setRecord(String record) {
		this.record = record;
	}
	
}
