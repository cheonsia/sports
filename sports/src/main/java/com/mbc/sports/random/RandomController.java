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
	
	@RequestMapping(value = "soccerRandom")
	public String soccerRandom(HttpServletRequest request, Model mo) {
		String name = request.getParameter("name");
		mo.addAttribute("name",name);
		return "soccerRandom";
	}
	
	@RequestMapping(value = "baseballRandom")
	public String baseballRandom(HttpServletRequest request, Model mo) {
		String name = request.getParameter("name");
		mo.addAttribute("name", name);
		return "baseballRandom";
	}
	
	
	@RequestMapping(value = "randomResult")
	public String randomResult(HttpServletRequest request, Model mo) {
		String name = request.getParameter("name");
		mo.addAttribute("name", name);
		return "randomResult";
	}
	
	@RequestMapping(value = "randomSelectAll")
	public String randomSelectAll(HttpServletRequest request, Model mo) {
		String name = "ALL";
		RandomService rs = sqlSession.getMapper(RandomService.class);
		ArrayList<PlayerDTO> randomList = rs.randomSelectAll();
		mo.addAttribute("randomList", randomList);
		mo.addAttribute("name", name);
		return "randomResult";
	}
	
	@RequestMapping(value = "randomSelectBoth")
	public String randomSelectBoth(HttpServletRequest request, Model mo) {
		String name = "ALL";
		String tname = request.getParameter("team");
		String main = request.getParameter("position");
		RandomService rs = sqlSession.getMapper(RandomService.class);
		ArrayList<PlayerDTO> randomList = rs.randomSelectBoth(tname,main);
		mo.addAttribute("randomList", randomList);
		mo.addAttribute("name", name);
		return "randomResult";
	}

	@RequestMapping(value = "randomSelectTeam")
	public String randomSelectTeam(HttpServletRequest request, Model mo) {
		String name = "ALL";
		String tname = request.getParameter("team");
		RandomService rs = sqlSession.getMapper(RandomService.class);
		ArrayList<PlayerDTO> randomList = rs.randomSelectTeam(tname);
		mo.addAttribute("randomList", randomList);
		mo.addAttribute("name", name);
		return "randomResult";
	}

	@RequestMapping(value = "randomSelectPosition")
	public String randomSelectPosition(HttpServletRequest request, Model mo) {
		String name = "ALL";
		String main = request.getParameter("position");
		RandomService rs = sqlSession.getMapper(RandomService.class);
		ArrayList<PlayerDTO> randomList = rs.randomSelectPosition(main);
		mo.addAttribute("randomList", randomList);
		mo.addAttribute("name", name);
		return "randomResult";
	}
}