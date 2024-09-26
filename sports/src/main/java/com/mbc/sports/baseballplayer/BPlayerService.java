package com.mbc.sports.baseballplayer;

import java.util.ArrayList;

public interface BPlayerService {

	ArrayList<BPlayerDTO> allTeamSelect();

	ArrayList<BPlayerDTO> selectTeam(String btname);
	


}
