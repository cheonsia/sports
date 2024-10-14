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
public class RankController2 {
	@Autowired
	SqlSession sqlSession;
	
	// KBO 리그 선수 순위 가져오기 by Jsoup
	@RequestMapping(value="/baseballPlayerRank")
	public String playerRank(Model model) throws IOException {
		ArrayList<BaseballPlayerDTO> list = new ArrayList<>();
		Document doc = Jsoup.connect("https://sports.news.naver.com/kbaseball/record/index.nhn?category=kbo")
				.userAgent(
						"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36")
				.get();
		// select를 이용해서 tr들을 불러오기
		Elements baseballSelects1 = doc.select(".pitcher > tbody tr td li");
		for (Element baseballSelect : baseballSelects1) {
			Element rank = baseballSelect.selectFirst("span.ord"); 
			Element name = baseballSelect.selectFirst("a"); 
			Element team = baseballSelect.selectFirst("span.team"); 
			Element win = baseballSelect.selectFirst("em"); 
			if (win != null) {
				BaseballPlayerDTO prank1 =new BaseballPlayerDTO();
				prank1.setRank(rank.text());
				prank1.setName(name.text());
				prank1.setTeam(team.text());
				prank1.setWin(win.text());
				list.add(prank1);
			}
		}
		Elements baseballSelects2 = doc.select(".hitter > tbody tr td li");
		for (Element baseballSelect : baseballSelects2) {
			Element rank = baseballSelect.selectFirst("span.ord"); 
			Element name = baseballSelect.selectFirst("a"); 
			Element team = baseballSelect.selectFirst("span.team"); 
			Element win = baseballSelect.selectFirst("em"); 
			if (win != null) {
				BaseballPlayerDTO prank1 =new BaseballPlayerDTO();
				prank1.setRank(rank.text());
				prank1.setName(name.text());
				prank1.setTeam(team.text());
				prank1.setWin(win.text());
				list.add(prank1);
			}
		}
		Elements baseballSelects3 = doc.select(".etc > tbody tr td li");
		for (Element baseballSelect : baseballSelects2) {
			Element rank = baseballSelect.selectFirst("span.ord"); 
			Element name = baseballSelect.selectFirst("a"); 
			Element team = baseballSelect.selectFirst("span.team"); 
			Element win = baseballSelect.selectFirst("em"); 
			if (win != null) {
				BaseballPlayerDTO prank1 =new BaseballPlayerDTO();
				prank1.setRank(rank.text());
				prank1.setName(name.text());
				prank1.setTeam(team.text());
				prank1.setWin(win.text());
				list.add(prank1);
			}
		}
		System.out.println(list);
		System.out.println(list.size());
		model.addAttribute("list",list);
		return "baseballPlayerRank";
	}
}