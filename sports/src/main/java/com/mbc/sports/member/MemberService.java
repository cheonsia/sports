package com.mbc.sports.member;

import java.util.ArrayList;

public interface MemberService {

	void normalinsert(String id, String pw, String name, String birthday, String tel, String email, String zipp_code,
			String user_add1, String user_add2, String sport, String team, String part);
	
	int getId(String id);

	void superinsert(String id, String pw, String name, String birthday, String tel, String email, String zipp_code,
			String user_add1, String user_add2, String sport, String team, String voe_fname, String rr_fname,
			String part);

	ArrayList<MemberDTO> allget();

	MemberDTO memberget(String id);

	void del_mem(String id);

}
