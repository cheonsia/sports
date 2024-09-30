package com.mbc.sports.soccerdirect;
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
public class SoccerDirectController {
	@Autowired
	SqlSession sqlSession;
	
	private static final Logger logger = LoggerFactory.getLogger(SoccerDirectController.class);
	@RequestMapping(value = "/soccercalendar", method = RequestMethod.GET)
	public String soccercalendar(HttpServletRequest request, Model model) {
		String areaname = request.getParameter("name");
		String areaname2 = request.getParameter("area");
		String calendar_info = "soccer";
		DirectService ds = sqlSession.getMapper(DirectService.class);
		ArrayList <DirectDTO> list = ds.selectCalendarArea(areaname);
		ArrayList <DirectDTO> list2 = ds.selectCalendarInfo(areaname2, calendar_info);//달력에 저장된 데이터 값 표기
		model.addAttribute("player_list", list);
		model.addAttribute("calendar_list", list2);
		return "soccercalendar";
	}

	@RequestMapping(value = "/soccerstrategy", method = RequestMethod.GET)
	public String soccerstrategy(HttpServletRequest request, Model model) {
		String areaname1 = request.getParameter("name");
		String areaname2 = request.getParameter("area");
		return "soccerstrategy";
	}

	@RequestMapping(value = "/soccerCalendarSave", method = RequestMethod.POST)
	public String soccerCalendarSave(HttpServletRequest request, Model model) {
		String team = request.getParameter("soccer_calendar_team2");//팀 한글
		String team2 = request.getParameter("soccer_calendar_team1");//팀 영어
		String traning_date_choose = request.getParameter("traning_date_choose");//당일/전지훈련 여부
		String traning_select_date1 = request.getParameter("traning_select_date1");//당일일 때 받아오는 값
		String traning_select_date2 = request.getParameter("traning_select_date2");//전지일 때 받아오는 첫 날 값
		String traning_select_date3 = request.getParameter("traning_select_date3");//전지일 때 받아오는 마지막 날 값
		String traning_people_select = request.getParameter("chked_member_val");//훈련 참여할 멤버 리스트
		String traning_map_input = request.getParameter("traning_map_input");//장소
		String training_memo_txtarea = request.getParameter("training_memo_txtarea");//메모
		String chked_traing_val = request.getParameter("chked_traing_val");//훈련 일정 리스트
		String calendar_info_val = request.getParameter("calendar_info_val");//축구인지 야구인지

		DirectService ds = sqlSession.getMapper(DirectService.class);
		if(traning_date_choose.equals("당일")) {
			ds.soccercalendarsave(team,traning_select_date1,traning_select_date1,traning_people_select,traning_map_input,chked_traing_val,training_memo_txtarea,calendar_info_val);
		}
		else {
			ds.soccercalendarsave(team,traning_select_date2,traning_select_date3,traning_people_select,traning_map_input,chked_traing_val,training_memo_txtarea,calendar_info_val);
		}

		model.addAttribute("name", team2);
		model.addAttribute("area", team);
		
		return "redirect:/soccercalendar";
	}
}