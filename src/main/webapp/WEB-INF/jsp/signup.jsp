<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

				<form class="login100-form validate-form">
					<span class="login100-form-title"> Create Account </span>

					<div class="wrap-input100 validate-input" data-validate="Valid email is required: ex@abc.xyz">
						<input class="input100" type="text" id="email" placeholder="Email"> <span class="focus-input100"></span> <span class="symbol-input100"> <i class="fa fa-envelope" aria-hidden="true"></i>
						</span>
					</div>

					<div class="wrap-input100 validate-input" data-validate="Password is required">
						<input class="input100" type="password" id="pass" placeholder="Password"> <span class="focus-input100"></span> <span class="symbol-input100"> <i class="fa fa-lock" aria-hidden="true"></i>
						</span>
					</div>

					<div class="wrap-input100 validate-input" data-validate="Port Number is required">
						<input class="input100" type="text" id="portnum" placeholder="Port Number"> <span class="focus-input100"></span> <span class="symbol-input100"> <i class="fa fa-tint" aria-hidden="true"></i>
						</span>
					</div>

					<div class="container-login100-form-btn">
						<input type="button" class="login100-form-btn" value="Sign Up" id="BTN_SIGNUP" />
					</div>

					<div class="text-center p-t-136">
						<a class="txt2" href="login"> Login <i class="fa fa-long-arrow-right m-l-5" aria-hidden="true"></i>
						</a>
					</div>
				</form>
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

	<!-- firebase SDK ¸µÅ© -->
	<script src="https://www.gstatic.com/firebasejs/3.1.0/firebase.js"></script>
	<script src="https://www.gstatic.com/firebasejs/3.1.0/firebase-app.js"></script>
	<script src="https://www.gstatic.com/firebasejs/3.1.0/firebase-auth.js"></script>
	<script>
	// Initialize Firebase
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
	<script type="text/javascript">
	var URL = "/?port=";
   firebase.auth().onAuthStateChanged(function(user) {
	 if (user) { 
		 URL += user.displayName;
		 location.href = URL;
	 } else {
	 }
   });


   $('#BTN_SIGNUP').click(function(){
	var signup_email = $('#email').val();
	var signup_password = $('#pass').val();
	var signup_portnum = $('#portnum').val();
	 firebase.auth().createUserWithEmailAndPassword(signup_email, signup_password).then(function(){
	   	  var today = new Date();
	   	  var dd = today.getDate();
	   	  var mm = today.getMonth() + 1;
	   	  var yyyy = today.getFullYear();
	   	  
	   	  dd = dd < 10 ? '0' + dd : dd;
	   	  mm = mm < 10 ? '0' + mm : mm;
	   	  
	   	  today = yyyy + '/' + mm + '/' + dd;
	   	  
	   	  
		  var user = firebase.auth().currentUser;
		  
		  user.updateProfile({
		    displayName: signup_portnum,
		    photoURL: today
		  }).then(function() {
			  alert("성공적으로 가입되었습니다.");
			  location.reload();
		  }).catch(function(error) {
			  alert("회원가입에 실패하셨습니다. 관리자에게 문의하세요.");
		  });
	
	 }).catch(function(error) {

		 alert("회원가입에 실패하셨습니다. 관리자에게 문의하세요.");
	 });
   });
 </script>
</body>
</html>