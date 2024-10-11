package com.mbc.sports.game;

import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mbc.sports.HomeController;

@Controller
public class GameController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	SqlSession sqlsession;
	
	@RequestMapping(value = "/soccer_highlight")
	public String soccer_highlight(HttpServletRequest request, Model mo) {
		String name = request.getParameter("name");
		return "soccer_highlight";
	}
	
	@RequestMapping(value = "/baseball_highlight")
	public String baseball_highlight(HttpServletRequest request, Model mo) {
		String name = request.getParameter("name");
		mo.addAttribute("name",name);
		return "baseball_highlight";
	}
	
	@RequestMapping(value = "/soccer_schedule")
	public String soccer_schedule(HttpServletRequest request, Model mo) {
		GameService gs = sqlsession.getMapper(GameService.class);
		ArrayList<GameDTO> list = gs.gameselect();
		mo.addAttribute("list", list);
		return "soccer_schedule";
	}
	
	@RequestMapping(value = "/baseball_schedule")
	public String baseball_schedule(HttpServletRequest request, Model mo) {
		GameService gs = sqlsession.getMapper(GameService.class);
		ArrayList<GameDTO> list = gs.Bgameselect();
		mo.addAttribute("list", list);
		return "baseball_schedule";
	}
	
	@RequestMapping(value = "/soccer_schedule_date")
	public String soccer_schedule_date(HttpServletRequest request, Model mo) {
		String date = request.getParameter("date");
		GameService gs = sqlsession.getMapper(GameService.class);
		ArrayList<GameDTO> datelist = gs.gameselectdate(date);
		mo.addAttribute("datelist", datelist);
		ArrayList<GameDTO> list = gs.gameselect();
		mo.addAttribute("list", list);
		mo.addAttribute("date", date);
		return "soccer_schedule";
		
	}
	
	@RequestMapping(value = "/baseball_schedule_date")
	public String baseball_schedule_date(HttpServletRequest request, Model mo) {
		String date = request.getParameter("date");
		GameService gs = sqlsession.getMapper(GameService.class);
		ArrayList<GameDTO> datelist = gs.Bgameselectdate(date);
		mo.addAttribute("datelist", datelist);
		ArrayList<GameDTO> list = gs.Bgameselect();
		mo.addAttribute("list", list);
		mo.addAttribute("date", date);
		return "baseball_schedule";
		
	}
	
	@RequestMapping(value = "/soccerGameSchedule")
	public String soccerGameSchdule(HttpServletRequest request, Model mo) {
		String team1 = request.getParameter("team1");
		String team2 = request.getParameter("team2");
		String date = request.getParameter("gameDate");
		String time = request.getParameter("gameTime");
		String place = request.getParameter("gamePlace");
		GameService gs = sqlsession.getMapper(GameService.class);
		gs.gameinsert(team1,team2,date,time,place);
		
		return "redirect:/soccer_schedule";
	}
	
	@RequestMapping(value = "/baseballGameSchedule")
	public String baseballGameSchedule(HttpServletRequest request, Model mo) {
		String team1 = request.getParameter("team1");
		String team2 = request.getParameter("team2");
		String date = request.getParameter("gameDate");
		String time = request.getParameter("gameTime");
		String place = request.getParameter("gamePlace");
		GameService gs = sqlsession.getMapper(GameService.class);
		gs.Bgameinsert(team1,team2,date,time,place);
		
		return "redirect:/baseball_schedule";
	}
	
	@RequestMapping(value = "/soccer_gameinfo")
	public String soccer_gameinfo(HttpServletRequest request, Model mo) {
		GameService gs = sqlsession.getMapper(GameService.class);
		ArrayList<GameDTO> list = gs.gameselect();
		mo.addAttribute("list", list);
		return "soccer_gameinfo";
	}
	
	@RequestMapping(value = "/baseball_gameinfo")
	public String baseball_gameinfo(HttpServletRequest request, Model mo) {
		GameService gs = sqlsession.getMapper(GameService.class);
		ArrayList<GameDTO> list = gs.Bgameselect();
		mo.addAttribute("list", list);
		return "baseball_gameinfo";
	}
	
	@RequestMapping(value = "/soccer_gamedelete")
	public String soccer_gamedelete(HttpServletRequest request, Model mo) {
		int gamenum = Integer.parseInt(request.getParameter("gamenum"));
		GameService gs = sqlsession.getMapper(GameService.class);
		GameDTO dto = gs.select(gamenum);
		mo.addAttribute("dto", dto);
		return "soccer_gamedelete";
	}
	
	@RequestMapping(value = "/baseball_gamedelete")
	public String baseball_gamedelete(HttpServletRequest request, Model mo) {
		int gamenum = Integer.parseInt(request.getParameter("gamenum"));
		GameService gs = sqlsession.getMapper(GameService.class);
		GameDTO dto = gs.Bselect(gamenum);
		mo.addAttribute("dto", dto);
		return "soccer_gamedelete";
	}
	
	@RequestMapping(value = "/soccergamedelete")
	public String soccerdelete(HttpServletRequest request, Model mo) {
		int gamenum = Integer.parseInt(request.getParameter("gamenum"));
		GameService gs = sqlsession.getMapper(GameService.class);
		gs.delete(gamenum);
		return "redirect:/soccer_gameinfo";
	}
	
	@RequestMapping(value = "/baseballgamedelete")
	public String baseballgamedelete(HttpServletRequest request, Model mo) {
		int gamenum = Integer.parseInt(request.getParameter("gamenum"));
		GameService gs = sqlsession.getMapper(GameService.class);
		gs.Bdelete(gamenum);
		return "redirect:/baseball_gameinfo";
	}
	
	@RequestMapping(value = "/soccer_gameupdate")
	public String soccer_gameupdate(HttpServletRequest request, Model mo) {
		int gamenum = Integer.parseInt(request.getParameter("gamenum"));
		GameService gs = sqlsession.getMapper(GameService.class);
		GameDTO dto = gs.select(gamenum);
		mo.addAttribute("dto", dto);
		return "soccer_gameupdate";
	}
	
	@RequestMapping(value = "/baseball_gameupdate")
	public String baseball_gameupdate(HttpServletRequest request, Model mo) {
		int gamenum = Integer.parseInt(request.getParameter("gamenum"));
		GameService gs = sqlsession.getMapper(GameService.class);
		GameDTO dto = gs.Bselect(gamenum);
		mo.addAttribute("dto", dto);
		return "baseball_gameupdate";
	}
	
	@RequestMapping(value = "/soccerGameUpdate")
	public String soccerGameUpdate(HttpServletRequest request, Model mo) {
		int gamenum = Integer.parseInt(request.getParameter("gamenum"));
		String team1 = request.getParameter("team1");
		String team2 = request.getParameter("team2");
		String gamedate = request.getParameter("gameDate");
		String gametime = request.getParameter("gameTime");
		String gameplace = request.getParameter("gamePlace");
		GameService gs = sqlsession.getMapper(GameService.class);
		gs.update(team1,team2,gamedate,gametime,gameplace,gamenum);
		return "redirect:/soccer_gameinfo";
	}
	
	@RequestMapping(value = "/baseballGameUpdate")
	public String baseballGameUpdate(HttpServletRequest request, Model mo) {
		int gamenum = Integer.parseInt(request.getParameter("gamenum"));
		String team1 = request.getParameter("team1");
		String team2 = request.getParameter("team2");
		String gamedate = request.getParameter("gameDate");
		String gametime = request.getParameter("gameTime");
		String gameplace = request.getParameter("gamePlace");
		GameService gs = sqlsession.getMapper(GameService.class);
		gs.Bupdate(team1,team2,gamedate,gametime,gameplace,gamenum);
		return "redirect:/baseball_gameinfo";
	}
}
