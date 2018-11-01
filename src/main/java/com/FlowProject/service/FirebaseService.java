package com.FlowProject.service;

import java.time.LocalDate;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.web.context.request.async.DeferredResult;

import com.FlowProject.vo.FirebaseVO;

@Service
public interface FirebaseService {
	
	public FirebaseVO getAllData();
	public FirebaseVO getSearchData(int portNum);
	public DeferredResult<Map<String,FirebaseVO>> getSearchData(LocalDate date);
}
	
