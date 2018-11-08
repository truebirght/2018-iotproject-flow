package com.FlowProject.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Map;
import java.util.stream.Collectors;

import javax.annotation.PostConstruct;

import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ClovaController {

	String defaultRep;
	
	@PostConstruct
	public void init() throws IOException{
		defaultRep = new BufferedReader(new InputStreamReader(new ClassPathResource("json/defaultResponse.json").getInputStream()))
				  .lines().collect(Collectors.joining("\n"));
		
		//Gson gson = new GsonBuilder().create();
		//gson.fro
	}
	
	@RequestMapping("clova")
	@ResponseBody
	public String dispatch(@RequestBody(required = false) Map<String, Object> validationData) {
		return defaultRep;
		//Gson gson = new GsonBuilder().create();
		//gson.
		
	}
}
