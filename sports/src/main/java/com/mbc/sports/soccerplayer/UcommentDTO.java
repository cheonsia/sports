package com.mbc.sports.soccerplayer;

public class UcommentDTO {
	int playernum,step,indent;
	String writer,ucomment,cdate;
	int heart;

	public UcommentDTO() {}

	


	public int getHeart() {
		return heart;
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

	public int getIndent() {
		return indent;
	}

	public void setIndent(int indent) {
		this.indent = indent;
	}




	@Override
	public String toString() {
		return "UcommentDTO [playernum=" + playernum + ", step=" + step + ", indent=" + indent + ", writer=" + writer
				+ ", ucomment=" + ucomment + ", cdate=" + cdate + "]";
	}
	
}
