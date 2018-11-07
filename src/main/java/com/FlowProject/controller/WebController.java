package com.FlowProject.controller;

import java.time.YearMonth;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.TreeSet;
import java.util.stream.Collectors;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

import com.FlowProject.VO.MemberVO;
@Controller
public class WebController {
	
	@Autowired
	MemberVO mv;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@RequestMapping("/login")
	public String login(Model model, @ModelAttribute MemberVO memberVO) throws Exception {
	    return "login";
	}
	
	@RequestMapping("/signup")
	public String sigup(Model model, @ModelAttribute MemberVO memberVO) throws Exception {
	    return "signup";
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/")
	public String index(Model model, 
			@ModelAttribute MemberVO memberVO)
					throws Exception {
		// date format = mm/dd/yy
		RestTemplate template = new RestTemplate();

		if (memberVO.getUserId() == null || memberVO.getUserId().equals("")) { return "login"; }
		// 로그인 후 첫 메인화면
		YearMonth day = YearMonth.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/MM/dd");
		String firstDay = day.atDay(1).format(formatter).toString();
		String lastDay = day.atEndOfMonth().format(formatter).toString();
		
		String startDate = memberVO.getStartDate();
		String endDate = memberVO.getEndDate();
		if(startDate == null || startDate.equals("")) { startDate = firstDay; }
		if(endDate == null || endDate.equals("")) { endDate = lastDay; }
		
		String memberId = memberVO.getUserId().replace('@', '_');
		memberId = memberId.replace('.', '!');
		memberVO = template.getForObject("https://us-central1-flow-3191.cloudfunctions.net/findUser?userId=" + memberId, MemberVO.class);
		memberVO.setUserId(memberId);
		memberVO.setStartDate(startDate);
		memberVO.setEndDate(endDate);
		
		
		String fPort = memberVO.getFlowPort();
		String vPort = memberVO.getValvePort();
		// RestTemplate으로 url에서 get
		Map<String, Integer> thisYearMonthlyData = template.getForObject("https://us-central1-flow-3191.cloudfunctions.net/rangeLitter?port=" + fPort + 
				"&startDate=" + firstDay + "&endDate=" + lastDay, Map.class);
		
		List<String> thisYearMonthlyDataKey = thisYearMonthlyData.keySet().stream().map(s-> "'" + s + "'").collect(Collectors.toList());
		List<Integer> thisYearMonthlyDataValue = thisYearMonthlyData.values().stream().collect(Collectors.toList());
		
		Map<String, Integer> selectDateData = template.getForObject("https://us-central1-flow-3191.cloudfunctions.net/rangeLitter?port=" + fPort + 	
				"&startDate=" + startDate + "&endDate=" + endDate, Map.class);
		
		List<String> selectDateDataKey = selectDateData.keySet().stream().map(s-> "'" + s + "'").collect(Collectors.toList());
		List<Integer> selectDateDataValue = selectDateData.values().stream().collect(Collectors.toList());
		
		String checkLock = template.getForObject("https://us-central1-flow-3191.cloudfunctions.net/checkLock?valvePort=" + vPort, String.class);
		
		/*
		
		//RequestParam을 통해 들어온 변수들을 LocalDate로 변환
		LocalDate startDateLD = LocalDate.parse(startDate, formatter);
		LocalDate endDateLD = LocalDate.parse(endDate, formatter);
		
		//startDate - endDate 차이
		Period period = Period.between(startDateLD, endDateLD);
		
		List<String> selectDateList = Stream.iterate(startDateLD, date -> date.plusDays(1))
				.map(date -> "'" + date.format(formatter2) + "'")
				.limit(period.getDays() + 1)
				.collect(Collectors.toList());
		
		*/
	    model.addAttribute("memberVO", memberVO);
	    model.addAttribute("thisYearMonthlyDataKey", thisYearMonthlyDataKey);
	    model.addAttribute("thisYearMonthlyDataValue", thisYearMonthlyDataValue);
	    model.addAttribute("selectDateDataKey", selectDateDataKey);
	    model.addAttribute("selectDateDataValue", selectDateDataValue);
	    model.addAttribute("checkLock", checkLock);
	    return "index";
	}
}
