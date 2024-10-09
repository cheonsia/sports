package com.mbc.sports.login;

import com.mbc.sports.member.MemberDTO;

public interface LoginService {

	MemberDTO logincheck(String id);

	String password(String id);

	String access(String id);

}
