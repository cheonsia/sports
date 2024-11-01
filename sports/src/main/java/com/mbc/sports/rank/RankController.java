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
public class RankController {

	@Autowired
	SqlSession sqlSession;
	//축구 팀별 순위
	@RequestMapping(value="/soccerTeamRank")
	public String scteamrank(Model model) throws IOException {
		ArrayList<SoccerTeamDTO> list = new ArrayList<>();
			Document doc = Jsoup.connect("https://sports.news.naver.com/kfootball/record/index?category=kleague")
					.userAgent(
							"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36")
					.get();
		String soccer[] = {"#splitGroupA_table","#splitGroupB_table"};
		for(int i=0; i < soccer.length; i++) {
			Elements soccerTeams = doc.select(soccer[i] + " > tr");
			for (Element soccerTeam : soccerTeams) {
				Element rank = soccerTeam.selectFirst("th"); // 순위
				Element title = soccerTeam.selectFirst("span:nth-child(2)"); // 팀명
				Element round = soccerTeam.selectFirst("td:nth-child(3)"); // 경기 수
				Element points = soccerTeam.selectFirst("td:nth-child(4)"); // 승점
				Element win = soccerTeam.selectFirst("td:nth-child(5)"); // 승
				Element draw = soccerTeam.selectFirst("td:nth-child(6)"); // 무
				Element lose = soccerTeam.selectFirst("td:nth-child(7)"); // 패
				Element score = soccerTeam.selectFirst("td:nth-child(8)"); // 득점
				Element conceded = soccerTeam.selectFirst("td:nth-child(9)"); // 실점
				Element difference = soccerTeam.selectFirst("td:nth-child(10)"); // 득실차
				Element assist = soccerTeam.selectFirst("td:nth-child(11)"); // 도움
				Element foul = soccerTeam.selectFirst("td:nth-child(12)"); // 파울
				if (title != null) {
					String teamkor =(title.text().contains("수원")) ? "수원" : title.text();
					SoccerTeamDTO teamData = new SoccerTeamDTO(rank.text(),teamkor, round.text(), points.text(),win.text(), draw.text(), lose.text(), score.text(), conceded.text(), difference.text(), assist.text(), foul.text());
					list.add(teamData);
				}
			}
		}
		model.addAttribute("list",list);
		return "soccerTeamRank";
	}
	//축구 선수별 순위
	@RequestMapping(value="/soccerPlayerRank")
	public String scplayerrank(Model model) throws IOException {
		ArrayList<SoccerPlayerDTO> sectionlist = new ArrayList<>();
		
		Document doc = Jsoup.connect("https://sports.news.naver.com/kfootball/record/index")
				.userAgent(
						"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36")
				.get();
		// select를 이용해서 tr들을 불러오기
		String [] section= {"최다 득점","최다 도움","MOM"};
		String [] span= {"골","도움","회"};
		Elements soccerLanks = doc.select(".lead_inner li .lead_area .list > div");
		// tr들의 반복문 돌리기 
		int i=0;
		for (Element soccerPlayer : soccerLanks) {
			String span1 = span[i/3];
			String title = section[i++/3];
			Element rank = soccerPlayer.selectFirst(".rank_num"); // 순위
			Element name = soccerPlayer.selectFirst(".info a"); // 선수이름
			Element team = soccerPlayer.selectFirst(".info span"); // 팀이름
			Element score = soccerPlayer.selectFirst(".stat span"); // 득점
			if (rank != null) {
				String teameng =(team.text().contains("서울")) ? "seoul" : (team.text().contains("인천")) ? "incheon" : (team.text().contains("울산")) ? "ulsan" : (team.text().contains("수원")) ? "suwon" : (team.text().contains("김천")) ? "gimcheon" : (team.text().contains("대구")) ? "daegu" : (team.text().contains("강원")) ? "kangwon" : (team.text().contains("대전")) ? "daejeon" : (team.text().contains("전북")) ? "jeonbuk" : (team.text().contains("제주")) ? "jeju" : (team.text().contains("포항")) ? "pohang" : "gwangju";
				String teamkor =(team.text().contains("서울")) ? "서울" : (team.text().contains("인천")) ? "인천" : (team.text().contains("울산")) ? "울산" : (team.text().contains("수원")) ? "수원" : (team.text().contains("김천")) ? "김천" : (team.text().contains("대구")) ? "대구" : (team.text().contains("강원")) ? "강원" : (team.text().contains("대전")) ? "대전" : (team.text().contains("전북")) ? "전북" : (team.text().contains("제주")) ? "제주" : (team.text().contains("포항")) ? "포항" : "광주";
				SoccerPlayerDTO playerData = new SoccerPlayerDTO();
				playerData.setAssist(span1);
				playerData.setRecord(title);
				playerData.setRank(rank.text());
				playerData.setName(name.text());
				playerData.setTeam(teamkor);
				playerData.setScore(score.text());
				RankService rs = sqlSession.getMapper(RankService.class);
				String image = rs.getimage(teameng, playerData.getName());
				playerData.setChange(image);
				sectionlist.add(playerData);
			}
		}
		
		ArrayList<SoccerPlayerDTO> list = new ArrayList<>();
		Document doc1 = Jsoup.connect("https://www.kleague.com/record/player.do")
			.userAgent(
					"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36")
			.get();
		// select를 이용해서 tr들을 불러오기
		Elements soccerPlayers = doc1.select("#player_rank > tr");
		// tr들의 반복문 돌리기 
		for (Element soccerPlayer : soccerPlayers) {
			Element rank = soccerPlayer.selectFirst("td:nth-child(1)"); // 순위
			Element name = soccerPlayer.selectFirst("td:nth-child(2)"); // 선수이름
			Element team = soccerPlayer.selectFirst("td:nth-child(3)"); // 팀이름
			Element score = soccerPlayer.selectFirst("td:nth-child(4)"); // 득점
			Element assist = soccerPlayer.selectFirst("td:nth-child(5)"); // 도움
			Element attackPoint = soccerPlayer.selectFirst("td:nth-child(6)"); // 공격포인트
			Element conceded = soccerPlayer.selectFirst("td:nth-child(7)"); // 실점
			Element conner = soccerPlayer.selectFirst("td:nth-child(8)"); // 코너킥
			Element foul = soccerPlayer.selectFirst("td:nth-child(9)"); // 파울
			Element shooting = soccerPlayer.selectFirst("td:nth-child(10)"); // 슈팅
			Element offside = soccerPlayer.selectFirst("td:nth-child(11)"); // 오프사이드
			Element warning = soccerPlayer.selectFirst("td:nth-child(12)"); // 경고
			Element exit = soccerPlayer.selectFirst("td:nth-child(13)"); // 퇴장
			Element scoreless = soccerPlayer.selectFirst("td:nth-child(14)"); // 무실점경기
			Element businessTrip = soccerPlayer.selectFirst("td:nth-child(15)"); // 출장
			Element change = soccerPlayer.selectFirst("td:nth-child(16)"); // 교체
			Element record = soccerPlayer.selectFirst("td:nth-child(17)"); // 경기당기록
			if (rank != null) {
				String teamkor =(team.text().contains("수원")) ? "수원" : team.text();
				SoccerPlayerDTO playerData = new SoccerPlayerDTO(rank.text(),name.text(), teamkor, score.text(),assist.text(),attackPoint.text(), conceded.text(), conner.text(), foul.text(), shooting.text(), offside.text(),warning.text(), exit.text(), scoreless.text(), businessTrip.text(), change.text(), record.text());
				list.add(playerData);
			}
		}
		model.addAttribute("sectionlist",sectionlist);
		model.addAttribute("list",list);
		return "soccerPlayerRank";
	}
	//야구 팀별 순위
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
	//야구 선수별 순위
	@RequestMapping(value="/baseballPlayerRank")
	public String playerRank(Model model) throws IOException {
		ArrayList<BaseballPlayerDTO> sectionlist = new ArrayList<>();
		Document doc = Jsoup.connect("https://sports.news.naver.com/kbaseball/record/index.nhn?category=kbo")
				.userAgent(
						"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36")
				.get();
		String [] section = {"투수", "타자","기타"};
		String [] str = {".pitcher", ".hitter",".etc"};
		String [] title = {"다승 순위","평균 자책 순위","탈삼진 순위","세이브 순위","타율 순위","타점 순위","홈런 순위","도루 순위","WHIP 순위","OPS 순위","투수 WAR 순위","타자 WAR 순위"};
		for ( int i = 0 ; i<str.length;i++) {
			int k=0;
			Elements baseballSelects = doc.select(str[i]+" > tbody tr td li");
			for (Element baseballSelect : baseballSelects){
				Element rank = baseballSelect.selectFirst("span.ord"); 
				Element name = baseballSelect.selectFirst("a"); 
				Element team = baseballSelect.selectFirst("span.team"); 
				Element win = baseballSelect.selectFirst("em"); 
				if (win != null) {
					RankService srs = sqlSession.getMapper(RankService.class);
					BaseballPlayerDTO playerRank =new BaseballPlayerDTO();
					playerRank.setRank(rank.text());
					playerRank.setName(name.text());
					playerRank.setTeam(team.text());
					playerRank.setWin(win.text());					
					playerRank.setHold(title[k/5+4*i]);k++;	
					String tname = (playerRank.getTeam().equals("두산")) ? "DOOSAN" :(playerRank.getTeam().equals("삼성")) ? "SAMSUNG" : (playerRank.getTeam().equals("롯데")) ? "LOTTE" : (playerRank.getTeam().equals("한화")) ? "HANHWA" :(playerRank.getTeam().equals("키움")) ? "KIWOOM" : playerRank.getTeam();
					String image = srs.getImage(playerRank.getName(),tname);					
					playerRank.setEra(image);
					sectionlist.add(playerRank);
				}}}
		model.addAttribute("sectionlist",sectionlist);
		model.addAttribute("section",section);
		return "baseballPlayerRank";
	}
}