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
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;
import com.google.firebase.database.DatabaseError;
import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.DatabaseReference.CompletionListener;
import com.google.firebase.database.FirebaseDatabase;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ClovaController {

	private String defaultRep;
	private ObjectMapper mapper = new ObjectMapper();
	
	@PostConstruct
	public void init() throws IOException{
		defaultRep = new BufferedReader(new InputStreamReader(new ClassPathResource("json/defaultResponse.json").getInputStream()))
				  .lines().collect(Collectors.joining("\n"));
		
		//Gson gson = new GsonBuilder().create();
		//gson.fro
	}
	
	@RequestMapping("clova")
	@ResponseBody
	public String dispatch(@RequestBody(required = false) Map<String, Object> validationData) throws IOException {
		JsonNode req = mapper.valueToTree(validationData);
		ObjectNode rep = (ObjectNode)mapper.readTree(defaultRep);
		String type = req.get("request").get("type").asText();
		
		if(type.equals("LaunchRequest")){
			return defaultRep;
		}
		
		JsonNode intent = req.get("request").get("intent");
		if(type.equals("IntentRequest")) {
			switch(intent.path("name").textValue()) {
			case "ValveControIntent":
				String stat = intent.path("slots").path("valveStatus").path("value").textValue();
				ObjectNode value = (ObjectNode)rep.path("response").path("outputSpeech").path("values");
				
				FirebaseDatabase db = FirebaseDatabase.getInstance();
				DatabaseReference ref = db.getReference("/ControlData/23/lock");
				ref.setValue(stat.equals("open") ? "on" : "off", new CompletionListener() {

					@Override
					public void onComplete(DatabaseError error, DatabaseReference ref) {
						log.info("{}/{}",error,ref);
					}
					
				});
				
				value.put("value", "벨브를" + ( stat.equals("open") ? "열었습니다": "잠궜습니다"));
				break;
			}
		}
		
		return rep.toString();		
	}
}
