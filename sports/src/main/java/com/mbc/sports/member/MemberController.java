package com.mbc.sports.member;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.UUID;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.mbc.sports.HomeController;
import com.mbc.sports.login.LoginDTO;

@Controller
public class MemberController {
	
private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	SqlSession sqlsession;
	
	String path="C:\\project\\sports\\sports\\src\\main\\webapp\\image\\super";
	
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
	
	@RequestMapping(value = "/supersave", method = RequestMethod.POST)
	public String superintendent_save(MultipartHttpServletRequest mul) throws IOException {
		
		String id=mul.getParameter("id");
		String pw=mul.getParameter("pw");
		PasswordEncoder passwordEncoder=new BCryptPasswordEncoder();
		pw=passwordEncoder.encode(pw);
		String name=mul.getParameter("name");
		String birthday=mul.getParameter("birthday");
		String tel=mul.getParameter("tel");
		String email=mul.getParameter("email");
		String zipp_code=mul.getParameter("zipp_code");
		String user_add1=mul.getParameter("user_add1");
		String user_add2=mul.getParameter("user_add2");
		String sport=mul.getParameter("sport");
		String team=mul.getParameter("team");
		MultipartFile voe_mf = mul.getFile("voe");
		String voe_fname = voe_mf.getOriginalFilename();
		voe_fname = voe_filesave(voe_fname, voe_mf.getBytes());
		voe_mf.transferTo(new File(path+"\\"+voe_fname));
		
		MultipartFile rr_mf = mul.getFile("rr");
		String rr_fname = rr_mf.getOriginalFilename();
		rr_fname = rr_filesave(rr_fname, rr_mf.getBytes());
		rr_mf.transferTo(new File(path+"\\"+rr_fname));
		
		String part=mul.getParameter("part");
		
		MemberService ss = sqlsession.getMapper(MemberService.class);
		ss.superinsert(id,pw,name,birthday,tel,email,zipp_code,user_add1,user_add2,sport,team,voe_fname,rr_fname,part);
		
		return "redirect:/";
	}

	private String voe_filesave(String voe_fname, byte[] bytes) {
		UUID uuid = UUID.randomUUID();
		String fname = uuid.toString()+"_"+voe_fname;
		return fname;
	}
	
	private String rr_filesave(String rr_fname, byte[] bytes) {
		UUID uuid = UUID.randomUUID();
		String fname = uuid.toString()+"_"+rr_fname;
		return fname;
	}

	@RequestMapping(value = "/idcheck", method = RequestMethod.POST)
	public void IDCheck(String id, HttpServletResponse response) throws IOException {
		
		response.setContentType("text/html;charset=utf-8");
		MemberService ss = sqlsession.getMapper(MemberService.class);
		int result = ss.getId(id);
		PrintWriter prw =response.getWriter();
		prw.print(result);
	}
	
	@RequestMapping(value = "/member_list", method = RequestMethod.GET)
	public String member_list(Model mo) {
				
		MemberService ss = sqlsession.getMapper(MemberService.class);
		ArrayList<MemberDTO> list = ss.allget();
		mo.addAttribute("list", list);
		
		return "member_list";
	}
	
	@RequestMapping(value = "/member_delete", method = RequestMethod.GET)
	public String Member_Delete_View(String id, Model mo) {
		
		MemberService ss = sqlsession.getMapper(MemberService.class);
		MemberDTO member = ss.memberget(id);
		mo.addAttribute("del", member);
		
		return "member_delete";
	}
	
	@RequestMapping(value = "/delete_member", method = RequestMethod.POST)
	public String Member_Delete(HttpServletRequest request) {
		
		String id = request.getParameter("id");
		String part = request.getParameter("part");
		
		if(part.equals("감독")) {
			String fname1 = request.getParameter("voe");
			String fname2 = request.getParameter("rr");
			
			File img1 = new File(path+"\\"+fname1);
			img1.delete();
			
			File img2 = new File(path+"\\"+fname2);
			img2.delete();
		}
		
		MemberService ss = sqlsession.getMapper(MemberService.class);
		ss.del_mem(id);
		
		return "redirect:/member_list";
	}
	
	@RequestMapping(value = "/member_detail", method = RequestMethod.GET)
	public String Detail_View(String id, Model mo) {
		
		MemberService ss = sqlsession.getMapper(MemberService.class);
		MemberDTO member = ss.memberget(id);
		mo.addAttribute("wm", member);
		
		return "member_detail";
	}
	
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String Mypage(String id, Model mo) {
		
		MemberService ss = sqlsession.getMapper(MemberService.class);
		MemberDTO member = ss.memberget(id);
		mo.addAttribute("my", member);
		
		return "mypage";
	}
	
	@RequestMapping(value = "/pwCheck", method = RequestMethod.POST)
	public void pw_Check(String id, String pw, HttpServletResponse response) throws IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter prw = response.getWriter();
		MemberService ss = sqlsession.getMapper(MemberService.class);
		int result;
		String pwcheck = ss.pwCheck(id);		
		PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		if(passwordEncoder.matches(pw, pwcheck)) {
			result=1;
		}
		else {
			result=0;
		}
		
		prw.print(result);
	}
	
	@RequestMapping(value = "/pwUpdate", method = RequestMethod.POST)
	public String pw_Update(String id, String pw, Model mo) {
		
		PasswordEncoder passwordEncoder=new BCryptPasswordEncoder();
		pw=passwordEncoder.encode(pw);
		MemberService ss = sqlsession.getMapper(MemberService.class);
		ss.pwupdate(id, pw);
		mo.addAttribute("id", id);
		
		return "redirect:/mypage";
	}
	
	@RequestMapping(value = "/mypage_update", method = RequestMethod.GET)
	public String Mypage2(String id, Model mo) {
		
		MemberService ss = sqlsession.getMapper(MemberService.class);
		MemberDTO update_member = ss.memberget(id);
		mo.addAttribute("up", update_member);
		
		return "mypage_update_view";
	}
	
	@RequestMapping(value = "/myUpdate", method = RequestMethod.POST)
	public String mypage__Update(MultipartHttpServletRequest mul, Model mo) throws IOException {
		String voe_fname,rr_fname;
		String id=mul.getParameter("id");
		String name=mul.getParameter("name");
		String tel=mul.getParameter("tel");
		String zipp_code=mul.getParameter("zipp_code");
		String user_add1=mul.getParameter("user_add1");
		String user_add2=mul.getParameter("user_add2");
		String sport=mul.getParameter("sport");
		String team=mul.getParameter("team");
		String refvoe=mul.getParameter("refvoe");
		String refrr=mul.getParameter("refrr");
		MultipartFile voe_mf = mul.getFile("voe");
		MultipartFile rr_mf = mul.getFile("rr");
		voe_fname = voe_mf.getOriginalFilename();		
		rr_fname = rr_mf.getOriginalFilename();
		//회원
		if(refvoe.equals("")||refvoe.equals(null)) {
			voe_fname ="";
		}
		if(refrr.equals("")||refrr.equals(null)) {
			rr_fname ="";
		}
		//감독
		if(voe_fname.equals("")||voe_fname.equals(null)) {
			voe_fname = refvoe;
		}else{
			voe_fname = voe_filesave(voe_fname, voe_mf.getBytes());
			voe_mf.transferTo(new File(path+"\\"+voe_fname));
			File file = new File(path+"\\"+refvoe);
			file.delete();
		}
		if(rr_fname.equals("")||rr_fname.equals(null)) {
			rr_fname = refvoe;
		}else {
			rr_fname = rr_filesave(rr_fname, rr_mf.getBytes());
			rr_mf.transferTo(new File(path+"\\"+rr_fname));			
			File file = new File(path+"\\"+refrr);
			file.delete();
		}
		
		MemberService ss = sqlsession.getMapper(MemberService.class);
		ss.mypageupdate(id,name,tel,zipp_code,user_add1,user_add2,sport,team,voe_fname,rr_fname);
		mo.addAttribute("id", id);
		
		return "redirect:/mypage";
	}
	

}
