package com.mbc.sports.game;

import java.util.ArrayList;

public interface GameService {

	ArrayList<GameDTO> gameselect();

	void gameinsert(String team1, String team2, String date, String time, String place, String season);

	GameDTO select(int gamenum);

	void delete(int gamenum);

	void update(String team1, String team2, String gamedate, String gametime, String gameplace, int gamenum, String season);

	void Bupdate(String team1, String team2, String gamedate, String gametime, String gameplace, int gamenum, String season);

	GameDTO Bselect(int gamenum);

	void Bdelete(int gamenum);

	ArrayList<GameDTO> Bgameselect();

	void Bgameinsert(String team1, String team2, String date, String time, String place, String season);

	ArrayList<GameDTO> Bgameselectdate(String date);

	ArrayList<GameDTO> selectCalendarData(String startdate);

	ArrayList<GameDTO> BselectCalendarData(String startdate);
	
}
