package com.mbc.sports.baseballdirect;

import java.util.ArrayList;

public interface DirectService {
	/*캘린더/전략 공통*/
	ArrayList<DirectDTO> selectPlayerArea(String areaname);

	/*캘린더*/
	
	/*전략*/
	ArrayList<BaseballStrategyDTO> selectStrategyList(String areaname1);
	void baseballStrategySave(String strategy_name, String calendar_info_val, String team, String chked_member_val);
	BaseballStrategyDTO strategyListFind(int stnum);
	void baseballStrategyDelete(int stnum);
	void baseballStrategyUpdate(int stnum, String strategy_name, String calendar_info_val);
}