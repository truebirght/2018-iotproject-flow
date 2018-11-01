package com.FlowProject.vo;

import com.google.firebase.database.IgnoreExtraProperties;

import lombok.Data;

@Data
@IgnoreExtraProperties
public class FirebaseVO {
	private String time;
	private Integer litter;
	
}
