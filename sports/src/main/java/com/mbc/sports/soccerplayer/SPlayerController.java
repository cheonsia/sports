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
	
	String splayerpath = "C:\\project\\sports\\sports\\src\\main\\webapp\\image\\soccer\\player";
	String bplayerpath = "C:\\project\\sports\\sports\\src\\main\\webapp\\image\\baseball\\player";
	
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
		if(play.equals("축구")) {
			String main = mul.getParameter("smain");
			ps.playersoccer(stname,pname,pnumber,pbirth,height,weight,main,pimage,pchar,play);	
			mf.transferTo(new File(splayerpath+"\\"+pimage));
		} else {
			String main = mul.getParameter("bmain");
			ps.playerbaseball(btname,pname,pnumber,pbirth,height,weight,main,pimage,pchar,play);
			mf.transferTo(new File(bplayerpath+"\\"+pimage));
		}
		if(play.equals("축구")) {
			return "redirect:/soccermain";
		}else {
			return "redirect:/baseballmain";
		}
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
		SPlayerService ps = sqlsession.getMapper(SPlayerService.class);
		if(tname.equals("ALL")) {
			ArrayList<SPlayerDTO> list = ps.allTeamSelect();
			mo.addAttribute("list", list);
		} else {
			ArrayList<SPlayerDTO> list = ps.selectTeam(tname);
			mo.addAttribute("list", list);
		}		
		return "soccerplayerlist";
	}
	
	@RequestMapping(value = "/soccerdetail")
	public String pdetail(HttpServletRequest request, PageDTO page, Model mo) {
		int playernum = Integer.parseInt(request.getParameter("playernum"));
		SPlayerService ps = sqlsession.getMapper(SPlayerService.class);
		
		String nowPage=request.getParameter("nowPage");
		String cntPerPage=request.getParameter("cntPerPage");
	     
	     //전체레코드수구하기
	     int total=ps.total(playernum);
	     if(nowPage==null && cntPerPage == null) {
	        nowPage="1";
	        cntPerPage="10";
	     }
	     else if(nowPage==null) {
	        nowPage="1";
	     }
	     else if(cntPerPage==null) {
	        cntPerPage="10";
	     }      

	     SPlayerDTO dto = ps.select(playernum);
	     page = new PageDTO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));

	     mo.addAttribute("dto", dto);
	     mo.addAttribute("paging",page);
	     mo.addAttribute("clist",ps.comment(playernum, page.getStart(),page.getEnd()));

		return "soccerplayerdetail";
	}
	
	@RequestMapping(value = "/soccerclickup")
	public String clickup(HttpServletRequest request, Model model) {
		int playernum = Integer.parseInt(request.getParameter("playernum"));
		String tname = request.getParameter("tname");
		SPlayerService ps = sqlsession.getMapper(SPlayerService.class);
		ps.clickup(playernum);
		model.addAttribute("playernum", playernum);
		return "redirect:/soccerdetail";
	}
	
	@RequestMapping(value = "/soccercommentsave")
	public String commentsave(HttpServletRequest request,PageDTO page, Model model) {
		int playernum = Integer.parseInt(request.getParameter("playernum"));
		String id = request.getParameter("id");
		String writer= request.getParameter("writer");
		String comment = request.getParameter("comment");

		SPlayerService ps = sqlsession.getMapper(SPlayerService.class);
		int step= ps.setStep(playernum)+1;
		ps.commentin(playernum,id,writer,comment,step);
		ps.updateset(step, playernum);
		ArrayList<UcommentDTO> clist = ps.comment(playernum,page.getStart(),page.getEnd());
		model.addAttribute("clist", clist);
		model.addAttribute("playernum", playernum);
		
		return "redirect:/soccerdetail";
	}
	
	@RequestMapping(value = "/soccerheart")
	public String heart(HttpServletRequest request, Model model) {
		int playernum = Integer.parseInt(request.getParameter("playernum"));
		String writer= request.getParameter("writer");
		String ucomment = request.getParameter("ucomment");
		SPlayerService ps = sqlsession.getMapper(SPlayerService.class);
		ps.heart(playernum,writer,ucomment);
		model.addAttribute("playernum",playernum);
		
		return "redirect:/soccerdetail";
	}
	
	@RequestMapping(value = "/soccerplayerdelete")
	public String playerdelete(HttpServletRequest request, Model model) {
		int playernum = Integer.parseInt(request.getParameter("playernum"));
		SPlayerService ps = sqlsession.getMapper(SPlayerService.class);
		SPlayerDTO dto = ps.select(playernum);
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
		SPlayerDTO dto = ps.select(playernum);
		model.addAttribute("dto", dto);
		
		return "soccerpupdateview";
	}
	
	@RequestMapping(value = "/soccerupdatesave", method = RequestMethod.POST)
	public String updatesave(MultipartHttpServletRequest mul, Model model) throws IOException {
		int playernum = Integer.parseInt(mul.getParameter("playernum"));
		String play = mul.getParameter("play");
		String tname = mul.getParameter("tname");
		String pname = mul.getParameter("pname");
		int pnumber = Integer.parseInt(mul.getParameter("pnumber"));
		String pbirth = mul.getParameter("pbirth");
		String main = mul.getParameter("main");
		int height = Integer.parseInt(mul.getParameter("height"));
		int weight = Integer.parseInt(mul.getParameter("weight"));
		String pchar = mul.getParameter("pchar");
		String rimage = mul.getParameter("rimage");
		
		MultipartFile mf = mul.getFile("pimage");
		String pimage = mf.getOriginalFilename();
		pimage = filesave(pimage,mf.getBytes());
		mf.transferTo(new File(splayerpath+"\\"+pimage));
		
		System.out.println(play);
		System.out.println(tname);
		System.out.println(pname);
		System.out.println(pnumber);
		System.out.println(playernum);
		System.out.println(pbirth);
		System.out.println(main);
		System.out.println(height);
		System.out.println(weight);
		System.out.println(pchar);
		System.out.println(pimage);
		System.out.println(rimage);

		File f = new File(splayerpath+"\\"+rimage);
		f.delete();
		
		SPlayerService ps = sqlsession.getMapper(SPlayerService.class);
		if(play.equals("축구")) {
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
		SPlayerService ps = sqlsession.getMapper(SPlayerService.class);
		ps.commentdelete(playernum,step);
		ps.updateset(ps.setStep(playernum), playernum);
		
		mo.addAttribute("playernum",playernum);
		return "redirect:/soccerdetail";
	}
	
	@RequestMapping(value = "/soccercommentupdate")
	public String soccercommentupdate(HttpServletRequest request, PageDTO page, Model mo) {
		int playernum = Integer.parseInt(request.getParameter("playernum"));
		int step = Integer.parseInt(request.getParameter("step"));
		String ucomment = request.getParameter("ucomment");
		
		SPlayerService ps = sqlsession.getMapper(SPlayerService.class);
		ps.commentupdate(playernum,step,ucomment);
		ArrayList<UcommentDTO> clist = ps.comment(playernum, page.getStart(),page.getEnd()); //PLAYERNUM 선수의 댓글 모두 다 가지고 오기

		mo.addAttribute("playernum",playernum);
		mo.addAttribute("clist", clist);
		return "redirect:/soccerdetail";
	}
	
	@RequestMapping(value = "/soccergoods")
	public String soccergoods(HttpServletRequest request, Model model) {
		return "soccergoods";
	}
	
}
