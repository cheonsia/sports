package com.mbc.sports.board;

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

import com.mbc.sports.comment.CommentService;
import com.mbc.sports.comment.PageDTO;

@Controller
public class BoardController {
	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping(value="boardMain")
	public String main(HttpServletRequest request, PageDTO page, Model model) {
		BoardService bs = sqlSession.getMapper(BoardService.class);
		CommentService cs = sqlSession.getMapper(CommentService.class);	

		String nowPage=request.getParameter("nowPage");
		String cntPerPage=request.getParameter("cntPerPage");

	     int total=bs.total();
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
	     page = new PageDTO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
	     model.addAttribute("paging",page);
	     model.addAttribute("list",bs.out(page.getStart(),page.getEnd()));
	     return "boardMain";
	}
	@RequestMapping(value="boardInput")
	public String input() {
		return "boardInput";
	}
	@RequestMapping(value="boardSave", method = RequestMethod.POST)
	public String save(HttpServletRequest request) {
		String part = request.getParameter("part");
		String writer= request.getParameter("writer");
		String pw= request.getParameter("pw");
		String title= request.getParameter("title");
		String value = request.getParameter("value");
		String check = request.getParameter("checked");
		BoardService bs = sqlSession.getMapper(BoardService.class);
		bs.insert(part,title,writer,pw,value,check);
		return "redirect:/boardMain";
	}
	
	@RequestMapping(value="boardPwCheck", method = RequestMethod.POST)
	public void pwCheck(int num, String pw, HttpServletResponse response) throws IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter prw = response.getWriter();
		BoardService bs = sqlSession.getMapper(BoardService.class);	
		int result = bs.pwCheck(num,pw);
		prw.print(result);
	}
	
	@RequestMapping(value="boardSelect")
	public String detail(int num, String way , Model model){
		BoardService bs = sqlSession.getMapper(BoardService.class);
		if (way.equals("detail")) { bs.clickUp(num); }
		BoardDTO dto = bs.select(num);
		model.addAttribute("dto",dto);
		System.out.println(way);
		return (way.equals("detail")) ? "boardDetail" :(way.equals("delete")) ? "boardDelete" : "boardUpdate";
	}
}
