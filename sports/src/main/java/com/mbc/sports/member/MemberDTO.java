package com.mbc.sports.member;

public class MemberDTO {
	String id,pw,name,birth,tel,email, zzip_code, user_add1,user_add2,sport,team,voe,rr,part, inputaccess;
	String ADMIN_ID, ADMIN_PW;
	
	public MemberDTO() {
		super();
		// TODO Auto-generated constructor stub
	}	
	public MemberDTO(String aDMIN_ID, String aDMIN_PW) {
		super();
		ADMIN_ID = aDMIN_ID;
		ADMIN_PW = aDMIN_PW;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getZzip_code() {
		return zzip_code;
	}
	public void setZzip_code(String zzip_code) {
		this.zzip_code = zzip_code;
	}
	public String getUser_add1() {
		return user_add1;
	}
	public void setUser_add1(String user_add1) {
		this.user_add1 = user_add1;
	}
	public String getUser_add2() {
		return user_add2;
	}
	public void setUser_add2(String user_add2) {
		this.user_add2 = user_add2;
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
	public String getVoe() {
		return voe;
	}
	public void setVoe(String voe) {
		this.voe = voe;
	}
	public String getRr() {
		return rr;
	}
	public void setRr(String rr) {
		this.rr = rr;
	}
	public String getPart() {
		return part;
	}
	public void setPart(String part) {
		this.part = part;
	}
	public String getInputaccess() {
		return inputaccess;
	}
	public void setInputaccess(String inputaccess) {
		this.inputaccess = inputaccess;
	}
	public String getADMIN_ID() {
		return ADMIN_ID;
	}
	public void setADMIN_ID(String aDMIN_ID) {
		ADMIN_ID = aDMIN_ID;
	}
	public String getADMIN_PW() {
		return ADMIN_PW;
	}
	public void setADMIN_PW(String aDMIN_PW) {
		ADMIN_PW = aDMIN_PW;
	}
}
