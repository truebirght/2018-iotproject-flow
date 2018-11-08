package com.FlowProject.controller;

import java.time.LocalDate;
import java.time.Period;
import java.time.YearMonth;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
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
	@RequestMapping("/")
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
		
		if (memberVO.getRegDate() == null || memberVO.getRegDate().equals("")) { 
			memberVO = template.getForObject("https://us-central1-flow-3191.cloudfunctions.net/findUser?userId=" + memberId, MemberVO.class);
		}
		memberVO.setUserId(memberId);
		memberVO.setStartDate(startDate);
		memberVO.setEndDate(endDate);
		

		String mPort = memberVO.getMasterPort();
		String fPort = memberVO.getFlowPort();
		String vPort = memberVO.getValvePort();
		// RestTemplate으로 url에서 get
		Map<String, Integer> thisYearMonthlyData = template.getForObject("https://us-central1-flow-3191.cloudfunctions.net/rangeLitter?port=" + fPort + 
				"&startDate=" + firstDay + "&endDate=" + lastDay, Map.class);
		
		List<String> thisYearMonthlyDataKey = thisYearMonthlyData.keySet().stream().map(s-> "'" + s + "'").collect(Collectors.toList());
		List<Integer> thisYearMonthlyDataValue = thisYearMonthlyData.values().stream().collect(Collectors.toList());
		
		
		Map<String, Integer> myLitter = template.getForObject("https://us-central1-flow-3191.cloudfunctions.net/rangeLitter?port=" + fPort + 	
				"&startDate=" + startDate + "&endDate=" + endDate, Map.class);
		
		Map<String, Integer> masterLitter;
		
		if(fPort != mPort || !fPort.equals(mPort)) {
			masterLitter = template.getForObject("https://us-central1-flow-3191.cloudfunctions.net/rangeLitter?port=" + mPort + 	
					"&startDate=" + startDate + "&endDate=" + endDate, Map.class);
		} else { masterLitter = myLitter; }
		
		logger.info(masterLitter.toString());
		
		
		
		List<String> selectDateDataKey = myLitter.keySet().stream().map(k-> "'" + k + "'").collect(Collectors.toList());
		List<Integer> selectDateDataValue = myLitter.values().stream().collect(Collectors.toList());
		Integer masterTotalLitter = masterLitter.values().stream().reduce(0,  (a, b) -> (a + b));
		
		String checkLock = template.getForObject("https://us-central1-flow-3191.cloudfunctions.net/checkLock?valvePort=" + vPort, String.class);
		
		//RequestParam을 통해 들어온 변수들을 LocalDate로 변환
		LocalDate startDateLD = LocalDate.parse(startDate, formatter);
		LocalDate endDateLD = LocalDate.parse(endDate, formatter);
		
		//startDate - endDate 차이
		Period period = Period.between(startDateLD, endDateLD);
		
		int betweenDays = (int) ((period.getDays() + 1) / (60 * 60 * 24)) / 31;
		int month = ((betweenDays) == 0) ? 1 : betweenDays;
		int selectDateTotalLitter = selectDateDataValue.stream().reduce(0,  (a, b) -> (a + b));
		int masterTax = template.getForObject("https://us-central1-flow-3191.cloudfunctions.net/rangeTax?caliber=" + memberVO.getCaliber() +
				"&litter=" + masterTotalLitter + "&houseNumber=" + memberVO.getHouseNumber() + "&month=" + month, Integer.class);
		
		int myTax = (selectDateTotalLitter / masterTotalLitter) * masterTax;
		/*
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
	    model.addAttribute("selectDateTotalTax", myTax);
	    return "index";
	}
}
