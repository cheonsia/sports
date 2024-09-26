package com.mbc.sports.baseballplayer;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BPlayerController {
	
	@Autowired
	SqlSession sqlsession;
	
	@RequestMapping(value = "/baseballselectTeam")
	public String baseballselectTeam(HttpServletRequest request, Model mo) {
		String btname = request.getParameter("tname");
		String baseball_area_han = request.getParameter("area");
		BPlayerService bps = sqlsession.getMapper(BPlayerService.class);
		if(btname.equals("ALL")) {
			ArrayList<BPlayerDTO> list = bps.allTeamSelect();
			mo.addAttribute("list", list);
		} else {
			ArrayList<BPlayerDTO> list = bps.selectTeam(btname);
			mo.addAttribute("list", list);
		}
		mo.addAttribute("teamarea",baseball_area_han);
		
		return "baseballplayerlistout";
	}
	
}
