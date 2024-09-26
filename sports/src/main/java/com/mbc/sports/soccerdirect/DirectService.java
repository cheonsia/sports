package com.mbc.sports.soccerdirect;

import java.util.ArrayList;

public interface DirectService {
	ArrayList<DirectDTO> selectCalendarArea(String areaname1);
}