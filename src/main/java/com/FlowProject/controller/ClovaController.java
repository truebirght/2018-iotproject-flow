package com.FlowProject.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Map;
import java.util.stream.Collectors;

import javax.annotation.PostConstruct;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
	Logger jsonLogger = LoggerFactory.getLogger("jsonLogger");
	
	private String defaultRep;
	private ObjectMapper mapper = new ObjectMapper();
	
	@PostConstruct
	public void init() throws IOException{
		defaultRep = new BufferedReader(new InputStreamReader(new ClassPathResource("json/defaultResponse.json").getInputStream()))
				  .lines()
				  .collect(Collectors.joining("\n"));
	}
	
	@RequestMapping("clova")
	@ResponseBody
	public String dispatch(@RequestBody(required = false) Map<String, Object> validationData) throws IOException {
		JsonNode req = mapper.valueToTree(validationData);
		ObjectNode rep = (ObjectNode)mapper.readTree(defaultRep);
		String type = req.get("request").get("type").asText();
		
		if(type.equals("LaunchRequest") || req.path("session").path("new").asBoolean() == true){
			return defaultRep;
		}
		
		JsonNode intent = req.get("request").get("intent");
		ObjectNode spechText = (ObjectNode)rep.path("response").path("outputSpeech").path("values");
		
		spechText.put("value", "그건 제가 할수 없는일이네요.. 다른 일을 시켜보시겠어요?");
		switch(type) {
		case "SessionEndedRequest":
			((ObjectNode)rep.path("response")).put("shouldEndSession",true);
			spechText.put("value", "만나서 반가웠어요. 우리집 수도에 관하여 궁금한점이 있으면 언제든지 다시 불러주세요!");
			break;
		case "IntentRequest":
			switch(intent.path("name").textValue()) {
			//밸브 제어 인텐트
			case "ValveControIntent":
				String stat = intent.path("slots").path("valveStatus").path("value").textValue();
				if(stat.equals("open") || stat.equals("lock")) {
					FirebaseDatabase db = FirebaseDatabase.getInstance();
					DatabaseReference ref = db.getReference("/ControlData/23/lock");
					ref.setValue(stat.equals("open") ? "on" : "off", new CompletionListener() {

						@Override
						public void onComplete(DatabaseError error, DatabaseReference ref) {
							log.info("{}/{}",error,ref);
						}
						
					});
					
					spechText.put("value", "벨브를" + ( stat.equals("open") ? "열었습니다": "잠궜습니다"));
				}
				break;
			default:
				spechText.put("value", "그건 제가 할수 없는일이네요.. 다른 일을 시켜보시겠어요?");
			}
			break;
		}		
		jsonLogger.info(req.toString());
		jsonLogger.info(rep.toString());
		return rep.toString();		
	}
}
