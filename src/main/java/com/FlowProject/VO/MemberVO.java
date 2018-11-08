package com.FlowProject.VO;

import org.springframework.stereotype.Repository;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.Data;

@Data
@Repository
@JsonIgnoreProperties(ignoreUnknown = true)
public class MemberVO {
	String userId;
	String regDate;
	String valvePort;
	String flowPort;
	String masterPort;
	String caliber;
	String startDate;
	String endDate;
	String houseNumber;
}
