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
}
