package com.mbc.sports.soccerdirect;

import java.util.ArrayList;

public interface DirectService {
	ArrayList<DirectDTO> selectCalendarArea(String areaname1);
	void soccercalendarsave(String team, String traning_select_date1, String traning_select_date2,
			String traning_people_select, String traning_map_input, String chked_traing_val,
			String training_memo_txtarea, String calendar_info_val);
	ArrayList<DirectDTO> selectCalendarInfo(String areaname, String calendar_info);
}