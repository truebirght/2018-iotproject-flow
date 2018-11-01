package com.FlowProject.config;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.ClassPathResource;

import com.google.auth.oauth2.GoogleCredentials;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;

@Configuration
public class FirebaseConfig {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public FirebaseConfig() throws FileNotFoundException, IOException {
		initFireBaseApp();
	}
	
	public void initFireBaseApp() throws FileNotFoundException, IOException {
		if (FirebaseApp.getApps().isEmpty()) {
			
			//logger.info(env.getProperty("server.port"));
			
			FileInputStream serviceAccount = new FileInputStream(
												new ClassPathResource("json/caramel-hallway-150401-firebase-adminsdk-qk14x-0aef4ea305.json").getFile());
			
			
			
			FirebaseOptions options = new FirebaseOptions.Builder()
										.setCredentials(GoogleCredentials.fromStream(serviceAccount))
										.setDatabaseUrl("https://caramel-hallway-150401.firebaseio.com/").build();
			// https://flow-3191.firebaseio.com/ - 정욱이형 URL
			FirebaseApp.initializeApp(options);
		}
	}
}