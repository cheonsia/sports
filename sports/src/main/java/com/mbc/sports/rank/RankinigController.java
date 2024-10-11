package com.mbc.sports.rank;

import java.io.IOException;
import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RankinigController {
	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping(value="/soccerTeamRanking")
	public String scteamrank(Model model) {
		SRankService srs = sqlSession.getMapper(SRankService.class);
		ArrayList<SoccerTeamDTO> strlist = srs.teamRank();
		model.addAttribute("strlist",strlist);
		return "soccerTeamRank";
	}
	@RequestMapping(value="/soccerPlayerRanking")
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

	// KBO 리그 팀 순위 가져오기 by Jsoup
	@RequestMapping(value="/baseballTeamRank")
	public String scrapeRank(Model model) {
		ArrayList<BaseballTeamDTO> list = new ArrayList<>();
		try {
			Document doc = Jsoup.connect("https://sports.news.naver.com/kbaseball/record/index.nhn?category=kbo")
					.userAgent(
							"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36")
					.get();
			// select를 이용해서 tr들을 불러오기
			Elements baseballTeams = doc.select("#regularTeamRecordList_table > tr");
			// tr들의 반복문 돌리기
			for (Element baseballTeam : baseballTeams) {
				Element rank = baseballTeam.selectFirst("th"); // 등 수
				Element title = baseballTeam.selectFirst("span:nth-child(2)"); // 팀 명
				Element match = baseballTeam.selectFirst("td:nth-child(3)"); // 경기 수
				Element victory = baseballTeam.selectFirst("td:nth-child(4)"); // 승
				Element defeat = baseballTeam.selectFirst("td:nth-child(5)"); // 패
				Element draw = baseballTeam.selectFirst("td:nth-child(6)"); // 무
				Element rate = baseballTeam.selectFirst("td:nth-child(7)"); // 승률
				Element between = baseballTeam.selectFirst("td:nth-child(8)"); // 게임차
				Element winning = baseballTeam.selectFirst("td:nth-child(9)"); // 연속
				Element base = baseballTeam.selectFirst("td:nth-child(10)"); // 출루율
				Element slugging = baseballTeam.selectFirst("td:nth-child(11)"); // 장타율
				Element recent = baseballTeam.selectFirst("td:nth-child(12)"); // 최근 10경기
				if (title != null) {
					String image = title.text();
					BaseballTeamDTO teamData = new BaseballTeamDTO(rank.text(), image, title.text(), match.text(), victory.text(),
							defeat.text(), draw.text(), rate.text(), between.text(), winning.text(), base.text(), slugging.text(), recent.text());
					list.add(teamData);
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		model.addAttribute("list",list);
		return "baseballTeamRank";
	}
}