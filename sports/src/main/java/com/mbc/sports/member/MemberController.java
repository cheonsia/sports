package com.mbc.sports.member;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@Controller
public class MemberController {
@Autowired
	SqlSession sqlsession;
	
	String path="C:\\project\\sports\\sports\\src\\main\\webapp\\image\\member\\super";
	
	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public String signup() {
		return "signup";
	}
	@RequestMapping(value = "/signupForm", method = RequestMethod.GET)
	public String signupForm(String part, Model model) {
		model.addAttribute("part",part);
		return "signUpForm";
	}	
	//회원 저장
	@RequestMapping(value = "/memberSave", method = RequestMethod.POST)
	public String memberSave(MultipartHttpServletRequest mul) throws IOException {
		String id = mul.getParameter("id");
		String pw = mul.getParameter("pw");
		PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		pw=passwordEncoder.encode(pw);
		String name = mul.getParameter("name");
		String birth = mul.getParameter("birth");
		String tel = mul.getParameter("tel");
		String email = mul.getParameter("email");
		String zipp_code = mul.getParameter("zipp_code");
		String user_add1 = mul.getParameter("user_add1");
		String user_add2 = mul.getParameter("user_add2");
		String sport = mul.getParameter("sport");
		String team = mul.getParameter("team");
		String part = mul.getParameter("part");
		String voe="",rr="",access="ok";
		
		if(part.equals("감독")) {
			MultipartFile voeFull = mul.getFile("voe");
			MultipartFile rrFull = mul.getFile("rr");
			voe = voeFull.getOriginalFilename();
			rr = rrFull.getOriginalFilename();
			voe = filesave(voe, voeFull.getBytes());
			rr = filesave(rr, rrFull.getBytes());
			voeFull.transferTo(new File(path+"\\"+voe));
			rrFull.transferTo(new File(path+"\\"+rr));
			access="no";
		}
		MemberService ms = sqlsession.getMapper(MemberService.class);
		ms.insert(id,pw,name,birth,tel,email,zipp_code,user_add1,user_add2,sport,team,voe,rr,part,access);
		return "redirect:/login";
	}
	//이미지 고유 저장
	private String filesave(String fname, byte[] bytes) {
		UUID uuid = UUID.randomUUID();
		return uuid.toString()+"_"+fname;
	}
	//ID 중복확인
	@RequestMapping(value = "/idcheck", method = RequestMethod.POST)
	public void idCheck(String id, HttpServletResponse response) throws IOException {
		response.setContentType("text/html;charset=utf-8");
		MemberService ms = sqlsession.getMapper(MemberService.class);
		int result = ms.getId(id);
		PrintWriter prw =response.getWriter();
		prw.print(result);
	}
	//승인된 회원 조회
	@RequestMapping(value = "/memberList", method = RequestMethod.GET)
	public String memberList(Model mo) {
				
		MemberService ms = sqlsession.getMapper(MemberService.class);
		ArrayList<MemberDTO> list = ms.memberlist();
		mo.addAttribute("list", list);
		
		return "memberList";
	}
	//승인 안된 회원 조회
	@RequestMapping(value = "/memberNoList", method = RequestMethod.GET)
	public String memberNoList(Model mo) {
		
		MemberService ms = sqlsession.getMapper(MemberService.class);
		ArrayList<MemberDTO> list = ms.memberNotlist();
		mo.addAttribute("list", list);
		
		return "memberList";
	}
	//회원 삭제 창 이동
	@RequestMapping(value = "/memberdelete", method = RequestMethod.GET)
	public String memberdelete(String id, Model mo) {
		MemberService ms = sqlsession.getMapper(MemberService.class);
		MemberDTO member = ms.select(id);
		mo.addAttribute("del", member);
		return "memberDelete";
	}
	//회원 삭제
	@RequestMapping(value = "/deleteMember", method = RequestMethod.POST)
	public String delete(HttpServletRequest request) {
		String id = request.getParameter("id");
		String part = request.getParameter("part");		
		if(part.equals("감독")) {
			String voe = request.getParameter("voe");
			String rr = request.getParameter("rr");	
			File voeImg = new File(path+"\\"+voe);
			voeImg.delete();		
			File rrImg = new File(path+"\\"+rr);
			rrImg.delete();
		}		
		MemberService ms = sqlsession.getMapper(MemberService.class);
		ms.del_mem(id);
		return "redirect:/memberList";
	}
	//마이페이지(상세페이지)로 이동
	@RequestMapping(value = "/mypage")
	public String mypage(String id, Model model) {
		MemberService ms = sqlsession.getMapper(MemberService.class);
		MemberDTO member = ms.select(id);
		model.addAttribute("my", member);
		return "mypage";
	}	
	//비밀번호 확인
	@RequestMapping(value = "/pwCheck", method = RequestMethod.POST)
	public void pw_Check(String id, String pw, HttpServletResponse response) throws IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter prw = response.getWriter();
		MemberService ms = sqlsession.getMapper(MemberService.class);
		int result;
		String pwcheck = ms.pwCheck(id);		
		PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		if(passwordEncoder.matches(pw, pwcheck)) {
			result=1;
		}
		else {
			result=0;
		}
		prw.print(result);
	}
	//비밀번호 수정
	@RequestMapping(value = "/pwUpdate", method = RequestMethod.POST)
	public void pwUpdate(String id, String pw, HttpServletResponse response) throws IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter prw = response.getWriter();
		PasswordEncoder passwordEncoder=new BCryptPasswordEncoder();
		String cpw = passwordEncoder.encode(pw);
		MemberService ms = sqlsession.getMapper(MemberService.class);
		ms.pwupdate(id, cpw);
		prw.print("");
	}
	//정보 수정 창으로 가기
	@RequestMapping(value = "/memberupdate", method = RequestMethod.GET)
	public String memberupdate(String id, Model mo) {
		
		MemberService ms = sqlsession.getMapper(MemberService.class);
		MemberDTO update_member = ms.select(id);
		mo.addAttribute("my", update_member);
		
		return "memberUpdate";
	}
	//정보 수정
	@RequestMapping(value = "/memberUpdate", method = RequestMethod.POST)
	public String memberUpdate(MultipartHttpServletRequest mul, Model mo) throws IOException {
		String voe="", rr="";
		String part=mul.getParameter("part");
		String id=mul.getParameter("id");
		String name=mul.getParameter("name");
		String birth = mul.getParameter("birth");
		String tel=mul.getParameter("tel");
		String zipp_code=mul.getParameter("zipp_code");
		String user_add1=mul.getParameter("user_add1");
		String user_add2=mul.getParameter("user_add2");
		String sport=mul.getParameter("sport");
		String team=mul.getParameter("team");
		//감독
		if(part.equals("감독")) {
			String refvoe=mul.getParameter("refvoe");
			String refrr=mul.getParameter("refrr");
			MultipartFile voe_mf = mul.getFile("voe");
			MultipartFile rr_mf = mul.getFile("rr");
			voe = voe_mf.getOriginalFilename();		
			rr = rr_mf.getOriginalFilename();		
			if(voe.equals("")) {
				voe = refvoe;
			}else{
				voe = filesave(voe, voe_mf.getBytes());
				voe_mf.transferTo(new File(path+"\\"+voe));
				File file = new File(path+"\\"+refvoe);
				file.delete();
			}
			if(rr.equals("")) {
				rr = refrr;
			}else {
				rr = filesave(rr, rr_mf.getBytes());
				rr_mf.transferTo(new File(path+"\\"+rr));			
				File file = new File(path+"\\"+refrr);
				file.delete();
			}
		}
		MemberService ms = sqlsession.getMapper(MemberService.class);
		ms.update(id,name,birth,tel,zipp_code,user_add1,user_add2,sport,team,voe,rr);
		mo.addAttribute("id", id);
		return "redirect:/mypage";
	}
	//관리자 권한: 회원 승인 관리
	@RequestMapping(value = "/memberAccess")
	public String possible(HttpServletRequest request) {
		String id = request.getParameter("id");
		MemberService ms = sqlsession.getMapper(MemberService.class);
		ms.updateAccess(id);
		
		HttpSession hs = request.getSession();
		hs.setAttribute("access", ms.countmember());
		hs.setAttribute("notAccess", ms.countnotmember());
		return "redirect:/memberList";
	}
}
