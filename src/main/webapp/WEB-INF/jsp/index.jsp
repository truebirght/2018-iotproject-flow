<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html class="wf-montserrat-n3-active wf-montserrat-n4-active wf-montserrat-n5-active wf-montserrat-n6-active wf-montserrat-n7-active wf-roboto-n3-active wf-roboto-n4-active wf-roboto-n5-active wf-roboto-n6-active wf-roboto-n7-active wf-active">
<head>
<title>Flow 온라인 수도 검침</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="description" content="Latest updates and statistic charts">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no">
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha256-3edrmyuQ0w65f8gfBsqowzjJe2iM6n0nKciPUp8y+7E=" crossorigin="anonymous"></script>

<!-- bootstrap-toggle -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>



<!-- Chartjs -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js"></script>
<script type="text/javascript" src="/resources/js/Chart.roundedBarCharts.min.js"></script>
<script type="text/javascript" src="/resources/js/moment.js"></script>

<link rel="stylesheet" type="text/css" href="/resources/css/switch.css">
<script type="text/javascript" src="/resources/js/switch.js"></script>

<!--begin::Web font -->
<script src="https://ajax.googleapis.com/ajax/libs/webfont/1.6.16/webfont.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600,700%7CRoboto:300,400,500,600,700" media="all">
<script>
        WebFont.load({
            google: {"families":["Montserrat:300,400,500,600,700","Roboto:300,400,500,600,700"]},
            active: function() {
                sessionStorage.fonts = true;
            }
          });
        </script>
<!--end::Web font -->

<!--begin::Global Theme Styles -->
<link href="/resources/css/vendors.bundle.css" rel="stylesheet" type="text/css">
<link href="/resources/css/style.bundle.css" rel="stylesheet" type="text/css">
<!--end::Global Theme Styles -->

<!--begin::Page Vendors Styles -->
<link href="/resources/css/fullcalendar.bundle.css" rel="stylesheet" type="text/css">
<link href="/resources/css/line-awesome.min.css" rel="stylesheet" type="text/css">
<link href="/resources/css/line-awesome-font-awesome.min.css" rel="stylesheet" type="text/css">
<!--end::Page Vendors Styles -->
<link href="/resources/css/index.css" rel="stylesheet" type="text/css">
<link rel="shortcut icon" href="/resources/img/favicon.png">





</head>
<body class="m-page--boxed m-body--fixed m-header--static m-aside--offcanvas-default">
	<div class="m-grid m-grid--hor m-grid--root m-page">

		<header id="m_header" class="m-grid__item	m-grid m-grid--desktop m-grid--hor-desktop  m-header ">
			<div class="m-grid__item m-grid__item--fluid m-grid m-grid--desktop m-grid--hor-desktop m-container m-container--responsive m-container--xxl">
				<div class="m-grid__item m-grid__item--fluid m-grid m-grid--desktop m-grid--ver-desktop m-header__wrapper">
					<!-- begin::Brand -->
					<div class="m-grid__item m-brand">
						<div class="m-stack m-stack--ver m-stack--general m-stack--inline left">
							<div class="m-stack__item m-stack__item--middle m-brand__logo">
								<a class="m-brand__logo-wrapper"> <img alt="" src="/resources/img/logo.png"> <span id="logoText">&nbsp;Flow 온라인 수도 검침</span>
								</a>
							</div>
						</div>

						<div class="m-stack m-stack--ver m-stack--general m-stack--inline right">
							<div class="table-cell">
								<button id="btnLogout" class="btn btn-outline-metal m-btn  m-btn--icon m-btn--pill">Logout</button>
							</div>
						</div>
					</div>

				</div>
			</div>
		</header>

		<div class="m-grid__item m-grid__item--fluid m-grid m-grid m-grid--hor m-container m-container--responsive m-container--xxl">
			<div class="m-grid__item m-grid__item--fluid m-grid m-grid--hor-desktop m-grid--desktop m-body">
				<div class="m-grid__item m-body__nav">


					<div class="m-stack m-stack--ver m-stack--desktop">
						<div class="m-stack__item m-stack__item--middle m-dropdown m-dropdown--arrow m-dropdown--large m-dropdown--mobile-full-width m-dropdown--align-right m-dropdown--skin-light m-header-search m-header-search--expandable m-header-search--skin-">

							<form class="m-header-search__form">
								<div class="m-header-search__wrapper">
									<span class="m-header-search__icon-search" id="m_quicksearch_search"> <i class="la la-search"></i>
									</span> <span class="m-header-search__input-wrapper"> <input autocomplete="off" type="text" name="q" class="m-header-search__input" value="" placeholder="Search..." id="m_quicksearch_input">
									</span> <span class="m-header-search__icon-close" id="m_quicksearch_close"> <i class="la la-remove"></i>
									</span> <span class="m-header-search__icon-cancel" id="m_quicksearch_cancel"> <i class="la la-times"></i>
									</span>
								</div>
							</form>

							<div class="m-dropdown__wrapper" style="z-index: 101;">
								<div class="m-dropdown__inner">
									<div class="m-dropdown__body">
										<div class="m-dropdown__scrollable m-scrollable m-scroller ps" data-scrollable="true" data-height="300" data-mobile-height="200" style="height: 300px; overflow: hidden;">
											<div class="m-dropdown__content m-list-search m-list-search--skin-light"></div>
											<div class="ps__rail-x" style="left: 0px; bottom: 0px;">
												<div class="ps__thumb-x" tabindex="0" style="left: 0px; width: 0px;"></div>
											</div>
											<div class="ps__rail-y" style="top: 0px; right: 4px;">
												<div class="ps__thumb-y" tabindex="0" style="top: 0px; height: 0px;"></div>
											</div>
										</div>
									</div>
								</div>
							</div>

						</div>
					</div>
				</div>

				<div class="m-grid__item m-grid__item--fluid m-grid m-grid--desktop m-grid--ver-desktop m-body__content">

					<div class="m-grid__item m-grid__item--fluid m-wrapper">

						<div class="m-subheader">
							<div class="d-flex align-items-center">
								<div class="mr-auto">
									<h3 class="m-subheader__title ">사용량 그래프</h3>
								</div>

								<div>
									<label class="checkbox-inline" for="toggleBtn">밸브 상태</label>
									<input type="checkbox" id="toggleBtn" class="checkbox-switch">
									
								</div>


								<div>
									<span class="m-subheader__daterange" id="m_dashboard_daterangepicker"> <span class="m-subheader__daterange-label"> <span class="m-subheader__daterange-title">Today:</span> <span class="m-subheader__daterange-date m--font-brand" id="printDate"></span>
									</span> <a href="#" class="btn btn-sm btn-brand m-btn m-btn--icon m-btn--icon-only m-btn--custom m-btn--pill"> <i class="la la-angle-down"></i>
									</a>
									</span>
								</div>
							</div>
						</div>

						<div class="m-content">

							<div class="m-portlet">
								<div class="m-portlet__body  m-portlet__body--no-padding">
									<div class="row m-row--no-padding m-row--col-separator-xl">
										<div class="col-xl-12">
											<div class="m-widget14">
												<div class="m-widget14__header m--margin-bottom-30">
													<h3 class="m-widget14__title">일별 수도 사용량</h3>
												</div>

												<div class="canvasDiv">
													<canvas id="dailyChart" class="chartjsChart"></canvas>
												</div>

											</div>
										</div>
									</div>
								</div>
							</div>

							<div class="row">
								<div class="col-xl-12">
									<div class="m-portlet m-portlet--full-height m-portlet--skin-light m-portlet--fit  m-portlet--rounded">
										<div class="m-widget14">
											<div class="m-widget14__header m--margin-bottom-30">
												<h3 class="m-widget14__title">선택 수도 사용량</h3>
											</div>
											<div class="canvasDiv">
												<canvas id="selectChart" class="chartjsChart"></canvas>
											</div>
										</div>
									</div>
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>

		<footer class="m-grid__item m-footer">
			<div class="m-container m-container--responsive m-container--xxl">

				<div class="m-footer__wrapper">
					<div class="m-stack m-stack--flex-tablet-and-mobile m-stack--ver m-stack--desktop">
						<div class="m-stack__item m-stack__item--left m-stack__item--middle m-stack__item--last">
							<span class="m-footer__copyright"> 2018 Seoul Hoseo Career College </span>
						</div>

					</div>
				</div>
			</div>
		</footer>
	</div>
	
	
	<form:form modelAttribute="memberVO" action="/" method="POST" id="indexForm">
		<form:input path="userId" name="userId" type="email" placeholder="Email" id="userId"></form:input>
		<form:input path="flowPort" name="flowPort" placeholder="Flow Port Number" id="fportnum"></form:input>
		<form:input path="valvePort" name="valvePort"  placeholder="Valve Port Number" id="vportnum"></form:input>
		<form:input path="masterPort" name="masterPort" placeholder="Master Port Number" id="mportnum"></form:input>
		<form:input path="caliber" name="caliber" placeholder="Caliber" id="caliber"></form:input>
		<form:input path="regDate" name="regDate" id="regDate"></form:input>
		<form:input path="startDate" name="startDate" id="startDate"></form:input>
		<form:input path="endDate" name="endDate" id="endDate"></form:input>
		<form:input path="houseNumber" name="houseNumber" id="houseNumber"></form:input>
	</form:form>
	
	
	

	<script src="/resources/js/vendors.bundle.js" type="text/javascript"></script>
	<script src="/resources/js/scripts.bundle.js" type="text/javascript"></script>
	<script src="/resources/js/fullcalendar.bundle.js" type="text/javascript"></script>
	<!-- <script src="/resources/js/dashboard.js" type="text/javascript"></script> -->
	<script src="https://www.gstatic.com/firebasejs/3.1.0/firebase.js"></script>
	<script src="https://www.gstatic.com/firebasejs/3.1.0/firebase-app.js"></script>
	<script src="https://www.gstatic.com/firebasejs/3.1.0/firebase-auth.js"></script>
	<script>
 // Initialize Firebase
 var config = {
   apiKey: "AIzaSyAFW0hE15CrQtjBrW-c6jFR6f79OwYqL00",
   authDomain: "flow-3191.firebaseapp.com",
   databaseURL: "https://flow-3191.firebaseio.com",
   projectId: "flow-3191",
   storageBucket: "flow-3191.appspot.com",
   messagingSenderId: "272459175294"
 };
 firebase.initializeApp(config);
/* 로그아웃 버튼 클릭시 */
$('#btnLogout').click(function(){
	firebase.auth().signOut().then(function(){
		location.href = "login";
	},function(error){
		alert("로그아웃에 실패하셨습니다. 관리자에게 문의하세요.");
	})
});

function addComma(num) {
  var regexp = /\B(?=(\d{3})+(?!\d))/g;
  return num.toString().replace(regexp, ',');
}
var selectDateDataKey = ${selectDateDataKey};

var selectDateTotalTax = ${myTax}
selectDateTotalTax = selectDateDataKey[0] + ' ~ ' + selectDateDataKey[selectDateDataKey.length - 1]
	+ ' 사용 요금 : ' + addComma(selectDateTotalTax) + '원';

/* 인증 상태 변화 감시하기 */
var today = new Date();
var getDay = 32 - new Date(today.getFullYear(), today.getMonth(), 32).getDate();
var regDate = $('#regDate').val();
var todayFMT = moment().format('YYYY/MM/DD');;
firebase.auth().onAuthStateChanged(function(user) {
	if (user) { // 인증되었을 때
	} else {
		location.href = "login";
	}
});

var userId = $('#userId').val();
var checkLock = ${checkLock};
var vPort = $('#vportnum').val();

var status = (checkLock === "on") ? "off" : "on";
var bool = (checkLock === "on") ? true : false;
var keys;
var checkList = [];
var el = document.querySelector('.checkbox-switch');
var mySwitch = new Switch(el, {
	checked: bool,
	showText: true,
	onText : 'O',
	offText : 'X',
	onChange : function(){
	$.ajax({
	        url : '/Valve/' + vPort + '/' + status,
	        type : 'POST',
	        data : checkList,
	        dataType:"json",
	        success: function(data) {
	        	if(data.length==0)
	        		alert("결과가 없습니다");
	        	else {
	        		checkList = data;
	        		status = (checkList.status === "on") ? "off" : status = "on";
	        		
	        	}
	        },
	        error:function(request,status,error){
	    	  console.log(error)
	        }
	    });
	}
});

var t = moment();
var a = moment();
var e = $("#m_dashboard_daterangepicker");
	e.daterangepicker({
		startDate: t,
		endDate: a,
		opens: "left",
		autoUpdateInput: true,
		locale: {
		    format: 'YYYY/M/DD'
		},
		dateLimit: {
		        months: '2'
		},
		minDate: regDate,
		maxDate: todayFMT,
		ranges: {
		    "Last Month": [moment().subtract(1, "month").startOf("month"), moment().subtract(1, "month").endOf("month")],
		    "Last Year": [moment().subtract(1, "year").startOf("month"), moment().subtract(1, "year").endOf("month")]
		}
	}, r), r(t, a, "");

	function r(t, a, r) {
		var o = "",
		n = "";
		a - t < 100 || "Today" == r ? (o = "Today:", n = t.format("MMM D")) : "Yesterday" == r ? (o = "Yesterday:", n = t.format("MMM D")) : n = t.format("MMM D") + " - " + a.format("MMM D"), e.find(".m-subheader__daterange-date").html(n), e.find(".m-subheader__daterange-title").html(o)
	}
	
$(document).ready(function(){
	$('.applyBtn').click(function() {
		$('#startDate').val($('[name="daterangepicker_start"]').val());
		$('#endDate').val($('[name="daterangepicker_end"]').val());
		$('#indexForm').submit();
	});
	
	$('[data-range-key="Last Month"], [data-range-key="Last Year"]').click(function() {
		$('#startDate').val($('[name="daterangepicker_start"]').val());
		$('#endDate').val($('[name="daterangepicker_end"]').val());
		$('#indexForm').submit();
	});
			
});

</script>

	<script charset='utf-8'>
	var ctx1 = $('#dailyChart');
	var dailyChart = new Chart(ctx1, {
		type: 'line',
		data: {
			labels: ${thisYearMonthlyDataKey},
			datasets: [{
				label: '사용량',
				data: ${thisYearMonthlyDataValue},
				borderColor: "#3e95cd",
				fill: false
			}]
		},
		options: {
			responsive: true,
			barRoundness: 0,
            legend: {
               // onClick: (e) => e.stopPropagation()
            	display: true
            },
            title: {
                display: true,
                fontSize: 22,
                text: (today.getMonth() + 1) + '월 일간 사용량'
            }
		}
	});
	
	var ctx2 = $('#selectChart');
	var selectChart = new Chart(ctx2, {
		type: 'line',
		data: {
			labels: selectDateDataKey,
		    datasets: [{
		          label: '사용량',
		          data: ${selectDateDataValue},
		          borderColor: "#3e95cd",
		          fill: false
		        }]
		    },
		    options: {
				responsive: true,
				barRoundness: 0,
	            legend: {
	               // onClick: (e) => e.stopPropagation()
	            	display: true
	            },
	            title: {
	                display: true,
	                fontSize: 22,
	                text: selectDateTotalTax
	            }
			}
		});
	
	
	
	
	
	
</script>
</body>
</html>