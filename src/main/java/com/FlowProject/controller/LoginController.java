package com.FlowProject.controller;

import java.time.YearMonth;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

import com.FlowProject.service.ChartjsService;
import com.FlowProject.service.FirebaseService;
@Controller
public class LoginController {
	
	@Autowired
	FirebaseService fs;
	
	@Autowired
	ChartjsService cs;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@RequestMapping("/login")
	public String login(Model model) throws Exception {
	    
	    return "login";
	}
	
	@RequestMapping("/signup")
	public String sigup(Model model) throws Exception {
	    
	    return "signup";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/")
	public String test(Model model, @RequestParam String lastDate, @RequestParam String nowDate) throws Exception {
		// date format = mm/dd/yy
		
		RestTemplate template = new RestTemplate();
		int nowYear = 0;
		int nowMonth = 0;
		int lastYear = 0;
		int lastMonth = 0;
		
		// 로그인 후 첫 메인화면
		if (nowDate == null) {
			 nowYear = YearMonth.now().getYear();
			 nowMonth = YearMonth.now().getMonthValue();
			 
		}	
		// 특정 날짜 데이터 그리기
		else if (lastDate == null) {
			nowYear = Integer.parseInt((nowDate.split("/")[2]));
			nowMonth = Integer.parseInt((nowDate.split("/")[0]));
		}
		// 시작 ~ 끝 기간 데이터 그리기
		else {
			nowYear = Integer.parseInt((nowDate.split("/")[2]));
			nowMonth = Integer.parseInt((nowDate.split("/")[0]));
			lastYear = Integer.parseInt((lastDate.split("/")[2]));
			lastMonth = Integer.parseInt((lastDate.split("/")[0]));
		}

		// 년 별
		List<Integer> lastYearData = template.getForObject("https://us-central1-flow-3191.cloudfunctions.net/yearLitter?port=18&date=" + (nowYear-1), List.class);
	    List<Integer> thisYearData = template.getForObject("https://us-central1-flow-3191.cloudfunctions.net/yearLitter?port=18&date=" + nowYear, List.class);
	    
	    // 월 별
	    List<Integer> lastYearMonthlyData = template.getForObject("https://us-central1-flow-3191.cloudfunctions.net/monthLitter?port=18&date=" + nowYear + '/' + (nowMonth -1) , List.class);
	    List<Integer> thisYearMonthlyData = template.getForObject("https://us-central1-flow-3191.cloudfunctions.net/monthLitter?port=18&date=" + nowYear + '/' + nowMonth, List.class);
	    
	    // 기간
	    /*
	     
	     */
	    List<Integer> yearTotal = new ArrayList<Integer>();
	    
	    yearTotal.add(lastYearData.stream().reduce(0, (a,b) -> a+b));
	    yearTotal.add(thisYearData.stream().reduce(0, (a,b) -> a+b));
	    model.addAttribute("lastYearData", lastYearData);
	    model.addAttribute("thisYearData", thisYearData);
	    model.addAttribute("yearTotal", yearTotal);
	    model.addAttribute("lastYearMonthlyData", lastYearMonthlyData);
	    model.addAttribute("thisYearMonthlyData", thisYearMonthlyData);
	    
	    return "indexExample";
	}
}
