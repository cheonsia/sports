package com.mbc.sports.board;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class BoardController {
	@Autowired
	SqlSession SqlSession;
	
	@RequestMapping(value="boardMain")
	public String main(Model model) {
		BoardService bs = SqlSession.getMapper(BoardService.class);
		ArrayList<BoardDTO> list = bs.out();
		model.addAttribute("list",list);
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
		BoardService bs = SqlSession.getMapper(BoardService.class);
		bs.insert(part,writer,pw,title,value);
		return "redirect:/boardMain";
	}
}
