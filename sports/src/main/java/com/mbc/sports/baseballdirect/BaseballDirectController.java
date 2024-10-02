package com.mbc.sports.baseballdirect;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class BaseballDirectController {
	@Autowired
	SqlSession sqlSession;
	
	private static final Logger logger = LoggerFactory.getLogger(BaseballDirectController.class);
	@RequestMapping(value = "/baseballcalendar", method = RequestMethod.GET)
	public String baseballcalendar(HttpServletRequest request, Model model) {
		String areaname = request.getParameter("name");
		DirectService ds = sqlSession.getMapper(DirectService.class);
		ArrayList <DirectDTO> list = ds.selectPlayerArea(areaname);
		model.addAttribute("player_list", list);
		return "baseballcalendar";
	}

	@RequestMapping(value = "/baseballstrategy", method = RequestMethod.GET)
	public String baseballstrategy(HttpServletRequest request, Model model) {
		String areaname = request.getParameter("name");
		String areaname2 = request.getParameter("area");
		DirectService ds = sqlSession.getMapper(DirectService.class);
		ArrayList <DirectDTO> list = ds.selectPlayerArea(areaname);
		ArrayList <BaseballStrategyDTO> list2 = ds.selectStrategyList(areaname2);
		model.addAttribute("player_list", list);
		model.addAttribute("strategy_list", list2);
		return "baseballstrategy";
	}

	@RequestMapping(value = "/baseballStrategySave", method = RequestMethod.POST)
	public String baseballStrategySave(HttpServletRequest request, Model model) {
		String strategy_name = request.getParameter("strategy_name");//전략 이름
		String calendar_info_val = "baseball";//축구인지 야구인지
		String team = request.getParameter("area_kor");//팀 한글//구단
		String team2 = request.getParameter("area_eng");//팀 영어
		String chked_member_val = request.getParameter("chked_member_val");//전략 이미지 및 x/y 좌표

		DirectService ds = sqlSession.getMapper(DirectService.class);
		ds.baseballStrategySave(strategy_name,calendar_info_val,team,chked_member_val);

		model.addAttribute("name", team2);
		model.addAttribute("area", team);

		return "redirect:/baseballstrategy";
	}
	
	@RequestMapping(value = "/baseballStrategyListFind")
	public String baseballStrategyListFind(HttpServletRequest request, Model model) {
		String name = request.getParameter("name");
		String area = request.getParameter("area");
		int stnum = Integer.parseInt(request.getParameter("stnum"));
		String calendar_info = "baseball";
		
		DirectService ds = sqlSession.getMapper(DirectService.class);
		BaseballStrategyDTO strategy_player_list = ds.strategyListFind(stnum);
		
		ArrayList <DirectDTO> list = ds.selectPlayerArea(name);
		ArrayList <BaseballStrategyDTO> list2 = ds.selectStrategyList(area);
		model.addAttribute("player_list", list);
		model.addAttribute("strategy_list", list2);
		model.addAttribute("strategyPlayerList", strategy_player_list);
		
		return "baseballstrategy";
	}

	@RequestMapping(value = "/baseballStrategyDelete")
	public String baseballStrategyDelete(HttpServletRequest request, Model model) {
		int stnum = Integer.parseInt(request.getParameter("stnum"));
		String name = request.getParameter("name");
		String area = request.getParameter("area");

		DirectService ds = sqlSession.getMapper(DirectService.class);
		ds.baseballStrategyDelete(stnum);

		model.addAttribute("name", name);
		model.addAttribute("area", area);

		return "redirect:/baseballstrategy";
	}

	@RequestMapping(value = "/baseballStrategyUpdate", method = RequestMethod.POST)
	public String baseballStrategyUpdate(HttpServletRequest request, Model model) {
		int stnum = Integer.parseInt(request.getParameter("strategy_stnum"));//전략 번호
		String strategy_name = request.getParameter("strategy_name");//전략 이름
		String team = request.getParameter("area_kor");//팀 한글//구단
		String team2 = request.getParameter("area_eng");//팀 영어
		String chked_member_val = request.getParameter("chked_member_val");//전략 이미지 및 x/y 좌표

		DirectService ds = sqlSession.getMapper(DirectService.class);
		ds.baseballStrategyUpdate(stnum,strategy_name,chked_member_val);

		model.addAttribute("name", team2);
		model.addAttribute("area", team);
		model.addAttribute("stnum", stnum);

		return "redirect:/baseballStrategyListFind";
	}
}