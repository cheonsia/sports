package com.mbc.sports.baseballplayer;

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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.mbc.sports.soccerplayer.SPlayerDTO;
import com.mbc.sports.soccerplayer.SPlayerService;

@Controller
public class BPlayerController {
	
	String splayerpath = "C:\\sports\\sports\\sports\\src\\main\\webapp\\image\\soccer\\player";
	String bplayerpath = "C:\\sports\\sports\\sports\\src\\main\\webapp\\image\\baseball\\player";
	
	@Autowired
	SqlSession sqlsession;
	
	@RequestMapping(value = "/baseballplayerinput")
	public String baseballplayerinput() {
		return "baseballplayerinput";
	}
	
	@RequestMapping(value = "/baseballplayerlist")
	   public String playerlist() {      
	      return "baseballplayerlist";
	}
	
	@RequestMapping(value = "/baseballselectTeam")
	public String baseballselectTeam(HttpServletRequest request, Model mo) {
		String tname = request.getParameter("tname");
		String baseball_area_han = request.getParameter("area");
		BPlayerService ps = sqlsession.getMapper(BPlayerService.class);
		if(tname.equals("ALL")) {
			ArrayList<BPlayerDTO> list = ps.allTeamSelect();
			mo.addAttribute("list", list);
		} else {
			ArrayList<BPlayerDTO> list = ps.selectTeam(tname);
			mo.addAttribute("list", list);
		}
		mo.addAttribute("teamarea",baseball_area_han);
		
		return "baseballplayerlist";
	}
	
	@RequestMapping(value = "/baseballplayerdetail")
	public String baseballpdetail(HttpServletRequest request, Model mo) {
		int pnumber = Integer.parseInt(request.getParameter("pnumber"));
		int playernum = Integer.parseInt(request.getParameter("playernum"));
		String teamarea = request.getParameter("teamarea");
		BPlayerService ps = sqlsession.getMapper(BPlayerService.class);
		BPlayerDTO dto = ps.detail(playernum);
		ArrayList<BUcommentDTO> clist = ps.comment(playernum);
		mo.addAttribute("dto", dto);
		mo.addAttribute("teamarea",teamarea);
		mo.addAttribute("clist", clist);
		return "baseballplayerdetail";
	}
	
	@RequestMapping(value = "/baseballclickup")
	public String clickup(HttpServletRequest request, Model model) {
		int playernum = Integer.parseInt(request.getParameter("playernum"));
		int pnumber = Integer.parseInt(request.getParameter("pnumber"));
		String tname = request.getParameter("tname");
		String teamarea = request.getParameter("teamarea");
		BPlayerService ps = sqlsession.getMapper(BPlayerService.class);
		ps.clickup(playernum);
		ps.comment(playernum);
		model.addAttribute("playernum", playernum);
		model.addAttribute("pnumber", pnumber);
		model.addAttribute("teamarea", tname);
		return "redirect:/baseballplayerdetail";
	}

	@RequestMapping(value = "/baseballcommentsave")
	public String baseballcommentsave(HttpServletRequest request, Model model) {
		int playernum = Integer.parseInt(request.getParameter("playernum"));
		int pnumber = Integer.parseInt(request.getParameter("pnumber"));
		String writer= request.getParameter("writer");
		String comment = request.getParameter("comment");
		String teamarea = request.getParameter("teamarea");
		String tname = request.getParameter("tname");

		BPlayerService ps = sqlsession.getMapper(BPlayerService.class);
		int step= ps.setStep(playernum)+1;
		ps.commentin(playernum,writer,comment,step);
		ps.updateset(step, playernum);
		ArrayList<BUcommentDTO> clist = ps.comment(playernum);
		model.addAttribute("clist", clist);
		model.addAttribute("pnumber", pnumber);
		model.addAttribute("teamarea", teamarea);
		model.addAttribute("playernum", playernum);
		
		return "redirect:/baseballplayerdetail";
	}
	
	@RequestMapping(value = "/baseballheart")
	public String heart(HttpServletRequest request, Model model) {
		int playernum = Integer.parseInt(request.getParameter("playernum"));
		int pnumber = Integer.parseInt(request.getParameter("pnumber"));
		String writer= request.getParameter("writer");
		String ucomment = request.getParameter("ucomment");
		String teamarea = request.getParameter("teamarea");
		BPlayerService ps = sqlsession.getMapper(BPlayerService.class);
		ps.heart(playernum,writer,ucomment);
		
		model.addAttribute("playernum",playernum);
		model.addAttribute("pnumber",pnumber);
		model.addAttribute("teamarea",teamarea);
		
		return "redirect:/baseballplayerdetail";
	}
	
	@RequestMapping(value = "/baseballpdeleteview")
	public String playerdelete(HttpServletRequest request, Model model) {
		int playernum = Integer.parseInt(request.getParameter("playernum"));
		BPlayerService ps = sqlsession.getMapper(BPlayerService.class);
		BPlayerDTO dto = ps.playerdelete(playernum);
		model.addAttribute("dto", dto);
		
		return "baseballpdeleteview";
	}
	
	@RequestMapping(value = "/baseballdelete")
	public String delete(HttpServletRequest request, Model model) {
		int playernum = Integer.parseInt(request.getParameter("playernum"));
		String pimage=request.getParameter("pimage");
		String tname = request.getParameter("tname");
		BPlayerService ps = sqlsession.getMapper(BPlayerService.class);
		ps.delete(playernum);
		File img = new File(bplayerpath+"\\"+pimage);
		img.delete();
		model.addAttribute("tname", tname);
		model.addAttribute("area", tname);
		
		return "redirect:/baseballselectTeam";
	}
	
	@RequestMapping(value = "/baseballplayerupdate")
	public String playerupdate(HttpServletRequest request, Model model) {
		int playernum = Integer.parseInt(request.getParameter("playernum"));
		BPlayerService ps = sqlsession.getMapper(BPlayerService.class);
		BPlayerDTO dto = ps.playerdelete(playernum);
		model.addAttribute("dto", dto);
		
		return "baseballpupdateview";
	}
	
	@RequestMapping(value = "/baseballupdatesave")
	public String updatesave(MultipartHttpServletRequest mul, Model model) throws IOException {
		
		String rimage = mul.getParameter("rimage");
		File f = new File(bplayerpath+"\\"+rimage);
		f.delete();
		
		String play = mul.getParameter("play");
		String tname = mul.getParameter("btname");
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
		BPlayerService ps = sqlsession.getMapper(BPlayerService.class);
		mf.transferTo(new File(bplayerpath+"\\"+pimage));
		if(play.equals("baseball")) {
			ps.playerbaseballupdate(tname,pname,pnumber,pbirth,height,weight,main,pimage,pchar,playernum);
		} else {
			ps.playersoccerupdate(tname,pname,pnumber,pbirth,height,weight,main,pimage,pchar,playernum);			
		}
		model.addAttribute("tname", tname);
		model.addAttribute("area", tname);
		
		return "redirect:/baseballselectTeam";
	}
	
	private String filesave(String pimage, byte[] bytes) {
		UUID ud = UUID.randomUUID();
		String pname = ud.toString()+"_"+pimage;
		
		return pname;
	}
	
	@RequestMapping(value = "/baseballcommentdelete")
	public String commentdelete(HttpServletRequest request,Model mo) {
		int playernum = Integer.parseInt(request.getParameter("playernum"));
		int step = Integer.parseInt(request.getParameter("step"));
		int pnumber = Integer.parseInt(request.getParameter("pnumber"));
		String teamarea = request.getParameter("teamarea");
		BPlayerService ps = sqlsession.getMapper(BPlayerService.class);
		ps.commentdelete(playernum,step);
		mo.addAttribute("teamarea",teamarea);
		mo.addAttribute("playernum",playernum);
		mo.addAttribute("pnumber",pnumber);
		
		
		return "redirect:/baseballplayerdetail";
	}
	
	@RequestMapping(value = "/baseballcommentupdate")
	public String baseballcommentupdate(HttpServletRequest request,Model mo) {
		int playernum = Integer.parseInt(request.getParameter("playernum"));
		int step = Integer.parseInt(request.getParameter("step"));
		int pnumber = Integer.parseInt(request.getParameter("pnumber"));
		String teamarea = request.getParameter("teamarea");
		String ucomment = request.getParameter("ucomment");
		BPlayerService ps = sqlsession.getMapper(BPlayerService.class);
		ps.commentupdate(playernum,step,ucomment);
		ArrayList<BUcommentDTO> clist = ps.comment(playernum); //PLAYERNUM 선수의 댓글 모두 다 가지고 오기
		mo.addAttribute("teamarea",teamarea);
		mo.addAttribute("playernum",playernum);
		mo.addAttribute("pnumber",pnumber);
		mo.addAttribute("clist", clist);
		
		return "redirect:/baseballplayerdetail";
	}
	
	@RequestMapping(value = "/baseballgoods")
	public String baseballgoods() {
		return "baseballgoods";
	}
	
}
