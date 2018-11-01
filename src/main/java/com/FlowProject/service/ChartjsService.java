package com.FlowProject.service;

import java.util.List;

import org.springframework.stereotype.Service;

@Service
public interface ChartjsService {
	public String chartToJson(List arr1, List arr2);
}
