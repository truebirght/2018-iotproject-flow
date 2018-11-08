<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<title>Sign Up</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" type="text/css" href="resources/vendor/bootstrap/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css" href="resources/fonts/login_fonts/font-awesome-4.7.0/css/font-awesome.min.css">

<link rel="stylesheet" type="text/css" href="resources/vendor/animate/animate.css">

<link rel="stylesheet" type="text/css" href="resources/css/login_css/util.css">
<link rel="stylesheet" type="text/css" href="resources/css/login_css/login.css">
</head>
<body>
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<div class="login100-pic js-tilt" data-tilt>
					<img src="resources/img/login_img.png" alt="IMG">
				</div>
				<form:form modelAttribute="memberVO" action="/" method="POST" id="signupForm" class="login100-form validate-form">
					<span class="login100-form-title"> Create Account </span>

					<div class="wrap-input100 validate-input" data-validate="Valid email is required: ex@abc.xyz">
					<form:input path="userId" name="userId" type="email" cssClass="input100" placeholder="Email" id="userId"></form:input>
						<span class="symbol-input100"> <i class="fa fa-envelope" aria-hidden="true"></i>
						</span>
					</div>

					<div class="wrap-input100 validate-input" data-validate="Password is required">
						<input class="input100" type="password" id="pass" placeholder="Password"> <span class="focus-input100"></span> <span class="symbol-input100"> <i class="fa fa-lock" aria-hidden="true"></i>
						</span>
					</div>

					<div class="wrap-input100 validate-input" data-validate="Flow Port Number is required">
						<form:input path="flowPort" name="flowPort" cssClass="input100" placeholder="Flow Port Number" id="fportnum"></form:input>
						<span class="focus-input100"></span> <span class="symbol-input100"> <i class="fa fa-tint" aria-hidden="true"></i>
						</span>
					</div>

					<div class="wrap-input100 validate-input" data-validate="Valve Port Number is required">
						<form:input path="valvePort" name="valvePort" cssClass="input100" placeholder="Valve Port Number" id="vportnum"></form:input>
						<span class="focus-input100"></span> <span class="symbol-input100"> <i class="fa fa-tint" aria-hidden="true"></i>
						</span>
					</div>

					<div class="wrap-input100 validate-input" data-validate="Master Port Number is required">
						<form:input path="masterPort" name="masterPort" cssClass="input100" placeholder="Master Port Number" id="mportnum"></form:input>
						<span class="focus-input100"></span> <span class="symbol-input100"> <i class="fa fa-tint" aria-hidden="true"></i>
						</span>
					</div>

					<div class="wrap-input100 validate-input" data-validate="Caliber is required">
					<form:input path="caliber" name="caliber" cssClass="input100" placeholder="Caliber" id="caliber"></form:input>
						<span class="focus-input100"></span> <span class="symbol-input100"> <i class="fa fa-tint" aria-hidden="true"></i>
						</span>
					</div>
					
					<div class="wrap-input100 validate-input" data-validate="HouseNumber is required">
					<form:input path="houseNumber" name="houseNumber" cssClass="input100" placeholder="houseNumber" id="houseNumber"></form:input>
						<span class="focus-input100"></span> <span class="symbol-input100"> <i class="fa fa-tint" aria-hidden="true"></i>
						</span>
					</div>
					
					<form:input path="regDate" name="regDate" cssClass="input100" id="regDate" type="hidden"></form:input>

					<div class="container-login100-form-btn">
						<button type="button" class="login100-form-btn" id="BTN_SIGNUP" >Sign up</button>
					</div>

					<div class="text-center p-t-136">
						<a class="txt2" href="login"> Login <i class="fa fa-long-arrow-right m-l-5" aria-hidden="true"></i>
						</a>
					</div>
				</form:form>
			</div>
		</div>
	</div>




	<!--===============================================================================================-->
	<script src="resources/vendor/jquery/jquery-3.2.1.min.js"></script>

	<script src="resources/vendor/tilt/tilt.jquery.min.js"></script>
	<script>
		$('.js-tilt').tilt({
			scale: 1.1
		})
	</script>
	<script src="https://www.gstatic.com/firebasejs/3.1.0/firebase.js"></script>
	<script src="https://www.gstatic.com/firebasejs/3.1.0/firebase-app.js"></script>
	<script src="https://www.gstatic.com/firebasejs/3.1.0/firebase-auth.js"></script>
	<script src="https://www.gstatic.com/firebasejs/3.1.0/firebase-database.js"></script>
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
	</script>
	<script type="text/javascript">
	var URL = "/?";
	var today = new Date();
	var getDay = 32 - new Date(today.getFullYear(), today.getMonth(), 32).getDate();
	var date = today.getFullYear() + '/' + today.getMonth() + '/';
	
   firebase.auth().onAuthStateChanged(function(user) {
	 if (user) { 
		 //URL += '&startDate=' + date + '01&endDate=' + date + getDay;
		 //location.href = URL;
	 } else {
	 }
   });


   $('#BTN_SIGNUP').click(function(){
	var signup_email = $('#userId').val();
	var signup_password = $('#pass').val();
	var signup_fportnum = $('#fportnum').val();
	var signup_vportnum = $('#vportnum').val();
	var signup_mportnum = $('#mportnum').val();
	var signup_caliber = $('#caliber').val();	
	var signup_houseNumber = $('#houseNumber').val();
	 firebase.auth().createUserWithEmailAndPassword(signup_email, signup_password).then(function(){
	   	  var today = new Date();
	   	  var dd = today.getDate();
	   	  var mm = today.getMonth() + 1;
	   	  var yyyy = today.getFullYear();
	   	  
	   	  dd = dd < 10 ? '0' + dd : dd;
	   	  mm = mm < 10 ? '0' + mm : mm;
	   	  
	   	  today = yyyy + '/' + mm + '/' + dd;
	   	  
	   	  $('#regDate').val(today);
		  signup_email = signup_email.replace('.', '!');
		  signup_email = signup_email.replace('@', '_');
		  firebase.database().ref('/UserData/ID/' + signup_email).set({
			  userId : signup_email,
			  flowPort: signup_fportnum,
			  valvePort: signup_vportnum,
			  masterPort: signup_mportnum,
			  caliber: signup_caliber,
			  regDate: today,
			  houseNumber: signup_houseNumber
		  });
		  firebase.database().ref('/ControlData/' + signup_vportnum).set({
			  lock : 'off'
		  });
		  alert("성공적으로 가입되었습니다.");
		  $('#signupForm').submit();
	
	 }).catch(function(error) {

		 alert(error);
	 });
   });
 </script>
</body>
</html>