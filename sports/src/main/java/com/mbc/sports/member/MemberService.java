package com.mbc.sports.member;

public interface MemberService {

	void normalinsert(String id, String pw, String name, String birthday, String tel, String email, String zipp_code,
			String user_add1, String user_add2, String sport, String team, String part);
	
	int getId(String id);

	

}
