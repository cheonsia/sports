package com.mbc.sports.random;

import java.util.ArrayList;

public interface RandomService {
	ArrayList<PlayerDTO> randomSelectAll();
	ArrayList<PlayerDTO> randomSelectBoth(String tname, String main);
	ArrayList<PlayerDTO> randomSelectTeam(String tname);
	ArrayList<PlayerDTO> randomSelectPosition(String main);
	ArrayList<PlayerDTO> SrandomSelectAll();
	ArrayList<PlayerDTO> SrandomSelectBoth(String tname, String main);
	ArrayList<PlayerDTO> SrandomSelectTeam(String tname);
	ArrayList<PlayerDTO> SrandomSelectPosition(String main);
}