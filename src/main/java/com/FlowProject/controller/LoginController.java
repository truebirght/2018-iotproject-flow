package com.FlowProject.controller;

import java.text.SimpleDateFormat;
import java.time.YearMonth;
import java.util.ArrayList;
import java.util.Calendar;
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
@Controller
public class LoginController {
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
	public String test(Model model, 
			@RequestParam(required = false) String startDate, 
			@RequestParam(required = false) String endDate,
			@RequestParam(required = false) String port)
					throws Exception {
		// date format = mm/dd/yy
		
		RestTemplate template = new RestTemplate();
		int nowYear = 0;
		int nowMonth = 0;
		int lastYear = 0;
		int lastMonth = 0;
		
		// 로그인 후 첫 메인화면
		if (endDate == null) {
			if (startDate == null) {
				lastYear = YearMonth.now().getYear() - 1;
				lastMonth = YearMonth.now().getMonthValue();
			}
			
			nowYear = YearMonth.now().getYear();
			nowMonth = YearMonth.now().getMonthValue();
		}	
		// 특정 날짜 데이터 그리기
		else if (startDate == null) {
			nowYear = Integer.parseInt((endDate.split("/")[0]));
			nowMonth = Integer.parseInt((endDate.split("/")[2]));
		}
		// 시작 ~ 끝 기간 데이터 그리기
		else {
			nowYear = Integer.parseInt((endDate.split("/")[0]));
			nowMonth = Integer.parseInt((endDate.split("/")[2]));
			lastYear = Integer.parseInt((startDate.split("/")[0]));
			lastMonth = Integer.parseInt((startDate.split("/")[2]));
		}

		// 년 별
//		List<Integer> lastYearData = template.getForObject("https://us-central1-flow-3191.cloudfunctions.net/yearLitter?port=18&date=" + lastYear, List.class);
//	    List<Integer> thisYearData = template.getForObject("https://us-central1-flow-3191.cloudfunctions.net/yearLitter?port=18&date=" + nowYear, List.class);
	    
	    // 월 별
//	    List<Integer> lastYearMonthlyData = template.getForObject("https://us-central1-flow-3191.cloudfunctions.net/monthLitter?port=18&date=" + lastYear + '/' + lastMonth , List.class);
	    List<Integer> thisYearMonthlyData = template.getForObject("https://us-central1-flow-3191.cloudfunctions.net/monthLitter?port=18&date=" + nowYear + '/' + nowMonth, List.class);
	    
	    // 기간
	    /*
	     
	     */
//	    List<Integer> yearTotal = new ArrayList<Integer>();
	    model.addAttribute("thisYearMonthlyData", thisYearMonthlyData);
	    model.addAttribute("startDate", startDate);
	    model.addAttribute("endtDate", endDate);
	    return "index";
	}
}
