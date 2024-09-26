package com.mbc.sports.member;

public class MemberDTO {
	String id,pw,name,birthday,tel,email;
	int zzip_code;
	String user_add1,user_add2,favorite_sport,teamlist,management_sport,management_team,voe,rr,member_level;
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
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
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
	public int getZzip_code() {
		return zzip_code;
	}
	public void setZzip_code(int zzip_code) {
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
	public String getFavorite_sport() {
		return favorite_sport;
	}
	public void setFavorite_sport(String favorite_sport) {
		this.favorite_sport = favorite_sport;
	}
	public String getTeamlist() {
		return teamlist;
	}
	public void setTeamlist(String teamlist) {
		this.teamlist = teamlist;
	}
	public String getManagement_sport() {
		return management_sport;
	}
	public void setManagement_sport(String management_sport) {
		this.management_sport = management_sport;
	}
	public String getManagement_team() {
		return management_team;
	}
	public void setManagement_team(String management_team) {
		this.management_team = management_team;
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
	public String getMember_level() {
		return member_level;
	}
	public void setMember_level(String member_level) {
		this.member_level = member_level;
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
