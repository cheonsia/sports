package com.mbc.sports.baseballdirect;
public class BaseballStrategyDTO {
	int stnum;
	String stname, stkind, stdate, starea, stinfo;

	public BaseballStrategyDTO() {}
	public BaseballStrategyDTO(int stnum, String stname, String stkind, String stdate, String starea, String stinfo) {
		super();
		this.stnum = stnum;
		this.stname = stname;
		this.stkind = stkind;
		this.stdate = stdate;
		this.starea = starea;
		this.stinfo = stinfo;
	}

	public int getStnum() {
		return stnum;
	}
	public void setStnum(int stnum) {
		this.stnum = stnum;
	}
	public String getStname() {
		return stname;
	}
	public void setStname(String stname) {
		this.stname = stname;
	}
	public String getStkind() {
		return stkind;
	}
	public void setStkind(String stkind) {
		this.stkind = stkind;
	}
	public String getStdate() {
		return stdate;
	}
	public void setStdate(String stdate) {
		this.stdate = stdate;
	}
	public String getStarea() {
		return starea;
	}
	public void setStarea(String starea) {
		this.starea = starea;
	}
	public String getStinfo() {
		return stinfo;
	}
	public void setStinfo(String stinfo) {
		this.stinfo = stinfo;
	}
	
	@Override
	public String toString() {
		return "BaseballStrategyDTO [stnum=" + stnum + ", stname=" + stname + ", stkind=" + stkind + ", stdate="
				+ stdate + ", starea=" + starea + ", stinfo=" + stinfo + "]";
	}
}