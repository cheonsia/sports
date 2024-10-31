package com.mbc.sports.baseballdirect;
import java.util.ArrayList;
public interface DirectService {
	/*캘린더/전략 공통*/
	ArrayList<DirectDTO> selectPlayerArea(String areaname);
	/*캘린더*/
	void baseballcalendarsave(String team, String traning_select_date1, String traning_select_date2,
			String traning_people_select, String traning_map_input, String chked_traing_val,
			String training_memo_txtarea, String calendar_info_val);
	ArrayList<DirectDTO> selectCalendarInfo(String areaname, String calendar_info);
	ArrayList<DirectDTO> selectCalendarData(String areaname2, String calendar_info, String startdate);
	ArrayList<DirectDTO> selectCalendarDetail(String areaname2, String calendar_info, int number);
	void baseballCalendarUpdate(String traning_select_date1, String traning_select_date12, String traning_people_select,
			String traning_map_input, String chked_traing_val, String training_memo_txtarea, int trnum);
	void baseballCalendarDelete(int num);
	/*전략*/
	ArrayList<BaseballStrategyDTO> selectStrategyList(String areaname1, String calendar_info_eng);
	void baseballStrategySave(String strategy_name, String calendar_info_val, String team, String chked_member_val);
	BaseballStrategyDTO strategyListFind(int stnum);
	void baseballStrategyDelete(int stnum);
	void baseballStrategyUpdate(int stnum, String strategy_name, String calendar_info_val);
	ArrayList<DirectDTO> selectPlayerAreaAll(String calendar_info);
}