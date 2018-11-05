package com.FlowProject.controller;

import java.time.LocalDate;
import java.time.Period;
import java.time.YearMonth;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.TreeSet;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
@Controller
public class LoginController {
	
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

		if (port == null || port.equals("")) { return "login"; }
		// 로그인 후 첫 메인화면
		YearMonth day = YearMonth.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/MM/dd");
		DateTimeFormatter formatter2 = DateTimeFormatter.ofPattern("yyyy년 MM월 dd일");
		String firstDay = day.atDay(1).format(formatter).toString();
		String lastDay = day.atEndOfMonth().format(formatter).toString();
		
		List<Integer> thisYearMonthlyData = template.getForObject("https://us-central1-flow-3191.cloudfunctions.net/rangeLitter?port=" + port + 
				"&startDate=" + firstDay + "&endDate=" + lastDay, List.class);
		
		List<Integer> selectDateData = template.getForObject("https://us-central1-flow-3191.cloudfunctions.net/rangeLitter?port=" + port + 	
				"&startDate=" + startDate + "&endDate=" + endDate, List.class);
		
		LocalDate startDateLD = LocalDate.parse(startDate, formatter);
		LocalDate endDateLD = LocalDate.parse(endDate, formatter);
		
		Period period = Period.between(startDateLD, endDateLD);
		List<String> selectDateList = Stream.iterate(startDateLD, date -> date.plusDays(1))
				.map(date -> "'" + date.format(formatter2) + "'")
				.limit(period.getDays() + 1)
				.collect(Collectors.toList());
		
	    TreeSet<String> dateList = new TreeSet<String>();
	    dateList.add(startDate);
	    dateList.add(endDate);
	    
	    model.addAttribute("thisYearMonthlyData", thisYearMonthlyData);
	    model.addAttribute("selectDateData", selectDateData);
	    model.addAttribute("selectDateList", selectDateList);
	    model.addAttribute("dateList", dateList);
	    return "index";
	}
	
	
	
}
