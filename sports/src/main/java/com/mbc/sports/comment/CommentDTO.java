package com.mbc.sports.comment;

public class CommentDTO {
	int playernum,step;
	String id,writer,sport,team,part,ucomment,cdate;
	int heart;
	public CommentDTO() {}
	public int getHeart() {
		return heart;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public void setHeart(int heart) {
		this.heart = heart;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getSport() {
		return sport;
	}
	public void setSport(String sport) {
		this.sport = sport;
	}
	public String getTeam() {
		return team;
	}
	public void setTeam(String team) {
		this.team = team;
	}
	public String getPart() {
		return part;
	}
	public void setPart(String part) {
		this.part = part;
	}
	public String getUcomment() {
		return ucomment;
	}
	public void setUcomment(String ucomment) {
		this.ucomment = ucomment;
	}
	public String getCdate() {
		return cdate;
	}
	public void setCdate(String cdate) {
		this.cdate = cdate;
	}
	public int getPlayernum() {
		return playernum;
	}
	public void setPlayernum(int playernum) {
		this.playernum = playernum;
	}
	public int getStep() {
		return step;
	}
	public void setStep(int step) {
		this.step = step;
	}
}
