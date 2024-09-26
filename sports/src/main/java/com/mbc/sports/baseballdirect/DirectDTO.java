package com.mbc.sports.baseballdirect;
public class DirectDTO {
	String tname, pname, pimage;

	public DirectDTO() {}

	public String getTname() {
		return tname;
	}
	public void setTname(String tname) {
		this.tname = tname;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getPimage() {
		return pimage;
	}
	public void setPimage(String pimage) {
		this.pimage = pimage;
	}

	@Override
	public String toString() {
		return "DirectDTO [tname=" + tname + ", pname=" + pname + ", pimage=" + pimage + "]";
	}
	
}