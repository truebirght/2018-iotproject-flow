package com.FlowProject.service;

import java.time.LocalDate;
import java.util.Map;
import java.util.TreeMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.async.DeferredResult;

import com.FlowProject.vo.FirebaseVO;
import com.google.firebase.database.DataSnapshot;
import com.google.firebase.database.DatabaseError;
import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.FirebaseDatabase;
import com.google.firebase.database.ValueEventListener;

@Service
public class FirebaseServiceImpl implements FirebaseService {
	
	private DatabaseReference mDatabase = FirebaseDatabase.getInstance().getReference();
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Override
	public FirebaseVO getAllData() {
		return null;
	}

	@Override
	public FirebaseVO getSearchData(int portNum) {
		FirebaseVO data = new FirebaseVO();
		mDatabase.child(Integer.toString(portNum)).child("2018-09-06 19:27").addListenerForSingleValueEvent(
				new ValueEventListener() {
		            @Override
		            public void onDataChange(DataSnapshot dataSnapshot) {
//		            	data.setPortNum(dataSnapshot.child("portNum").getValue(Integer.class));
//		            	data.setUse(dataSnapshot.child("use").getValue(Long.class));
//		            	data.setTime(dataSnapshot.child("time").getValue(String.class));
		            }

		            @Override
		            public void onCancelled(DatabaseError databaseError) {
		        		logger.error("getUser:onCancelled", databaseError.toException());
		            }
		        });

		return data;
	}
	
	
	
	// 파이어베이스 설계시 use와 누적을 같이 얻어올수 있게 설계
	@Override
	public DeferredResult<Map<String,FirebaseVO>> getSearchData(LocalDate date) {
		DeferredResult<Map<String,FirebaseVO>> result = new DeferredResult<>();
		String year = Integer.toString(date.getYear());
		String month = Integer.toString(date.getMonthValue());
		String day = Integer.toString(date.getDayOfMonth());
		String path = "flowData/17/" + year + "/" + month + "/17";
		mDatabase.child(path).addListenerForSingleValueEvent(
				new ValueEventListener() {
		            @Override
		            public void onDataChange(DataSnapshot dataSnapshot) {
		            	
		            	Map<String,FirebaseVO> lData = new TreeMap<String, FirebaseVO>();
		            	for(DataSnapshot ds : dataSnapshot.getChildren()) {
							String kName = ds.getKey();
							FirebaseVO data = dataSnapshot.child(kName).getValue(FirebaseVO.class);
							//logger.info(data.toString());
							lData.put(kName, data);
		            	}
		            	result.setResult(lData);
		            }
		            	
		            @Override
		            public void onCancelled(DatabaseError databaseError) {
		        		logger.error("getUser:onCancelled", databaseError.toException());
		            }
		        });

		return result;
	}

}
