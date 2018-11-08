package com.FlowProject.controller;

import java.time.YearMonth;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/Flow/")
public class RestFlowController {
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	
	@RequestMapping("{userId}/{date}")
	public @ResponseBody Map<String, Object> getValveStatus(@PathVariable(required = true, value = "userId") String userId,
			@PathVariable(required = true, value = "date") String date) throws JSONException {
		
		int year = 0;
	    int month = 0;
	    String caliber = "15";
	    
		if (date == null || date.equals("")) {
			year = YearMonth.now().getYear();
		    month = YearMonth.now().getMonthValue();
		} else {
			year = Integer.parseInt(date.substring(0, 4));
			month = Integer.parseInt(date.substring(4));
		}
		
		date = String.valueOf(year) + "/" + String.valueOf(month);
		RestTemplate template = new RestTemplate();
		
		Integer port = template.getForObject("https://us-central1-flow-3191.cloudfunctions.net/findFlow?userId=" 
	    		+ userId, Integer.class);
		@SuppressWarnings("unchecked")
		List<Integer> monthLitter = template.getForObject("https://us-central1-flow-3191.cloudfunctions.net/monthLitter?port=" + port + 	
				"&date=" + date, List.class);
		int totalLitter = monthLitter.stream().reduce(0, (a,b) -> a+b);
		
		Integer totalTax = template.getForObject("https://us-central1-flow-3191.cloudfunctions.net/testTax?caliber=" + caliber + 
				"&litter=" + String.valueOf(totalLitter), Integer.class);
		
		Map<String, Object> totalMap = new HashMap<String, Object>();
		
		totalMap.put("totalLitter", totalLitter);
		totalMap.put("totalTax", totalTax);
		
	    return totalMap;
	}
}
