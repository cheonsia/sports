package com.mbc.sports;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
	@Autowired
	SqlSession sqlsession;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String main(HttpServletRequest request) {
		HttpSession hs=request.getSession();
		hs.setAttribute("normallogin", false);
		hs.setAttribute("superlogin", false);
		hs.setAttribute("adminlogin", false);
		return "index";
	}

	@RequestMapping(value = "/soccermain", method = RequestMethod.GET)
	public String smain(HttpServletRequest request) {
		HttpSession hs=request.getSession();
		hs.setAttribute("sports", "绵备");
		return "soccermain";
	}

	@RequestMapping(value = "/baseballmain", method = RequestMethod.GET)
	public String bmain(HttpServletRequest request) {
		HttpSession hs=request.getSession();
		hs.setAttribute("sports", "具备");
		return "baseballmain";
	}

	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main2(HttpServletRequest request) {
		HttpSession hs=request.getSession();
		String sports = (String)hs.getAttribute("sports");
		String path="redirect:/soccermain";
		if (sports!=null) {
			path = (sports.equals("绵备")) ? "redirect:/soccermain" :"redirect:/baseballmain";			
		}
		return path;
	}
	

	@RequestMapping(value = "/areaClick", method = RequestMethod.POST)
	public String areaClick(HttpServletRequest request, Model model) {
		String area_en = request.getParameter("area_en");
		String area_ko = request.getParameter("area_ko");

		TopDTO top = new TopDTO();
		top.setArea_eng(area_en);
		top.setArea_kor(area_ko);
		model.addAttribute("area", top);

		HttpSession hs = request.getSession(); 
		hs.setAttribute("areaset", true);
		hs.setAttribute("area", top);
		return "main";
	}
}