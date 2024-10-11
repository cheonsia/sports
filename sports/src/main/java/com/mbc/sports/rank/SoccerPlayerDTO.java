package com.mbc.sports.rank;

import com.mbc.sports.player.PlayerDTO;

public class SoccerPlayerDTO {
	int playernum, year, round, gain, assist, attackpoint;
	double avgscore;
	int mom, best11, shoot, possibleshoot,ranking;
	PlayerDTO playerDTO;
	public SoccerPlayerDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getPlayernum() {
		return playernum;
	}
	public void setPlayernum(int playernum) {
		this.playernum = playernum;
	}
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public int getRound() {
		return round;
	}
	public void setRound(int round) {
		this.round = round;
	}
	public int getGain() {
		return gain;
	}
	public void setGain(int gain) {
		this.gain = gain;
	}
	public int getAssist() {
		return assist;
	}
	public void setAssist(int assist) {
		this.assist = assist;
	}
	public int getAttackpoint() {
		return attackpoint;
	}
	public void setAttackpoint(int attackpoint) {
		this.attackpoint = attackpoint;
	}
	
	public double getAvgscore() {
		return avgscore;
	}
	public void setAvgscore(double avgscore) {
		this.avgscore = avgscore;
	}
	public int getMom() {
		return mom;
	}
	public void setMom(int mom) {
		this.mom = mom;
	}
	public int getBest11() {
		return best11;
	}
	public void setBest11(int best11) {
		this.best11 = best11;
	}
	public int getShoot() {
		return shoot;
	}
	public void setShoot(int shoot) {
		this.shoot = shoot;
	}
	public int getPossibleshoot() {
		return possibleshoot;
	}
	public void setPossibleshoot(int possibleshoot) {
		this.possibleshoot = possibleshoot;
	}
	public PlayerDTO getPlayerDTO() {
		return playerDTO;
	}
	public void setPlayerDTO(PlayerDTO playerDTO) {
		this.playerDTO = playerDTO;
	}
	public int getRanking() {
		return ranking;
	}
	public void setRanking(int ranking) {
		this.ranking = ranking;
	}
}
