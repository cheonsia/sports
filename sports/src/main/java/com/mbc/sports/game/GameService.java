package com.mbc.sports.game;

import java.util.ArrayList;

public interface GameService {

	ArrayList<GameDTO> gameselect();

	void gameinsert(String team1, String team2, String date, String time, String place);

	GameDTO select(int gamenum);

	void delete(int gamenum);

	void update(String team1, String team2, String gamedate, String gametime, String gameplace, int gamenum);

	ArrayList<GameDTO> gameselectdate(String date);
	
}
