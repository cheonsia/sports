package com.mbc.sports.soccerdirect;
import java.util.ArrayList;
public interface DirectService {
	ArrayList<DirectDTO> selectCalendarArea(String areaname1);
	void soccercalendarsave(String team, String traning_select_date1, String traning_select_date2,
			String traning_people_select, String traning_map_input, String chked_traing_val,
			String training_memo_txtarea, String calendar_info_val);
	ArrayList<DirectDTO> selectCalendarInfo(String areaname, String calendar_info);
	ArrayList<SoccerStrategyDTO> selectStrategyList(String areaname1);
	void soccerstrategysave(String strategy_name, String calendar_info_val, String team, String chked_member_val);
	SoccerStrategyDTO strategylistfind(int stnum);
	void soccerStrategyDelete(int stnum);
	void soccerStrategyUpdate(int stnum, String strategy_name, String calendar_info_val);
	ArrayList<DirectDTO> selectCalendarData(String areaname2, String calendar_info, String startdate);
	ArrayList<DirectDTO> selectCalendarDetail(String areaname2, String calendar_info, int number);
	void soccerCalendarUpdate(String traning_select_date1, String traning_select_date12, String traning_people_select,
			String traning_map_input, String chked_traing_val, String training_memo_txtarea, int trnum);
	void soccerCalendarDelete(int num);
}