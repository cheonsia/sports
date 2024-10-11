package com.mbc.sports.rank;

import java.util.ArrayList;

public interface SRankService {

	ArrayList<SoccerTeamDTO> teamRank();

	ArrayList<SoccerPlayerDTO> playerRank();

	ArrayList<SoccerPlayerDTO> playerAssistRank();

	ArrayList<SoccerPlayerDTO> playerMOMRank();
	
}