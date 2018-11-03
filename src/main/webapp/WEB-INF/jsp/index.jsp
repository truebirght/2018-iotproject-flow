<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html class="wf-montserrat-n3-active wf-montserrat-n4-active wf-montserrat-n5-active wf-montserrat-n6-active wf-montserrat-n7-active wf-roboto-n3-active wf-roboto-n4-active wf-roboto-n5-active wf-roboto-n6-active wf-roboto-n7-active wf-active">
<head>
<title>Flow 온라인 수도 검침</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="description" content="Latest updates and statistic charts">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no">
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha256-3edrmyuQ0w65f8gfBsqowzjJe2iM6n0nKciPUp8y+7E=" crossorigin="anonymous"></script>
<!-- Chartjs -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js"></script>
<script type="text/javascript" src="/resources/js/Chart.roundedBarCharts.min.js"></script>
<script src="https://cdn3.devexpress.com/jslib/18.1.6/js/dx.all.js" integrity="sha384-f8Cq8uEDm21R8+MKf8MuiefjIrLboOVKaP7zxk96z5s6gXMHZ04U2RKdHrsu3WGg sha512-YEEIPZTk1Gkw4WCq1c25EqVxocCj4GFsOnzPnHAR3zm4jiAefQ8dBM48ypb+6BW/sb+9qFa5ljX+AYOnMrFbEA==" crossorigin="anonymous"></script>
<script type="text/javascript" src="/resources/js/moment.js"></script>

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


<style>
</style>
</head>
<body class="m-page--boxed m-body--fixed m-header--static m-aside--offcanvas-default">
	<div class="m-grid m-grid--hor m-grid--root m-page">

		<header id="m_header" class="m-grid__item	m-grid m-grid--desktop m-grid--hor-desktop  m-header ">
			<div class="m-grid__item m-grid__item--fluid m-grid m-grid--desktop m-grid--hor-desktop m-container m-container--responsive m-container--xxl">
				<div class="m-grid__item m-grid__item--fluid m-grid m-grid--desktop m-grid--ver-desktop m-header__wrapper">
					<!-- begin::Brand -->
					<div class="m-grid__item m-brand">
						<div class="m-stack m-stack--ver m-stack--general m-stack--inline">
							<div class="m-stack__item m-stack__item--middle m-brand__logo">
								<a class="m-brand__logo-wrapper"> <img alt="" src="/resources/img/logo.png"> <span id="logoText">&nbsp;Flow 온라인 수도 검침</span>
								</a>
							</div>
						</div>
					</div>


					<div class="m-grid__item m-grid__item--fluid m-header-head" id="m_header_nav">
						<div class="m-stack__item m-topbar__nav-wrapper">
							<button id="btnLogout" class="btn btn-primary m-btn m-btn--icon m-btn--wide m-btn--air m-btn--custom">
								<span> <i class="la la-mail-reply"></i> <span>Logout</span>
								</span>
							</button>
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
												<canvas id="dailyChart"></canvas>

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
											<canvas id="selectChart"></canvas>
										</div>
									</div>
								</div>
							</div>

							<div class="row">
								<div class="col-xl-12">
									<div class="m-portlet m-portlet--full-height m-portlet--skin-light m-portlet--fit  m-portlet--rounded">
										<div class="m-widget14">
											<div class="m-widget14__header m--margin-bottom-50">
												<h3 class="m-widget14__title">실시간 게이지</h3>
											</div>
											<div id="gaugeChart" class="m-widget14__chart"></div>
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

	<script charset='utf-8'>
var today = new Date();
var getDay = 32 - new Date(today.getFullYear(), today.getMonth(), 32).getDate();
var dayList = [];
for(i = 1; i <= getDay; i++) { dayList.push(i+'일'); }
$('#printDate').text(moment(today).format("MMM") + ' ' + today.getDate());

	var ctx1 = $('#selectChart');
	var yearlyChart = new Chart(ctx1, {
		type: 'bar',
		data: {
			labels: ['2018년'],
		    datasets: [
		    	{
		          label: "연별 사용량",
		          backgroundColor: ['#3cba9f', '#3e95cd'],
		          borderWidth: 1,
		          data: ${thisYearMonthlyData}
		        }
		      ]
		    },
		options: {
			cornerRadius: 20,
			responsive: true,
            legend: {
               // onClick: (e) => e.stopPropagation()
            	display: false
            },
            scales: {
            	xAxes: [{
            		barPercentage : 0.5,
            		categoryPercentage: 0.5,
            		gridLines: {
           	        	display: false,
           	        	color: 'black'
           	        }
            	}],
                yAxes: [{
                	gridLines: {
                        display: false,
                        color: 'black'
                    }
                }]
            }
		}
	});
	
	var ctx2 = $('#dailyChart');
	var dailyChart = new Chart(ctx2, {
		type: 'line',
		data: {
			labels: dayList,
			datasets: [
			{
				label: '올해 사용량',
				data: ${thisYearMonthlyData},
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
	
	
	$('#gaugeChart').dxCircularGauge({
		scale: {
			startValue: 0,
			endValue: 100,
			majorTick: {
				tickInterval: 10
			},
			label: {
				customizeText: function (arg) {
					return arg.valueText + ' %';
				}
			}
		},
		rangeContainer: {
			ranges: [
				{ startValue: 0, endValue: 20, color: '#CE2029' },
				{ startValue: 20, endValue: 50, color: '#FFD700' },
				{ startValue: 50, endValue: 100, color: '#228B22' }
			],
			width: 10
		},
		value: 45,
	});
</script>

	<script src="/resources/js/vendors.bundle.js" type="text/javascript"></script>
	<script src="/resources/js/scripts.bundle.js" type="text/javascript"></script>
	<script src="/resources/js/fullcalendar.bundle.js" type="text/javascript"></script>
	<script src="/resources/js/dashboard.js" type="text/javascript"></script>
	<!-- firebase SDK ë§í¬ -->
	<script src="https://www.gstatic.com/firebasejs/3.1.0/firebase.js"></script>
	<script src="https://www.gstatic.com/firebasejs/3.1.0/firebase-app.js"></script>
	<script src="https://www.gstatic.com/firebasejs/3.1.0/firebase-auth.js"></script>
	<script>
	// Initialize Firebase
	/* 파이어 베이스 연결 정보 */
	var url = "/?port=";
	var config = {
	  apiKey: "AIzaSyAUsfzFxB0EXOMvHPO9JWUeiWWsvlLme5c",
	  authDomain: "liters-aaa.firebaseapp.com",
	  databaseURL: "https://liters-aaa.firebaseio.com",
	  projectId: "liters-aaa",
	  storageBucket: "liters-aaa.appspot.com",
	  messagingSenderId: "257203396435"
	};
	firebase.initializeApp(config);
</script>

	<script>
/* 로그아웃 버튼 클릭시 */
 * 
 */
$('#btnLogout').click(function(){
	firebase.auth().signOut().then(function(){
		location.href = "login";
	},function(error){
		alert("로그아웃에 실패하셨습니다. 관리자에게 문의하세요.");
	})
});

/* 인증 상태 변화 감시하기 */
var url = "/?port=";
firebase.auth().onAuthStateChanged(function(user) {
	if (user) { // 인증되었을 때
		 url += user.displayName;
	} else {
		location.href = "login";
	}
});

$(document).ready(function(){
	$('.applyBtn').click(function() {
		startDate = $('[name="daterangepicker_start"]').val();
		endDate = $('[name="daterangepicker_end"]').val();
		location.href = url + "&startDate=" + startDate + "&endDate=" + endDate;
	});
	
	$('[data-range-key="Today"], [data-range-key="Yesterday"], [data-range-key="Last 7 Days"], [data-range-key="This Month"], [data-range-key="Last Month"]').click(function() {
		startDate = $('[name="daterangepicker_start"]').val();
		endDate = $('[name="daterangepicker_end"]').val();
		location.href = url + "&startDate=" + startDate + "&endDate=" + endDate;
	});
			
});
</script>
</body>
</html>