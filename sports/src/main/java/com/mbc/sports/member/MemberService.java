package com.mbc.sports.member;

import java.util.ArrayList;

public interface MemberService {

	int getId(String id);

	void insert(String id, String pw, String name, String birthday, String tel, String email, String zipp_code,
			String user_add1, String user_add2, String sport, String team, String voe, String rr, String part,
			String access);
	
	ArrayList<MemberDTO> memberlist();

	ArrayList<MemberDTO> memberNotlist();

	MemberDTO select(String id);

	void del_mem(String id);

	String pwCheck(String id);

	void pwupdate(String id, String pw);

	void update(String id, String name, String birth, String tel, String zipp_code, String user_add1, String user_add2,
			String sport, String team, String voe_fname, String rr_fname);
	
	int countmember();
	
	int countnotmember();

	void updateAccess(String id);


}
