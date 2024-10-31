package com.mbc.sports.soccerdirect;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
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
public class SoccerDirectController{
	@Autowired
	SqlSession sqlSession;
	private static final Logger logger = LoggerFactory.getLogger(SoccerDirectController.class);
	@RequestMapping(value = "/soccercalendar")
	public String soccercalendar(HttpServletRequest request, Model model){
		HttpSession hs = request.getSession();
		Boolean login = (boolean)hs.getAttribute("adminlogin");
		String areaname = request.getParameter("name");
		String areaname2 = request.getParameter("area");
		String calendar_info_kor = "축구";
		String calendar_info_eng = "soccer";
		DirectService ds = sqlSession.getMapper(DirectService.class);
		if(login){
			areaname2 = "ALL";
			ArrayList <DirectDTO> list = ds.selectCalendarAreaAll(calendar_info_kor);
			model.addAttribute("player_list", list);
		}else{
			ArrayList <DirectDTO> list = ds.selectCalendarArea(areaname);
			model.addAttribute("player_list", list);
		}
		ArrayList <DirectDTO> list2 = ds.selectCalendarInfo(areaname2, calendar_info_eng);//달력에 저장된 데이터 값 표기
		model.addAttribute("calendar_list", list2);
		return "soccercalendar";
	}
	@RequestMapping(value = "/soccerCalendarSave", method = RequestMethod.POST)
	public String soccerCalendarSave(HttpServletRequest request, Model model){
		HttpSession hs = request.getSession();
		Boolean login = (boolean)hs.getAttribute("adminlogin");
		String team = request.getParameter("soccer_calendar_team");//팀 한글
		String teamEng = null;
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
		}
		if(traning_date_choose.equals("당일")){
			ds.soccercalendarsave(team,traning_select_date1,traning_select_date1,traning_people_select,traning_map_input,chked_traing_val,training_memo_txtarea,calendar_info_val);
		}
		else{
			ds.soccercalendarsave(team,traning_select_date2,traning_select_date3,traning_people_select,traning_map_input,chked_traing_val,training_memo_txtarea,calendar_info_val);
		}
		teamEng = (team.equals("강원")) ? "kangwon" : (team.equals("광주")) ? "gwangju" : (team.equals("김천")) ? "gimcheon" : (team.equals("대구")) ? "daegu" : (team.equals("대전")) ? "daejeon" : (team.equals("서울")) ? "seoul" : (team.equals("수원")) ? "suwon" : (team.equals("울산")) ? "ulsan" : (team.equals("전북")) ? "jeonbuk" : (team.equals("제주")) ? "jeju" : (team.equals("포항")) ? "pohang" : "ALL";
		model.addAttribute("name", teamEng);
		model.addAttribute("area", team);
		return "redirect:/soccercalendar";
	}
	@RequestMapping(value = "/soccerCalendarMove")
	public String soccerCalendarMove(HttpServletRequest request, Model model){
		HttpSession hs = request.getSession();
		Boolean login = (boolean)hs.getAttribute("adminlogin");
		String areaname = request.getParameter("name");//영어
		String areaname2 = request.getParameter("area");//한글
		String calendar_info_eng = "soccer";
		String startdate = request.getParameter("start");
		DirectService ds = sqlSession.getMapper(DirectService.class);
		if(login){
			areaname = "ALL";
			areaname2 = "ALL";
		}
		ArrayList <DirectDTO> list = ds.selectCalendarArea(areaname);
		ArrayList <DirectDTO> list2 = ds.selectCalendarData(areaname2, calendar_info_eng, startdate);
		model.addAttribute("player_list", list);
		model.addAttribute("calendar_list", list2);
		model.addAttribute("calendar_data", startdate);
		return "soccercalendar";
	}
	@RequestMapping(value = "/soccerCalendarGet")
	public String soccerCalendarGet(HttpServletRequest request, Model model){
		HttpSession hs = request.getSession();
		Boolean login = (boolean)hs.getAttribute("adminlogin");
		String areaname = request.getParameter("name");
		String areaname2 = request.getParameter("area");
		String calendar_info_kor = "축구";
		String calendar_info_eng = "soccer";
		String startdate = request.getParameter("start");
		int number = Integer.parseInt(request.getParameter("number"));
		DirectService ds = sqlSession.getMapper(DirectService.class);
		if(login){
			areaname2 = "ALL";
			ArrayList <DirectDTO> list = ds.selectCalendarAreaAll(calendar_info_kor);
			model.addAttribute("player_list", list);
		}else{
			ArrayList <DirectDTO> list = ds.selectCalendarArea(areaname);
			model.addAttribute("player_list", list);
		}
		ArrayList <DirectDTO> list2 = ds.selectCalendarData(areaname2, calendar_info_eng, startdate);
		ArrayList <DirectDTO> list3 = ds.selectCalendarDetail(areaname2, calendar_info_eng, number);
		model.addAttribute("calendar_list", list2);
		model.addAttribute("calendar_data", startdate);
		model.addAttribute("calendar_detail", list3);
		return "soccercalendar";
	}
	@RequestMapping(value = "/soccerCalendarUpdate")
	public String soccerCalendarUpdate(HttpServletRequest request, Model model){
		HttpSession hs = request.getSession();
		Boolean login = (boolean)hs.getAttribute("adminlogin");
		String team = request.getParameter("soccer_team2");//팀 한글
		String team2 = request.getParameter("soccer_team1");//팀 영어
		team2 = (team.equals("강원")) ? "kangwon" : (team.equals("광주")) ? "gwangju" : (team.equals("김천")) ? "gimcheon" : (team.equals("대구")) ? "daegu" : (team.equals("대전")) ? "daejeon" : (team.equals("서울")) ? "seoul" : (team.equals("수원")) ? "suwon" : (team.equals("울산")) ? "ulsan" : (team.equals("전북")) ? "jeonbuk" : (team.equals("제주")) ? "jeju" : (team.equals("포항")) ? "pohang" : "ALL";
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
		String calendar_info_kor = "축구";
		String calendar_info_eng = "soccer";
		DirectService ds = sqlSession.getMapper(DirectService.class);
		if(login){
			team = "ALL";
			team2 = "ALL";
			ArrayList <DirectDTO> list = ds.selectCalendarAreaAll(calendar_info_kor);
			model.addAttribute("player_list", list);
		}else{
			ArrayList <DirectDTO> list = ds.selectCalendarArea(team2);
			model.addAttribute("player_list", list);
		}
		if(traning_date_choose.equals("당일")){
			ds.soccerCalendarUpdate(traning_select_date1,traning_select_date1,traning_people_select,traning_map_input,chked_traing_val,training_memo_txtarea,trnum);
		}
		else{
			ds.soccerCalendarUpdate(traning_select_date2,traning_select_date3,traning_people_select,traning_map_input,chked_traing_val,training_memo_txtarea,trnum);
		}
		ArrayList <DirectDTO> list2 = ds.selectCalendarData(team, calendar_info_eng, startdate);
		ArrayList <DirectDTO> list3 = ds.selectCalendarDetail(team, calendar_info_eng, trnum);
		model.addAttribute("calendar_list", list2);
		model.addAttribute("calendar_data", startdate);
		model.addAttribute("calendar_detail", list3);
		return "soccercalendar";
	}
	@RequestMapping(value = "/soccerCalendarDelete")
	public String soccerCalendarDelete(HttpServletRequest request, Model model){
		HttpSession hs = request.getSession();
		Boolean login = (boolean)hs.getAttribute("adminlogin");
		String areaname = request.getParameter("name");
		String areaname2 = request.getParameter("area");
		String calendar_info_eng = "soccer";
		String startdate = request.getParameter("start");
		int num = Integer.parseInt(request.getParameter("num"));
		DirectService ds = sqlSession.getMapper(DirectService.class);
		if(login){
			areaname = "ALL";
			areaname2 = "ALL";
		}
		ds.soccerCalendarDelete(num);
		ArrayList <DirectDTO> list = ds.selectCalendarArea(areaname);
		ArrayList <DirectDTO> list2 = ds.selectCalendarData(areaname2, calendar_info_eng, startdate);
		model.addAttribute("player_list", list);
		model.addAttribute("calendar_list", list2);
		model.addAttribute("calendar_data", startdate);
		return "soccercalendar";
	}
	//전략페이지
	@RequestMapping(value = "/soccerstrategy")
	public String soccerstrategy(HttpServletRequest request, Model model){
		HttpSession hs = request.getSession();
		Boolean login = (boolean)hs.getAttribute("adminlogin");
		String areaname1 = request.getParameter("name");//영어
		String areaname2 = request.getParameter("area");//한글
		String calendar_info_kor = "축구";
		String calendar_info_eng = "soccer";
		DirectService ds = sqlSession.getMapper(DirectService.class);
		if(login){
			areaname2 = "ALL";
			ArrayList <DirectDTO> list = ds.selectCalendarAreaAll(calendar_info_kor);
			model.addAttribute("player_list", list);
		}else{
			ArrayList <DirectDTO> list = ds.selectCalendarArea(areaname1);
			model.addAttribute("player_list", list);
		}
		ArrayList <SoccerStrategyDTO> list2 = ds.selectStrategyList(areaname2, calendar_info_eng);
		model.addAttribute("strategy_list", list2);
		return "soccerstrategy";
	}
	@RequestMapping(value = "/soccerStrategySave", method = RequestMethod.POST)
	public String soccerStrategySave(HttpServletRequest request, Model model){
		HttpSession hs = request.getSession();
	 	Boolean login = (boolean)hs.getAttribute("adminlogin");
		String strategy_name = request.getParameter("strategy_name");//전략 이름
		String calendar_info_eng = "soccer";//축구인지 야구인지
		String team = request.getParameter("area_kor");//팀 한글//구단
		String team2 = request.getParameter("area_eng");//팀 영어
		team2 = (team.equals("강원")) ? "kangwon" : (team.equals("광주")) ? "gwangju" : (team.equals("김천")) ? "gimcheon" : (team.equals("대구")) ? "daegu" : (team.equals("대전")) ? "daejeon" : (team.equals("서울")) ? "seoul" : (team.equals("수원")) ? "suwon" : (team.equals("울산")) ? "ulsan" : (team.equals("전북")) ? "jeonbuk" : (team.equals("제주")) ? "jeju" : (team.equals("포항")) ? "pohang" : "ALL";
	 	if(login){
	 		team = "ALL";
	 		team2 = "ALL";
	 	}
		String chked_member_val = request.getParameter("chked_member_val");//전략 이미지 및 x/y 좌표
		DirectService ds = sqlSession.getMapper(DirectService.class);
		ds.soccerstrategysave(strategy_name, calendar_info_eng, team, chked_member_val);
		model.addAttribute("name", team2);
		model.addAttribute("area", team);
		logger.info("지역: "+team);
		return "redirect:/soccerstrategy";
	}
	@RequestMapping(value = "/strategyListFind")
	public String strategyListFind(HttpServletRequest request, Model model){
		HttpSession hs = request.getSession();
		Boolean login = (boolean)hs.getAttribute("adminlogin");
		String name = request.getParameter("name");
		String area = request.getParameter("area");
		int stnum = Integer.parseInt(request.getParameter("stnum"));
		String calendar_info_kor = "축구";
		String calendar_info_eng = "soccer";
		DirectService ds = sqlSession.getMapper(DirectService.class);
		if(login){
			name = "ALL";
			area = "ALL";
			ArrayList <DirectDTO> list = ds.selectCalendarAreaAll(calendar_info_kor);
			model.addAttribute("player_list", list);
		}else{
			ArrayList <DirectDTO> list = ds.selectCalendarArea(name);
			model.addAttribute("player_list", list);
		}
		SoccerStrategyDTO strategy_player_list = ds.strategylistfind(stnum);
		ArrayList <SoccerStrategyDTO> list2 = ds.selectStrategyList(area,calendar_info_eng);
		model.addAttribute("strategy_list", list2);
		model.addAttribute("strategyPlayerList", strategy_player_list);
		return "soccerstrategy";
	}
	@RequestMapping(value = "/soccerStrategyDelete")
	public String soccerStrategyDelete(HttpServletRequest request, Model model){
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
		ds.soccerStrategyDelete(stnum);
		model.addAttribute("name", name);
		model.addAttribute("area", area);
		return "redirect:/soccerstrategy";
	}
	@RequestMapping(value = "/soccerStrategyUpdate", method = RequestMethod.POST)
	public String soccerStrategyUpdate(HttpServletRequest request, Model model){
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
		ds.soccerStrategyUpdate(stnum,strategy_name,chked_member_val);
		model.addAttribute("name", team2);
		model.addAttribute("area", team);
		model.addAttribute("stnum", stnum);
		return "redirect:/strategyListFind";
	}
}