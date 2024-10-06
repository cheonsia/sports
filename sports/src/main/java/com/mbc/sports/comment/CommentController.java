package com.mbc.sports.comment;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CommentController {
	@Autowired
	SqlSession sqlsession;
	@RequestMapping(value = "/commentsave")
	public String commentsave(HttpServletRequest request,PageDTO page, Model model) {
		int playernum = Integer.parseInt(request.getParameter("playernum"));
		String play = request.getParameter("play");
		String writer= request.getParameter("writer");
		String comment = request.getParameter("comment");

		CommentService cs = sqlsession.getMapper(CommentService.class);
		int step= cs.getStep(playernum)+1;
		cs.input(playernum,writer,comment,step);
		cs.updatePlayerStep(step, playernum);
		
		ArrayList<CommentDTO> clist = cs.comment(playernum,page.getStart(),page.getEnd());
		model.addAttribute("clist", clist);
		model.addAttribute("playernum", playernum);
		
		return (play.equals("축구")) ? "redirect:/soccerdetail" : "redirect:/baseballdetail";
	}
	
	@RequestMapping(value = "/heart")
	public String heart(HttpServletRequest request, Model model) {
		int playernum = Integer.parseInt(request.getParameter("playernum"));
		String play= request.getParameter("play");
		String writer= request.getParameter("writer");
		String comment = request.getParameter("comment");
		CommentService cs = sqlsession.getMapper(CommentService.class);
		cs.heart(playernum,writer,comment);
		model.addAttribute("playernum",playernum);
		
		return (play.equals("축구")) ? "redirect:/soccerdetail" : "redirect:/baseballdetail";
	}
	

	@RequestMapping(value = "/commentdelete")
	public String commentdelete(HttpServletRequest request, Model mo) {
		int playernum = Integer.parseInt(request.getParameter("playernum"));
		int step = Integer.parseInt(request.getParameter("step"));
		String play = request.getParameter("play");
		CommentService cs = sqlsession.getMapper(CommentService.class);
		cs.delete(playernum,step);
		mo.addAttribute("playernum",playernum);
		
		return (play.equals("축구")) ? "redirect:/soccerplayerdetail" : "redirect:/baseballplayerdetail";
	}

	@RequestMapping(value = "/commentupdate")
	public String commentupdate(HttpServletRequest request, PageDTO page, Model mo) {
		int playernum = Integer.parseInt(request.getParameter("playernum"));
		int step = Integer.parseInt(request.getParameter("step"));
		String comment = request.getParameter("comment");
		String play = request.getParameter("play");
		
		CommentService cs = sqlsession.getMapper(CommentService.class);
		cs.update(playernum,step,comment);
		ArrayList<CommentDTO> clist = cs.comment(playernum, page.getStart(),page.getEnd()); //PLAYERNUM 선수의 댓글 모두 다 가지고 오기

		mo.addAttribute("playernum",playernum);
		mo.addAttribute("clist", clist);

		return (play.equals("축구")) ? "redirect:/soccerplayerdetail" : "redirect:/baseballplayerdetail";
	}
}
