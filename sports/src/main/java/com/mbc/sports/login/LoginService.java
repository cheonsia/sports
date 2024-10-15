package com.mbc.sports.login;

import com.mbc.sports.member.MemberDTO;

public interface LoginService {

	MemberDTO logincheck(String id);

	String password(String id);

	String access(String id);

	String getid(String name, String birth, String tel);

	int getpw(String id, String name, String birth, String tel);

	void pwchange(String id, String pw);

}
