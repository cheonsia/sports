package com.mbc.sports.random;

import java.util.ArrayList;

public interface RandomService {
	ArrayList<PlayerDTO> randomSelectAll();
	ArrayList<PlayerDTO> randomSelectBoth(String tname, String main);
	ArrayList<PlayerDTO> randomSelectTeam(String tname);
	ArrayList<PlayerDTO> randomSelectPosition(String main);
}