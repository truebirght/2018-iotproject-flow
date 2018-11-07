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
			FirebaseOptions options = new FirebaseOptions.Builder()
										.setCredentials(GoogleCredentials.fromStream(
												new ClassPathResource("json/flow-3191-firebase-adminsdk-omw4y-92b1ff1b7f.json")
												.getInputStream()))
										.setDatabaseUrl("https://us-central1-flow-3191.firebaseio.com/").build();
			FirebaseApp.initializeApp(options);
		}
	}
}