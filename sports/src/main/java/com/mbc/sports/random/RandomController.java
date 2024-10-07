package com.mbc.sports.random;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RandomController {
	private static final Logger logger = LoggerFactory.getLogger(RandomController.class);
	
	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping(value = "soccer_random")
	public String soccer_random(HttpServletRequest request, Model mo) {
		String name = request.getParameter("name");
		mo.addAttribute("name",name);
		return "soccer_random";
	}
	
	@RequestMapping(value = "baseball_random")
	public String baseball_random(HttpServletRequest request, Model mo) {
		String name = request.getParameter("name");
		mo.addAttribute("name",name);
		return "baseball_random";
	}
	
	@RequestMapping(value = "randomSelectAll")
	public String randomSelectAll(HttpServletRequest request, Model mo) {
		String name = request.getParameter("name");
		RandomService rs = sqlSession.getMapper(RandomService.class);
		ArrayList<PlayerDTO> allList = rs.randomSelectAll();
		mo.addAttribute("allList", allList);
		mo.addAttribute("name",name);
		logger.info("Á¤º¸: " + allList);
		return "redirect:/baseball_random";
	}
}