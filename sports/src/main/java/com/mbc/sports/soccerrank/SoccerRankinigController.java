package com.mbc.sports.soccerrank;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SoccerRankinigController {
	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping(value="/soccer_team_ranking")
	public String scteamrank(Model model) {
		SRankService srs = sqlSession.getMapper(SRankService.class);
		ArrayList<SoccerTeamDTO> strlist = srs.teamRank();
		model.addAttribute("strlist",strlist);
		return "soccerTeamRank";
	}
	@RequestMapping(value="/soccer_player_ranking")
	public String scplayerrank(Model model) {
		SRankService srs = sqlSession.getMapper(SRankService.class);
		ArrayList<SoccerPlayerDTO> sprlist = srs.playerRank();
		ArrayList<SoccerPlayerDTO> sprassist = srs.playerAssistRank();
		ArrayList<SoccerPlayerDTO> sprmom = srs.playerMOMRank();
		model.addAttribute("sprlist",sprlist);
		model.addAttribute("sprassist",sprassist);
		model.addAttribute("sprmom",sprmom);
		return "soccerPlayerRank";
	}
}