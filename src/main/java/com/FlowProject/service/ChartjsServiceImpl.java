package com.FlowProject.service;

import java.util.List;

import org.springframework.stereotype.Service;

import be.ceau.chart.BarChart;
import be.ceau.chart.color.Color;
import be.ceau.chart.data.BarData;
import be.ceau.chart.dataset.BarDataset;
@Service
public class ChartjsServiceImpl implements ChartjsService {
	
	public String chartToJson() {
		BarDataset dataset = new BarDataset()
				.setLabel("월별 사용량")
				.setData()
				.addBackgroundColors(Color.LIGHT_BLUE)
				.setData()
				.addBackgroundColors(Color.BLUE)
				.setBorderWidth(2);
	
		BarData data = new BarData()
				.addLabels("1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월")
				.addDataset(dataset);
	
		return new BarChart(data).toJson();
	}
}
