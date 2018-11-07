package com.FlowProject.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

@Controller
@RequestMapping("/Valve/")
public class RestValveController {
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@RequestMapping("{userId}/{status}")
	public @ResponseBody String getValveStatus(@PathVariable(required = true, value = "userId") String userId,
			@PathVariable(required = true, value = "status") String status) {
		
			
			RestTemplate template = new RestTemplate();
			
			String port = template.getForObject("https://us-central1-flow-3191.cloudfunctions.net/findValve?userId=" 
		    		+ userId, String.class);
		
			return template.getForObject("https://us-central1-flow-3191.cloudfunctions.net/valveOnOff?port=" 
		    		+ port + "&status=" + status, String.class);
	}
	
	@PostMapping("{vPort}/{status}")
	public @ResponseBody String setValveStatus(@PathVariable(required = true, value = "vPort") String vPort,
			@PathVariable(required = true, value = "status") String status) {
			
			return new RestTemplate().getForObject("https://us-central1-flow-3191.cloudfunctions.net/valveOnOff?port=" 
		    		+ vPort + "&status=" + status, String.class);
	}
}
