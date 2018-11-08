package com.FlowProject;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cache.annotation.EnableCaching;

@SpringBootApplication
@EnableCaching
public class FlowProjectApplication {

	public static void main(String[] args) {
		SpringApplication.run(FlowProjectApplication.class, args);
	}
}
