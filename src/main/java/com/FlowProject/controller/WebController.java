package com.FlowProject.controller;

import org.springframework.stereotype.Controller;
@Controller
public class WebController {
//	@Autowired
//	ChartjsService cs;
//	
//	private Logger logger = LoggerFactory.getLogger(this.getClass());
//	/*
//	@RequestMapping("/getDatas")
//	@ResponseBody
//	public DeferredResult<Map<String,FirebaseVO>> getDatas(){
//		//LocalDate start = LocalDate.now();
//		logger.info(start.toString());
//		FirebaseVO data = fs.getSearchData(22);
//		return fs.getSearchData(start);
//	}
//	
//	@RequestMapping("/")
//	public String index(Model model) throws InterruptedException, IOException{
//		//DeferredResult<String> viewName = new DeferredResult<>();
//		LocalDate today = LocalDate.now();
//		FirebaseVO data = fs.getSearchData(22);
//		final DeferredResult<Map<String,FirebaseVO>> result = fs.getSearchData(today);
//		while(result.hasResult() == false) {
//			Thread.currentThread().sleep(100);
//		}
//		model.addAttribute("list",result.getResult());
//		model.addAttribute("json",cs.chartToJson());
//
//		return "indexExample";
//	}*/
//	
//	@SuppressWarnings("unchecked")
//	@RequestMapping("/")
//	public String test(Model model) throws Exception {
//	    RestTemplate template = new RestTemplate();
//	    int year = YearMonth.now().getYear();
//	    int month = YearMonth.now().getMonthValue();
//		List<Integer> lastYearData = template.getForObject("https://us-central1-flow-3191.cloudfunctions.net/yearLitter?port=18&date=" + (year - 1), List.class);
//	    List<Integer> thisYearData = template.getForObject("https://us-central1-flow-3191.cloudfunctions.net/yearLitter?port=18&date=" + year, List.class);
//	    List<Integer> lastYearMonthlyData = template.getForObject("https://us-central1-flow-3191.cloudfunctions.net/monthLitter?port=18&date=" + (year - 1) + '/' + month, List.class);
//	    List<Integer> thisYearMonthlyData = template.getForObject("https://us-central1-flow-3191.cloudfunctions.net/monthLitter?port=18&date=" + year + '/' + month, List.class);
//	    List<Integer> yearTotal = new ArrayList<Integer>();
//	    
//	    yearTotal.add(lastYearData.stream().reduce(0, (a,b) -> a+b));
//	    yearTotal.add(thisYearData.stream().reduce(0, (a,b) -> a+b));
//	    model.addAttribute("lastYearData", lastYearData);
//	    model.addAttribute("thisYearData", thisYearData);
//	    model.addAttribute("yearTotal", yearTotal);
//	    model.addAttribute("lastYearMonthlyData", lastYearMonthlyData);
//	    model.addAttribute("thisYearMonthlyData", thisYearMonthlyData);
//	    
//	    return "index";
//	}
}
