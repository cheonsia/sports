package com.mbc.sports.soccerplayer;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;


@Controller
public class SPlayerController {
	
	String splayerpath = "C:\\sports\\sports\\sports\\src\\main\\webapp\\image\\soccer\\player";
	String bplayerpath = "C:\\sports\\sports\\sports\\src\\main\\webapp\\image\\baseball\\player";
	
	@Autowired
	SqlSession sqlsession;
	
	@RequestMapping(value = "/playerinput")
	public String playerin(HttpServletRequest request,Model model) {
		String play = request.getParameter("play");
		model.addAttribute("play", play);
		return (play.equals("축구")) ? "soccerplayerinput" :"baseballplayerinput";
	}
	
	@RequestMapping(value = "/playersave", method = RequestMethod.POST)
	public String playersave(MultipartHttpServletRequest mul) throws IllegalStateException, IOException {
		String play = mul.getParameter("play");
		String stname = mul.getParameter("stname");
		String btname = mul.getParameter("btname");
		String pname = mul.getParameter("pname");
		int pnumber = Integer.parseInt(mul.getParameter("pnumber"));
		String pbirth = mul.getParameter("pbirth");
		int height = Integer.parseInt(mul.getParameter("height"));
		int weight = Integer.parseInt(mul.getParameter("weight"));
		MultipartFile mf = mul.getFile("pimage");
		String pimage = mf.getOriginalFilename();
		pimage = filesave(pimage,mf.getBytes());
		String pchar = mul.getParameter("pchar");
		SPlayerService ps = sqlsession.getMapper(SPlayerService.class);
		if(play.equals("soccer")) {
			String main = mul.getParameter("smain");
			ps.playersoccer(stname,pname,pnumber,pbirth,height,weight,main,pimage,pchar,play);	
			mf.transferTo(new File(splayerpath+"\\"+pimage));
		} else {
			String main = mul.getParameter("bmain");
			ps.playerbaseball(btname,pname,pnumber,pbirth,height,weight,main,pimage,pchar,play);
			mf.transferTo(new File(bplayerpath+"\\"+pimage));
		}
		 
		return "redirect:/";
	}
	
	private String filesave(String pimage, byte[] bytes) {
		UUID ud = UUID.randomUUID();
		String pname = ud.toString()+"_"+pimage;
		
		return pname;
	}

	@RequestMapping(value = "/soccerplayerlist")
	   public String playerlist() {      
	      return "soccerplayerlist";
	}
	
	@RequestMapping(value = "/selectTeam")
	public String selectTeam(HttpServletRequest request, Model mo) {
		String tname = request.getParameter("name");
		String soccer_area_han = request.getParameter("area");
		SPlayerService ps = sqlsession.getMapper(SPlayerService.class);
		if(tname.equals("ALL")) {
			ArrayList<SPlayerDTO> list = ps.allTeamSelect();
			mo.addAttribute("list", list);
		} else {
			ArrayList<SPlayerDTO> list = ps.selectTeam(tname);
			mo.addAttribute("list", list);
		}
		mo.addAttribute("teamarea",soccer_area_han);
		
		return "soccerplayerlist";
	}
	
	@RequestMapping(value = "/soccerdetail")
	public String pdetail(HttpServletRequest request, Model mo) {
		int pnumber = Integer.parseInt(request.getParameter("pnumber"));
		int playernum = Integer.parseInt(request.getParameter("playernum"));
		String teamarea = request.getParameter("teamarea");
		SPlayerService ps = sqlsession.getMapper(SPlayerService.class);
		SPlayerDTO dto = ps.detail(playernum);
		ArrayList<UcommentDTO> clist = ps.comment(playernum);
		mo.addAttribute("dto", dto);
		mo.addAttribute("teamarea",teamarea);
		mo.addAttribute("clist", clist);
		return "soccerplayerdetail";
	}
	
	@RequestMapping(value = "/soccerclickup")
	public String clickup(HttpServletRequest request, Model model) {
		int playernum = Integer.parseInt(request.getParameter("playernum"));
		int pnumber = Integer.parseInt(request.getParameter("pnumber"));
		String tname = request.getParameter("tname");
		String teamarea = request.getParameter("teamarea");
		SPlayerService ps = sqlsession.getMapper(SPlayerService.class);
		ps.clickup(pnumber);
		ps.comment(pnumber);
		model.addAttribute("playernum", playernum);
		model.addAttribute("pnumber", pnumber);
		model.addAttribute("teamarea", tname);
		return "redirect:/soccerdetail";
	}
	
	@RequestMapping(value = "/soccercommentsave")
	public String commentsave(HttpServletRequest request, Model model) {
		int playernum = Integer.parseInt(request.getParameter("playernum"));
		int pnumber = Integer.parseInt(request.getParameter("pnumber"));
		String writer= request.getParameter("writer");
		String comment = request.getParameter("comment");
		String teamarea = request.getParameter("teamarea");

		SPlayerService ps = sqlsession.getMapper(SPlayerService.class);
		int step= ps.setStep(playernum)+1;
		ps.commentin(playernum,writer,comment,step);
		ps.updateset(step, playernum);
		ArrayList<UcommentDTO> clist = ps.comment(playernum);
		model.addAttribute("clist", clist);
		model.addAttribute("pnumber", pnumber);
		model.addAttribute("teamarea", teamarea);
		model.addAttribute("playernum", playernum);
		
		return "redirect:/soccerdetail";
	}
	
	@RequestMapping(value = "/soccerheart")
	public String heart(HttpServletRequest request, Model model) {
		int playernum = Integer.parseInt(request.getParameter("playernum"));
		int pnumber = Integer.parseInt(request.getParameter("pnumber"));
		String writer= request.getParameter("writer");
		String ucomment = request.getParameter("ucomment");
		String teamarea = request.getParameter("teamarea");
		SPlayerService ps = sqlsession.getMapper(SPlayerService.class);
		ps.heart(playernum,writer,ucomment);
		
		model.addAttribute("playernum",playernum);
		model.addAttribute("pnumber",pnumber);
		model.addAttribute("teamarea",teamarea);
		
		return "redirect:/soccerdetail";
	}
	
	@RequestMapping(value = "/soccerplayerdelete")
	public String playerdelete(HttpServletRequest request, Model model) {
		int playernum = Integer.parseInt(request.getParameter("playernum"));
		SPlayerService ps = sqlsession.getMapper(SPlayerService.class);
		SPlayerDTO dto = ps.playerdelete(playernum);
		model.addAttribute("dto", dto);
		
		return "soccerpdeleteview";
	}
	
	@RequestMapping(value = "/soccerdelete")
	public String delete(HttpServletRequest request, Model model) {
		int playernum = Integer.parseInt(request.getParameter("playernum"));
		String pimage=request.getParameter("pimage");
		String tname = request.getParameter("tname");
		SPlayerService ps = sqlsession.getMapper(SPlayerService.class);
		ps.delete(playernum);
		File img = new File(splayerpath+"\\"+pimage);
		img.delete();
		model.addAttribute("name", tname);
		
		return "redirect:/selectTeam";
	}
	
	@RequestMapping(value = "/soccerplayerupdate")
	public String playerupdate(HttpServletRequest request, Model model) {
		int playernum = Integer.parseInt(request.getParameter("playernum"));
		SPlayerService ps = sqlsession.getMapper(SPlayerService.class);
		SPlayerDTO dto = ps.playerdelete(playernum);
		model.addAttribute("dto", dto);
		
		return "soccerpupdateview";
	}
	
	@RequestMapping(value = "/soccerupdatesave")
	public String updatesave(MultipartHttpServletRequest mul, Model model) throws IOException {
		String rimage = mul.getParameter("rimage");
		File f = new File(splayerpath+"\\"+rimage);
		f.delete();
		String play = mul.getParameter("play");
		String tname = mul.getParameter("tname");
		String pname = mul.getParameter("pname");
		int pnumber = Integer.parseInt(mul.getParameter("pnumber"));
		int playernum = Integer.parseInt(mul.getParameter("playernum"));
		String pbirth = mul.getParameter("pbirth");
		String main = mul.getParameter("main");
		int height = Integer.parseInt(mul.getParameter("height"));
		int weight = Integer.parseInt(mul.getParameter("weight"));
		MultipartFile mf = mul.getFile("pimage");
		String pimage = mf.getOriginalFilename();
		pimage = filesave(pimage,mf.getBytes());
		String pchar = mul.getParameter("pchar");
		SPlayerService ps = sqlsession.getMapper(SPlayerService.class);
		mf.transferTo(new File(splayerpath+"\\"+pimage));
		if(play.equals("soccer")) {
			ps.playersoccerupdate(tname,pname,pnumber,pbirth,height,weight,main,pimage,pchar,playernum);			
		} else {
			ps.playerbaseballupdate(tname,pname,pnumber,pbirth,height,weight,main,pimage,pchar,playernum);
		}
		model.addAttribute("name", tname);
		
		return "redirect:/selectTeam";
	}
	
	@RequestMapping(value = "/commentdelete")
	public String commentdelete(HttpServletRequest request,Model mo) {
		int playernum = Integer.parseInt(request.getParameter("playernum"));
		int step = Integer.parseInt(request.getParameter("step"));
		int pnumber = Integer.parseInt(request.getParameter("pnumber"));
		String teamarea = request.getParameter("teamarea");
		SPlayerService ps = sqlsession.getMapper(SPlayerService.class);
		ps.commentdelete(playernum,step);
		mo.addAttribute("teamarea",teamarea);
		mo.addAttribute("playernum",playernum);
		mo.addAttribute("pnumber",pnumber);
		
		
		return "redirect:/soccerdetail";
	}
	
	@RequestMapping(value = "/soccercommentupdate")
	public String soccercommentupdate(HttpServletRequest request,Model mo) {
		int playernum = Integer.parseInt(request.getParameter("playernum"));
		int step = Integer.parseInt(request.getParameter("step"));
		int pnumber = Integer.parseInt(request.getParameter("pnumber"));
		String teamarea = request.getParameter("teamarea");
		String ucomment = request.getParameter("ucomment");
		SPlayerService ps = sqlsession.getMapper(SPlayerService.class);
		ps.commentupdate(playernum,step,ucomment);
		ArrayList<UcommentDTO> clist = ps.comment(playernum); //PLAYERNUM 선수의 댓글 모두 다 가지고 오기
		mo.addAttribute("teamarea",teamarea);
		mo.addAttribute("playernum",playernum);
		mo.addAttribute("pnumber",pnumber);
		mo.addAttribute("clist", clist);
		
		return "redirect:/soccerdetail";
	}
	
	@RequestMapping(value = "/soccergoods")
	public String soccergoods(HttpServletRequest request, Model model) {
		return "soccergoods";
	}
	
}
