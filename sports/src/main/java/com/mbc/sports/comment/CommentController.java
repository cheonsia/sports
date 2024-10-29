package com.mbc.sports.comment;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CommentController {
	@Autowired
	SqlSession sqlsession;
	@RequestMapping(value = "/commentsave")
	public String commentsave(HttpServletRequest request,PageDTO page, Model model) {
		String id= request.getParameter("id");
		int playernum = Integer.parseInt(request.getParameter("playernum"));
		String play = request.getParameter("play");
		String writer= request.getParameter("writer");
		String comment = request.getParameter("comment");

		CommentService cs = sqlsession.getMapper(CommentService.class);
		int step= cs.getStep(playernum)+1;
		cs.input(playernum,step,id,writer,comment);
		if(play.equals("축구"))cs.updateSplayerStep(step, playernum);
		else cs.updateBplayerStep(step, playernum) ;
		
		ArrayList<CommentDTO> clist = cs.comment(playernum,page.getStart(),page.getEnd());
		model.addAttribute("clist", clist);
		model.addAttribute("playernum", playernum);
		model.addAttribute("play",play);
		
		return "redirect:/playerdetail";
	}
	
	@RequestMapping(value = "/heart",method = RequestMethod.POST)
	public void heart(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter prw = response.getWriter();

		int playernum = Integer.parseInt(request.getParameter("playernum"));
		String step= request.getParameter("step");
		
		CommentService cs = sqlsession.getMapper(CommentService.class);
		cs.heartUp(playernum,step);
		
		int heart =cs.heart(playernum,step);
		prw.print(heart);
	}

	@RequestMapping(value = "/commentdelete")
	public String commentdelete(HttpServletRequest request, Model model) {
		int playernum = Integer.parseInt(request.getParameter("playernum"));
		int step = Integer.parseInt(request.getParameter("step"));
		String play = request.getParameter("play");
		CommentService cs = sqlsession.getMapper(CommentService.class);
		cs.delete(playernum,step);
		if(play.equals("축구")) {
			cs.updateSplayerStep(cs.getStep(playernum), playernum);			
		}else {			
			cs.updateBplayerStep(cs.getStep(playernum), playernum);
		}
		model.addAttribute("playernum",playernum); 
		model.addAttribute("play",play);
		
		return "redirect:/playerdetail";
	}

	@RequestMapping(value = "/commentupdate")
	public String commentupdate(HttpServletRequest request, PageDTO page, Model model) {
		int playernum = Integer.parseInt(request.getParameter("playernum"));
		int step = Integer.parseInt(request.getParameter("step"));
		String comment = request.getParameter("ucomment");
		String play = request.getParameter("play");
		
		CommentService cs = sqlsession.getMapper(CommentService.class);
		cs.update(playernum,step,comment);
		ArrayList<CommentDTO> clist = cs.comment(playernum, page.getStart(),page.getEnd()); //PLAYERNUM 선수의 댓글 모두 다 가지고 오기

		model.addAttribute("playernum",playernum);
		model.addAttribute("clist", clist);
		model.addAttribute("play",play);

		return "redirect:/playerdetail";
	}
	
}
