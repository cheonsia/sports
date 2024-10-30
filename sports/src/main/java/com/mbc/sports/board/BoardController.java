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
	     model.addAttribute("max",bs.max());
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
	public String detail(HttpServletRequest request, int num, String way , Model model){
		BoardService bs = sqlSession.getMapper(BoardService.class);
		if (way.equals("detail")) {
			bs.clickUp(num);
		    model.addAttribute("cli",bs.comment(num));	
		}
		BoardDTO dto = bs.select(num);
		model.addAttribute("dto",dto);
		return (way.equals("detail")) ? "boardDetail" :(way.equals("delete")) ? "boardDelete" : "boardUpdate";
	}
	@RequestMapping(value="deleteBoard", method = RequestMethod.POST)
	public String delete(int num){
		BoardService bs = sqlSession.getMapper(BoardService.class);
		bs.delete(num);
		bs.commentDelete(num);
		return "redirect:/boardMain";
	}
	@RequestMapping(value="updateBoard", method = RequestMethod.POST)
	public String update(HttpServletRequest request, Model model) {
		int num = Integer.parseInt(request.getParameter("num"));
		String part = request.getParameter("part");
		String writer= request.getParameter("writer");
		String pw= request.getParameter("pw");
		String title= request.getParameter("title");
		String value = request.getParameter("value");
		String check = request.getParameter("checked");
		
		BoardService bs = sqlSession.getMapper(BoardService.class);
		bs.update(num,part,title,writer,pw,value,check);
		bs.commentDelete(num);
		bs.setStep(num,bs.getStep(num));
		model.addAttribute("num", num);
		model.addAttribute("way", "detail");
		return "redirect:/boardSelect";
	}	
	
	//´äº¯
	@RequestMapping(value="answerComplete")
	public String complete(int num){
		BoardService bs = sqlSession.getMapper(BoardService.class);
		bs.statusUpdate(num);
		return "redirect:/boardMain";
	}
	@RequestMapping(value="boardCommentSave", method = RequestMethod.POST)
	public String commentSave(HttpServletRequest request, Model model){
		int num = Integer.parseInt(request.getParameter("num"));
		String writer = request.getParameter("writer");
		String comment = request.getParameter("comment");
		BoardService bs = sqlSession.getMapper(BoardService.class);
		int step =bs.getStep(num)+1;
		bs.answer(num,step,writer,comment);
		bs.setStep(num,step);
		model.addAttribute("num", num);
		model.addAttribute("way", "detail");
		return "redirect:/boardSelect";
	}

	@RequestMapping(value="bcommentdelete")
	public String commentdelete(int num, String way, Model model){
		BoardService bs = sqlSession.getMapper(BoardService.class);
		bs.commentDelete(num);
		bs.setStep(num, 0);
		model.addAttribute("num", num);
		model.addAttribute("way", way);
		return "redirect:/boardSelect";
	}
	@RequestMapping(value="bcommentupdate")
	public String commentupdate(int num, String ucomment, String way, Model model){
		BoardService bs = sqlSession.getMapper(BoardService.class);
		bs.commentUpdate(num, ucomment);
		model.addAttribute("num", num);
		model.addAttribute("way", way);
		return "redirect:/boardSelect";
	}

	@RequestMapping(value="boardSearch",method = RequestMethod.POST)
	public String search(HttpServletRequest request, Model model){
		String option = request.getParameter("option");
		String value = (option.equals("writer")) ? request.getParameter("writer") : (option.equals("part")) ? request.getParameter("part") : request.getParameter("status");
		BoardService bs = sqlSession.getMapper(BoardService.class);
		model.addAttribute("option", option);
		model.addAttribute("value", value);
		model.addAttribute("list", bs.search(option,value));
		return "boardSearch";
	}
	
}

