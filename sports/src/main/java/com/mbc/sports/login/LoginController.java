package com.mbc.sports.login;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mbc.sports.member.MemberDTO;
import com.mbc.sports.member.MemberService;

@Controller
public class LoginController {
	@Autowired
	SqlSession sqlsession;

	//로그인 창 이동
	@RequestMapping(value = "/login")
	public String login(HttpServletRequest request) {
		HttpSession hs = request.getSession();
		String sports = (String)hs.getAttribute("sports");
		if(sports==null) sports="축구";
		return (sports.equals("야구"))?"baseballLogin":"soccerLogin";
	}
	//로그인 관리
	@RequestMapping(value = "/logincheck",method = RequestMethod.POST)
	public String logincheck(HttpServletRequest request, HttpServletResponse response)  {
		String npath="";
		HttpSession hs = request.getSession();
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		//관리자 로그인
		String path="classpath:admin.xml";
		AbstractApplicationContext aac = new GenericXmlApplicationContext(path);		
		MemberDTO dto = aac.getBean("member",MemberDTO.class);
		String ADMIN_ID =dto.getADMIN_ID();
		String ADMIN_PW =dto.getADMIN_PW();
		if(id.equals(ADMIN_ID)&&pw.equals(ADMIN_PW)) {
			MemberService ms =sqlsession.getMapper(MemberService.class);			
			hs.setAttribute("access", ms.countmember());
			hs.setAttribute("notAccess", ms.countnotmember());
			hs.setAttribute("adminlogin", true);
			npath="redirect:/main";
		}else { //회원 로그인
			LoginService ls = sqlsession.getMapper(LoginService.class);
			PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
			MemberDTO ldto = ls.logincheck(id);
			if(ldto!=null){
				if(ls.access(id).equals("ok")){
					if(passwordEncoder.matches(pw, ldto.getPw())) {
						String part = ldto.getPart();
						String sport = ldto.getSport();
						if(part.equals("일반")) {
							hs.setAttribute("normallogin", true);				
						}
						if(part.equals("감독")) {
							hs.setAttribute("superlogin", true);
						}
						hs.setAttribute("member", ldto);
						hs.setAttribute("sports", sport);
						npath="redirect:/main";
					}else {
						npath="redirect:/login";				
					}
				}else {
					npath="redirect:/login";									
				}
			}else {
				npath="redirect:/signup";								
			}
		}
		return npath;
	}
	//로그아웃
	@RequestMapping(value = "/logout")
	public String logout(HttpServletRequest request) {
		HttpSession hs=request.getSession();
		hs.setAttribute("normallogin", false);
		hs.setAttribute("superlogin", false);
		hs.setAttribute("adminlogin", false);
		
		return "redirect:/main";
	}
	//alert을 띄우기 위함
	@RequestMapping(value = "/loginpossible",method =RequestMethod.POST)
	public void loginpossible(HttpServletRequest request,HttpServletResponse response) throws IOException {
		String id=request.getParameter("id");
		String pw=request.getParameter("pw");
		
		String path="classpath:admin.xml";
		AbstractApplicationContext aac = new GenericXmlApplicationContext(path);		
		MemberDTO dto = aac.getBean("member",MemberDTO.class);
		String ADMIN_ID =dto.getADMIN_ID();
		String ADMIN_PW =dto.getADMIN_PW();
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter prw = response.getWriter();
		if(id.equals(ADMIN_ID)&&pw.equals(ADMIN_PW)) {
			prw.print("관리자 계정으로 로그인되었습니다.");				
		}
		else {
			LoginService ls = sqlsession.getMapper(LoginService.class);
			MemberDTO ldto = ls.logincheck(id);
			String msg;
			if(ldto!=null){
				if(ldto.getPart().equals("일반") && ls.access(id).equals("no")) {
					prw.print("관리자가 임의로 차단한 계정입니다.\n추가 문의사항은 F&Q 게시판을 이용해주세요.");					
				}
				else if(ls.access(id).equals("no")){
					prw.print("관리자의 승인이 필요한 계정입니다.");
				}else {
					PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
					if(passwordEncoder.matches(pw, ldto.getPw())) {
						String name = ldto.getName();
						prw.print(name+"님 환영합니다!");
					}else {
					prw.print("아이디 혹은 비밀번호가 틀립니다.");			
					}
				}
			}else {
				prw.print("회원정보가 없습니다.\n회원가입 페이지로 이동합니다.");					
			}
		}
	}
	
	@RequestMapping(value = "/idsearch")
	public String idsearch() {
		return "id_search";
	}
	
	@RequestMapping(value = "/getid",method =RequestMethod.POST)
	public void getId(String name, String birth, String tel, HttpServletResponse response) throws IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter prw = response.getWriter();
		LoginService ls = sqlsession.getMapper(LoginService.class);
		String id = ls.getid(name,birth,tel);
		if(id==null || id=="") {
			prw.print("아이디를 찾을 수 없습니다.");
		}
		else {
			prw.print("당신의 아이디는 "+id+"입니다.");
		}
		
	}
	
	@RequestMapping(value = "/pwsearch")
	public String pwsearch() {
		return "pw_search";
	}
	
	@RequestMapping(value = "/getpw",method =RequestMethod.POST)
	public void getPw(String id, String name, String birth, String tel, HttpServletResponse response) throws IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter prw = response.getWriter();
		LoginService ls = sqlsession.getMapper(LoginService.class);
		int result = ls.getpw(id,name,birth,tel);
		prw.print(result);
	}
	
	@RequestMapping(value = "/pwchange")
	public String pwchange(String id, Model mo) {
		mo.addAttribute("id", id);
		return "pw_change";
	}
	
	@RequestMapping(value = "/pwud")
	public void pw_update(HttpServletRequest request) {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		pw=passwordEncoder.encode(pw);
		LoginService ls = sqlsession.getMapper(LoginService.class);
		ls.pwchange(id,pw);
	}
}
