package com.mbc.sports.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.mbc.sports.HomeController;

@Controller
public class MemberController {
	
private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	SqlSession sqlsession;
	
	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public String sign_up() {
		return "signup";
	}
	
	@RequestMapping(value = "/general", method = RequestMethod.GET)
	public String generalmember_sign_up() {
		return "general";
	}
	
	@RequestMapping(value = "/super", method = RequestMethod.GET)
	public String super_sign_up() {
		return "super";
	}
	
	@RequestMapping(value = "/generalsave", method = RequestMethod.POST)
	public String generalmember_save(HttpServletRequest request) {
		
		String id=request.getParameter("id");
		String pw=request.getParameter("pw");
		PasswordEncoder passwordEncoder=new BCryptPasswordEncoder();
		pw=passwordEncoder.encode(pw);
		String name=request.getParameter("name");
		String birthday=request.getParameter("birthday");
		String tel=request.getParameter("tel");
		String email=request.getParameter("email");
		String zipp_code=request.getParameter("zipp_code");
		String user_add1=request.getParameter("user_add1");
		String user_add2=request.getParameter("user_add2");
		String sport=request.getParameter("sport");
		String team=request.getParameter("team");
		String part=request.getParameter("part");
		
		MemberService ss = sqlsession.getMapper(MemberService.class);
		ss.normalinsert(id,pw,name,birthday,tel,email,zipp_code,user_add1,user_add2,sport,team,part);
		
		return "login";
	}

	@RequestMapping(value = "/idcheck", method = RequestMethod.POST)
	public void ID_Check(String id, HttpServletResponse response) throws IOException {
		
		response.setContentType("text/html;charset=utf-8");
		MemberService ss = sqlsession.getMapper(MemberService.class);
		int result = ss.getId(id);
		PrintWriter prw =response.getWriter();
		prw.print(result);
	}

}
