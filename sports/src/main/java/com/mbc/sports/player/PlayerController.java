package com.mbc.sports.player;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.UUID;
import javax.servlet.http.HttpServletRequest;
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import com.mbc.sports.comment.CommentService;
import com.mbc.sports.comment.PageDTO;
@Controller
public class PlayerController{
	String splayerpath = "C:\\project\\sports\\sports\\src\\main\\webapp\\image\\soccer\\player";
	String bplayerpath = "C:\\project\\sports\\sports\\src\\main\\webapp\\image\\baseball\\player";
	@Autowired
	SqlSession sqlsession;
	private static final Logger logger = LoggerFactory.getLogger(PlayerController.class);
	@RequestMapping(value = "/playerinput")
	public String playerin(HttpServletRequest request,Model model){
		String play = request.getParameter("play");
		model.addAttribute("play", play);
		return (play.equals("축구")) ? "soccerplayerinput" :"baseballplayerinput";
	}
	@RequestMapping(value = "/playersave", method = RequestMethod.POST)
	public String playersave(MultipartHttpServletRequest mul) throws IllegalStateException, IOException{
		String play = mul.getParameter("play");
		String tname = mul.getParameter("tname");
		String pname = mul.getParameter("pname");
		int pnumber = Integer.parseInt(mul.getParameter("pnumber"));
		String pbirth = mul.getParameter("pbirth");
		int height = Integer.parseInt(mul.getParameter("height"));
		int weight = Integer.parseInt(mul.getParameter("weight"));
		MultipartFile mf = mul.getFile("pimage");
		String pimage = mf.getOriginalFilename();
		pimage = filesave(pimage,mf.getBytes());
		String pchar = mul.getParameter("pchar");
		String main = mul.getParameter("main");
		if(play.equals("축구")){
			SPlayerService sps = sqlsession.getMapper(SPlayerService.class);
			sps.playersoccer(tname,pname,pnumber,pbirth,height,weight,main,pimage,pchar,play);	
			mf.transferTo(new File(splayerpath+"\\"+pimage));
		}else{
			BPlayerService bps = sqlsession.getMapper(BPlayerService.class);
			bps.playerbaseball(tname,pname,pnumber,pbirth,height,weight,main,pimage,pchar,play);
			mf.transferTo(new File(bplayerpath+"\\"+pimage));
		}
		return (play.equals("축구")) ? "redirect:/soccermain" :  "redirect:/baseballmain";
	}
	private String filesave(String pimage, byte[] bytes){
		UUID ud = UUID.randomUUID();
		String pname = ud.toString()+"_"+pimage;
		return pname;
	}
	@RequestMapping(value = "/selectTeam")
	public String selectTeam(HttpServletRequest request, Model mo){
		String tname = request.getParameter("name");
		String play = request.getParameter("play");
		if(play.equals("축구")){
			SPlayerService sps = sqlsession.getMapper(SPlayerService.class);
			ArrayList<PlayerDTO>  list = (tname.equals("ALL")) ? sps.allTeamSelect(): sps.selectTeam(tname);
			mo.addAttribute("list", list);
			return "soccerplayerlist";
		}else{
			BPlayerService bps = sqlsession.getMapper(BPlayerService.class);
			ArrayList<PlayerDTO>  list = (tname.equals("ALL")) ? bps.allTeamSelect(): bps.selectTeam(tname);
			mo.addAttribute("list", list);
			return "baseballplayerlist";
		}
	}
	@RequestMapping(value = "/playerdetail")
	public String detail(HttpServletRequest request, PageDTO page, Model mo){
		int playernum = Integer.parseInt(request.getParameter("playernum"));		
		String play=request.getParameter("play");
		String nowPage=request.getParameter("nowPage");
		String cntPerPage=request.getParameter("cntPerPage");
		CommentService cs = sqlsession.getMapper(CommentService.class);	
	     int total=cs.total(playernum);
	     if(nowPage==null && cntPerPage == null){
	        nowPage="1";
	        cntPerPage="5";
	     }
	     else if(nowPage==null){
	        nowPage="1";
	     }
	     else if(cntPerPage==null){
	        cntPerPage="5";
	     }
	     page = new PageDTO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
	     mo.addAttribute("paging",page);
	     mo.addAttribute("clist",cs.comment(playernum, page.getStart(),page.getEnd()));
	     //전체 레코드 수 구하기
	     if(play.equals("축구")){
	    	 SPlayerService sps = sqlsession.getMapper(SPlayerService.class);
	    	 PlayerDTO dto = sps.select(playernum);
	    	 mo.addAttribute("dto", dto);
	    	 return "soccerplayerdetail";
	    	 
	     }else{
	    	 BPlayerService bps = sqlsession.getMapper(BPlayerService.class);
	    	 PlayerDTO dto = bps.select(playernum);
	    	 mo.addAttribute("dto", dto);
	    	 return "baseballplayerdetail";
	     }
	}
	@RequestMapping(value = "/clickup")
	public String clickup(HttpServletRequest request, Model model){
		int playernum = Integer.parseInt(request.getParameter("playernum"));
		String play= request.getParameter("play");
		if(play.equals("축구")){
			SPlayerService ps = sqlsession.getMapper(SPlayerService.class);
			ps.clickup(playernum);
		}
		else{
			BPlayerService ps = sqlsession.getMapper(BPlayerService.class);
			ps.clickup(playernum);
		}
		model.addAttribute("playernum", playernum);
		model.addAttribute("play", play);
		return "redirect:/playerdetail";
	}
	@RequestMapping(value = "/goplayerdelete")
	public String playerdelete(HttpServletRequest request, Model model){
		int playernum = Integer.parseInt(request.getParameter("playernum"));
		String play = request.getParameter("play");
		if(play.equals("축구")){
			SPlayerService sps = sqlsession.getMapper(SPlayerService.class);
			PlayerDTO dto = sps.select(playernum);
			model.addAttribute("dto", dto);
		}else{
			BPlayerService bps = sqlsession.getMapper(BPlayerService.class);
			PlayerDTO dto = bps.select(playernum);
			model.addAttribute("dto", dto);			
		}
		model.addAttribute("play", play);			
		return (play.equals("축구")) ? "soccerplayerdelete" : "baseballplayerdelete";
	}
	@RequestMapping(value = "/playerdelete")
	public String delete(HttpServletRequest request, Model model){
		int playernum = Integer.parseInt(request.getParameter("playernum"));
		String pimage = request.getParameter("pimage");
		String name = request.getParameter("tname");
		String play = request.getParameter("play");
		if(play.equals("축구")){
			File img = new File(splayerpath+"\\"+pimage);
			img.delete();
			SPlayerService sps = sqlsession.getMapper(SPlayerService.class);
			sps.delete(playernum);
		}
		else{
			File img = new File(bplayerpath+"\\"+pimage);
			img.delete();
			BPlayerService bps = sqlsession.getMapper(BPlayerService.class);
			bps.delete(playernum);			
		}
		model.addAttribute("name", name);
		model.addAttribute("play", play);
		return "redirect:/selectTeam";
	}
	@RequestMapping(value = "/playerupdate")
	public String playerupdate(HttpServletRequest request, Model model){
		int playernum = Integer.parseInt(request.getParameter("playernum"));
		String play = request.getParameter("play");
		if(play.equals("축구")){
			SPlayerService sps = sqlsession.getMapper(SPlayerService.class);
			PlayerDTO dto = sps.select(playernum);
			model.addAttribute("dto", dto);
			return "soccerplayerupdate";
		}else{
			BPlayerService bps = sqlsession.getMapper(BPlayerService.class);
			PlayerDTO dto = bps.select(playernum);
			model.addAttribute("dto", dto);			
			return "baseballplayerupdate";
		}		
	}
	@RequestMapping(value = "/updatesave", method = RequestMethod.POST)
	public String updatesave(MultipartHttpServletRequest mul, Model model) throws IOException{
		int playernum = Integer.parseInt(mul.getParameter("playernum"));
		String tname = mul.getParameter("tname");
		String pname = mul.getParameter("pname");
		int pnumber = Integer.parseInt(mul.getParameter("pnumber"));
		String pbirth = mul.getParameter("pbirth");
		String main = mul.getParameter("main");
		int height = Integer.parseInt(mul.getParameter("height"));
		int weight = Integer.parseInt(mul.getParameter("weight"));
		String pchar = mul.getParameter("pchar");
		String rimage = mul.getParameter("rimage");
		String play = mul.getParameter("play");
		MultipartFile mf = mul.getFile("pimage");
		String pimage = mf.getOriginalFilename();
		pimage = (pimage.equals("")) ? rimage : filesave(pimage,mf.getBytes());
		if(play.equals("축구")){
			SPlayerService sps = sqlsession.getMapper(SPlayerService.class);
			sps.update(tname,pname,pnumber,pbirth,height,weight,main,pimage,pchar,playernum);			
			if(!pimage.equals(rimage)){
				mf.transferTo(new File(splayerpath+"\\"+pimage));
				File f = new File(splayerpath+"\\"+rimage);
				f.delete();
			}
		}
		else{
			BPlayerService bps = sqlsession.getMapper(BPlayerService.class);
			bps.update(tname,pname,pnumber,pbirth,height,weight,main,pimage,pchar,playernum);						
			if(!pimage.equals(rimage)){
				mf.transferTo(new File(bplayerpath+"\\"+pimage));
				File f = new File(bplayerpath+"\\"+rimage);
				f.delete();
			}
		}
		model.addAttribute("name", tname);
		model.addAttribute("play", play);
		return "redirect:/selectTeam";
	}
	//축구
	@RequestMapping(value = "/soccerplayerlist")
	public String playerlist(){      
		return "soccerplayerlist";
	}
	@RequestMapping(value = "/soccergoods")
	public String soccergoods(HttpServletRequest request, Model model){
		return "soccergoods";
	}
	//야구
	@RequestMapping(value = "/baseballplayerinput")
	public String baseballplayerinput(){
		return "baseballplayerinput";
	}

	@RequestMapping(value = "/baseballplayerlist")
	   public String baseballplayerlist(){      
	      return "baseballplayerlist";
	}
	@RequestMapping(value = "/baseballgoods")
	public String baseballgoods(){
		return "baseballgoods";
	}
	@RequestMapping(value = "/Ssearchlist")
	public String Ssearchlist(HttpServletRequest request, Model model){
		String name = request.getParameter("name");
		if(name.equals("ALL") || name.equals("")) name = "ALL";
		String sports = request.getParameter("sports");
		String category = request.getParameter("searchcategory");//포지션
		String npath = "soccerplayerlist";
		SPlayerService sp = sqlsession.getMapper(SPlayerService.class);
		BPlayerService bp = sqlsession.getMapper(BPlayerService.class);
		
		model.addAttribute("category",category);

		if(category.equals("포지션")) {
			String posival = request.getParameter("posival");//라디오
			model.addAttribute("posival",posival);
			if(sports.equals("축구")){
				if(name.equals("ALL")) {
					model.addAttribute("list",sp.smain(posival));					
				}else {
					model.addAttribute("list",sp.smainarea(posival,name));
				}
			}else {
				npath = "baseballplayerlist";
				if(name.equals("ALL")) {
					model.addAttribute("list", bp.bmain(posival));
				}else {
					model.addAttribute("list", bp.bmainarea(posival,name));
				}
			}
		}else { //선수명
			String value = request.getParameter("searchval");//검색어
			model.addAttribute("vocavalue",value);
			if(sports.equals("축구")){
				if(name.equals("ALL")) {
					model.addAttribute("list",sp.spname(value));					
				}else {
					model.addAttribute("list",sp.spnamearea(value,name));
				}
			}else {
				npath = "baseballplayerlist";
				if(name.equals("ALL")) {
					model.addAttribute("list",bp.bpname(value));					
				}else {
					model.addAttribute("list",bp.bpnamearea(value,name));
				}				
			}
		}
		return npath;
	}
}