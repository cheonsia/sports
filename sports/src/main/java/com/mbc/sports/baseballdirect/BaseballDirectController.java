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
public class BaseballDirectController{
	@Autowired
	SqlSession sqlSession;
	private static final Logger logger = LoggerFactory.getLogger(BaseballDirectController.class);
	@RequestMapping(value = "/baseballcalendar")
	public String baseballcalendar(HttpServletRequest request, Model model){
		HttpSession hs = request.getSession();
		Boolean login = (boolean)hs.getAttribute("adminlogin");
		String areaname = request.getParameter("name");
		String calendar_info_kor = "야구";
		String calendar_info_eng = "baseball";
		DirectService ds = sqlSession.getMapper(DirectService.class);
		if(login){
			areaname = "ALL";
			ArrayList <DirectDTO> list = ds.selectPlayerAreaAll(calendar_info_kor);
			model.addAttribute("player_list", list);
		}else{
			ArrayList <DirectDTO> list = ds.selectPlayerArea(areaname);
			model.addAttribute("player_list", list);
		}
		ArrayList <DirectDTO> list2 = ds.selectCalendarInfo(areaname, calendar_info_eng);//달력에 저장된 데이터 값 표기
		model.addAttribute("calendar_list", list2);
		return "baseballcalendar";
	}
	@RequestMapping(value = "/baseballCalendarSave", method = RequestMethod.POST)
	public String baseballCalendarSave(HttpServletRequest request, Model model){
		HttpSession hs = request.getSession();
		Boolean login = (boolean)hs.getAttribute("adminlogin");
		String team = request.getParameter("baseball_calendar_team2");//팀 한글
		String team2 = request.getParameter("baseball_calendar_team1");//팀 영어
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
		if(login){
			team = "ALL";
			team2 = "ALL";
		}
		if(traning_date_choose.equals("당일")){
			ds.baseballcalendarsave(team2,traning_select_date1,traning_select_date1,traning_people_select,traning_map_input,chked_traing_val,training_memo_txtarea,calendar_info_val);
		}
		else{
			ds.baseballcalendarsave(team2,traning_select_date2,traning_select_date3,traning_people_select,traning_map_input,chked_traing_val,training_memo_txtarea,calendar_info_val);
		}
		model.addAttribute("name", team2);
		model.addAttribute("area", team);
		return "redirect:/baseballcalendar";
	}
	@RequestMapping(value = "/baseballCalendarMove")
	public String baseballCalendarMove(HttpServletRequest request, Model model){
		HttpSession hs = request.getSession();
		Boolean login = (boolean)hs.getAttribute("adminlogin");
		String areaname = request.getParameter("name");//영어
		String calendar_info_eng = "baseball";
		String startdate = request.getParameter("start");
		DirectService ds = sqlSession.getMapper(DirectService.class);
		if(login){
			areaname = "ALL";
		}
		ArrayList <DirectDTO> list = ds.selectPlayerArea(areaname);
		ArrayList <DirectDTO> list2 = ds.selectCalendarData(areaname, calendar_info_eng, startdate);
		model.addAttribute("player_list", list);
		model.addAttribute("calendar_list", list2);
		model.addAttribute("calendar_data", startdate);
		return "baseballcalendar";
	}
	@RequestMapping(value = "/baseballCalendarGet")
	public String baseballCalendarGet(HttpServletRequest request, Model model){
		HttpSession hs = request.getSession();
	 	Boolean login = (boolean)hs.getAttribute("adminlogin");
		String areaname = request.getParameter("name");
		String areaname2 = request.getParameter("area");
		String calendar_info_kor = "야구";
		String calendar_info_eng = "baseball";
		String startdate = request.getParameter("start");
		int number = Integer.parseInt(request.getParameter("number"));
		DirectService ds = sqlSession.getMapper(DirectService.class);
		if(login){
			areaname = "ALL";
			areaname2 = "ALL";
			ArrayList <DirectDTO> list = ds.selectPlayerAreaAll(calendar_info_kor);
			model.addAttribute("player_list", list);
		}else{
			ArrayList <DirectDTO> list = ds.selectPlayerArea(areaname);
			model.addAttribute("player_list", list);
		}
		ArrayList <DirectDTO> list2 = ds.selectCalendarData(areaname, calendar_info_eng, startdate);
		ArrayList <DirectDTO> list3 = ds.selectCalendarDetail(areaname, calendar_info_eng, number);
		model.addAttribute("calendar_list", list2);
		model.addAttribute("calendar_data", startdate);
		model.addAttribute("calendar_detail", list3);
		return "baseballcalendar";
	}
	@RequestMapping(value = "/baseballCalendarUpdate")
	public String baseballCalendarUpdate(HttpServletRequest request, Model model){
		HttpSession hs = request.getSession();
	 	Boolean login = (boolean)hs.getAttribute("adminlogin");
	 	String team = request.getParameter("baseball_team2");//팀 한글
		String team2 = request.getParameter("baseball_team1");//팀 영어
		String traning_date_choose = request.getParameter("traning_date_choose2");//당일/전지훈련 여부
		String traning_select_date1 = request.getParameter("traning_select_date4");//당일일 때 받아오는 값
		String traning_select_date2 = request.getParameter("traning_select_date5");//전지일 때 받아오는 첫 날 값
		String traning_select_date3 = request.getParameter("traning_select_date6");//전지일 때 받아오는 마지막 날 값
		String traning_people_select = request.getParameter("chked_member_val2");//훈련 참여할 멤버 리스트
		String traning_map_input = request.getParameter("traning_map_input2");//장소
		String training_memo_txtarea = request.getParameter("training_memo_txtarea2");//메모
		String chked_traing_val = request.getParameter("chked_traing_val2");//훈련 일정 리스트
		int trnum = Integer.parseInt(request.getParameter("chked_member_num2"));//
		String startdate = request.getParameter("startdate2");
		String calendar_info_kor = "야구";
		String calendar_info_eng = "baseball";
		DirectService ds = sqlSession.getMapper(DirectService.class);
		if(login){
			team = "ALL";
			team2 = "ALL";
			ArrayList <DirectDTO> list = ds.selectPlayerAreaAll(calendar_info_kor);
			model.addAttribute("player_list", list);
		}else{
			ArrayList <DirectDTO> list = ds.selectPlayerArea(team);
			model.addAttribute("player_list", list);
		}
		if(traning_date_choose.equals("당일")){
			ds.baseballCalendarUpdate(traning_select_date1, traning_select_date1, traning_people_select, traning_map_input, chked_traing_val, training_memo_txtarea, trnum);
		}
		else{
			ds.baseballCalendarUpdate(traning_select_date2, traning_select_date3, traning_people_select, traning_map_input, chked_traing_val, training_memo_txtarea, trnum);
		}
		ArrayList <DirectDTO> list2 = ds.selectCalendarData(team2, calendar_info_eng, startdate);
		ArrayList <DirectDTO> list3 = ds.selectCalendarDetail(team2, calendar_info_eng, trnum);
		model.addAttribute("calendar_list", list2);
		model.addAttribute("calendar_data", startdate);
		model.addAttribute("calendar_detail", list3);
		return "baseballcalendar";
	}
	@RequestMapping(value = "/baseballCalendarDelete")
	public String baseballCalendarDelete(HttpServletRequest request, Model model){
		HttpSession hs = request.getSession();
	 	Boolean login = (boolean)hs.getAttribute("adminlogin");
		String areaname = request.getParameter("name");
		String areaname2 = request.getParameter("area");
		String calendar_info_eng = "baseball";
		String startdate = request.getParameter("start");
		int num = Integer.parseInt(request.getParameter("num"));
		DirectService ds = sqlSession.getMapper(DirectService.class);
		ds.baseballCalendarDelete(num);
		ArrayList <DirectDTO> list = ds.selectPlayerArea(areaname);
		ArrayList <DirectDTO> list2 = ds.selectCalendarData(areaname, calendar_info_eng, startdate);
		model.addAttribute("player_list", list);
		model.addAttribute("calendar_list", list2);
		model.addAttribute("calendar_data", startdate);
		return "baseballcalendar";
	}
	//전략
	@RequestMapping(value = "/baseballstrategy", method = RequestMethod.GET)
	public String baseballstrategy(HttpServletRequest request, Model model){
		HttpSession hs = request.getSession();
		Boolean login = (boolean)hs.getAttribute("adminlogin");
		String areaname = request.getParameter("name");
		String areaname2 = request.getParameter("area");
		String calendar_info_kor = "야구";
		String calendar_info_eng = "baseball";
		DirectService ds = sqlSession.getMapper(DirectService.class);
	 	if(login){
	 		 areaname2 = "ALL";
	 		 ArrayList <DirectDTO> list = ds.selectPlayerAreaAll(calendar_info_kor);
	 		 model.addAttribute("player_list", list);
	 	}else{
	 		 ArrayList <DirectDTO> list = ds.selectPlayerArea(areaname);
	 		 model.addAttribute("player_list", list);
	 	}
		ArrayList <BaseballStrategyDTO> list2 = ds.selectStrategyList(areaname2, calendar_info_eng);
		model.addAttribute("strategy_list", list2);
		return "baseballstrategy";
	}
	@RequestMapping(value = "/baseballStrategySave", method = RequestMethod.POST)
	public String baseballStrategySave(HttpServletRequest request, Model model){
		HttpSession hs = request.getSession();
	 	Boolean login = (boolean)hs.getAttribute("adminlogin");
		String strategy_name = request.getParameter("strategy_name");//전략 이름
		String calendar_info_eng = "baseball";//축구인지 야구인지
		String team = request.getParameter("area_kor");//팀 한글//구단
		String team2 = request.getParameter("area_eng");//팀 영어
	 	if(login){
	 		team = "ALL";
	 		team2 = "ALL";
	 	}
		String chked_member_val = request.getParameter("chked_member_val");//전략 이미지 및 x/y 좌표
		DirectService ds = sqlSession.getMapper(DirectService.class);
		ds.baseballStrategySave(strategy_name, calendar_info_eng, team, chked_member_val);
		model.addAttribute("name", team2);
		model.addAttribute("area", team);
		return "redirect:/baseballstrategy";
	}
	@RequestMapping(value = "/baseballStrategyListFind")
	public String baseballStrategyListFind(HttpServletRequest request, Model model){
		HttpSession hs = request.getSession();
	 	Boolean login = (boolean)hs.getAttribute("adminlogin");
		String name = request.getParameter("name");
		String area = request.getParameter("area");
		int stnum = Integer.parseInt(request.getParameter("stnum"));
		String calendar_info_kor = "야구";
		String calendar_info_eng = "baseball";
		DirectService ds = sqlSession.getMapper(DirectService.class);
		BaseballStrategyDTO strategy_player_list = ds.strategyListFind(stnum);
	 	if(login){
	 		name = "ALL";
	 		area = "ALL";
	 		ArrayList <DirectDTO> list = ds.selectPlayerAreaAll(calendar_info_kor);
	 		model.addAttribute("player_list", list);
	 	}else{
	 		 ArrayList <DirectDTO> list = ds.selectPlayerArea(name);
	 		 model.addAttribute("player_list", list);
	 	}
		ArrayList <BaseballStrategyDTO> list2 = ds.selectStrategyList(area, calendar_info_eng);
		model.addAttribute("strategy_list", list2);
		model.addAttribute("strategyPlayerList", strategy_player_list);
		return "baseballstrategy";
	}

	@RequestMapping(value = "/baseballStrategyDelete")
	public String baseballStrategyDelete(HttpServletRequest request, Model model){
		HttpSession hs = request.getSession();
	 	Boolean login = (boolean)hs.getAttribute("adminlogin");
		int stnum = Integer.parseInt(request.getParameter("stnum"));
		String name = request.getParameter("name");
		String area = request.getParameter("area");
	 	if(login){
	 		name = "ALL";
	 		area = "ALL";
	 	}
		DirectService ds = sqlSession.getMapper(DirectService.class);
		ds.baseballStrategyDelete(stnum);
		model.addAttribute("name", name);
		model.addAttribute("area", area);
		return "redirect:/baseballstrategy";
	}
	@RequestMapping(value = "/baseballStrategyUpdate", method = RequestMethod.POST)
	public String baseballStrategyUpdate(HttpServletRequest request, Model model){
		HttpSession hs = request.getSession();
	 	Boolean login = (boolean)hs.getAttribute("adminlogin");
		int stnum = Integer.parseInt(request.getParameter("strategy_stnum"));//전략 번호
		String strategy_name = request.getParameter("strategy_name");//전략 이름
		String team = request.getParameter("area_kor");//팀 한글//구단
		String team2 = request.getParameter("area_eng");//팀 영어
	 	if(login){
	 		team = "ALL";
	 		team2 = "ALL";
	 	}
		String chked_member_val = request.getParameter("chked_member_val");//전략 이미지 및 x/y 좌표
		DirectService ds = sqlSession.getMapper(DirectService.class);
		ds.baseballStrategyUpdate(stnum,strategy_name,chked_member_val);
		model.addAttribute("name", team2);
		model.addAttribute("area", team);
		model.addAttribute("stnum", stnum);
		return "redirect:/baseballStrategyListFind";
	}
}