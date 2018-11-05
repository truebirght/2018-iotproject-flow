<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Login V1</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" type="text/css" href="resources/vendor/bootstrap/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css" href="resources/fonts/login_fonts/font-awesome-4.7.0/css/font-awesome.min.css">

<link rel="stylesheet" type="text/css" href="resourcesvendor/animate/animate.css">

<link rel="stylesheet" type="text/css" href="resources/css/login_css/login.css">
<link rel="stylesheet" type="text/css" href="resources/css/login_css/util.css">
</head>
<body>
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<div class="login100-pic js-tilt" data-tilt>
					<img src="resources/img/login_img.png" alt="IMG">
				</div>

				<form class="login100-form validate-form">
					<span class="login100-form-title"> Member Login </span>

					<div class="wrap-input100 validate-input" data-validate="Valid email is required: ex@abc.xyz">
						<input class="input100" type="text" id="email" placeholder="Email"> <span class="focus-input100"></span> <span class="symbol-input100"> <i class="fa fa-envelope" aria-hidden="true"></i>
						</span>
					</div>

					<div class="wrap-input100 validate-input" data-validate="Password is required">
						<input class="input100" type="password" id="pass" placeholder="Password"> <span class="focus-input100"></span> <span class="symbol-input100"> <i class="fa fa-lock" aria-hidden="true"></i>
						</span>
					</div>

					<div class="container-login100-form-btn">
						<input type="button" class="login100-form-btn" value="Login" id="BTN_SIGNIN" />
					</div>

					<div class="text-center p-t-136">
						<a class="txt2" href="signup"> Create your Account <i class="fa fa-long-arrow-right m-l-5" aria-hidden="true"></i>
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
	</script>
	<script type="text/javascript">
	/* 인증 상태 변화 감시하기 */
	
	var URL = "/?port=";
	var today = new Date();
	var getDay = 32 - new Date(today.getFullYear(), today.getMonth(), 32).getDate();
	var date = today.getFullYear() + '/' + (today.getMonth() + 1) + '/';
	
    firebase.auth().onAuthStateChanged(function(user) {
	   
	 if (user) { // 인증되었을 때
		 URL += user.displayName + '&startDate=' + date + '01&endDate=' + date + getDay;
	 	 location.href = URL;
	 }
   });
   
   /* 로그인 버튼 클릭시 처리하기 */
   $('#BTN_SIGNIN').click(function(){
	 var signin_mail = $('#email').val();
	 var signin_password = $('#pass').val();

	 firebase.auth().signInWithEmailAndPassword(signin_mail, signin_password).then(function(){
	 // 메일 회원  로그인 성공으로 간주 = onAuthStateChanged()가 동작함
		  location.reload();
	 }).catch(function(error) {
	 // 회원 로그인에 실패 했을 경우
	   alert("로그인에 실패하셨습니다. 관리자에게 문의하세요.");
	 });
   });
   
   /* 로그아웃 버튼 클릭시 */
   $('#BTN_LOGOUT').click(function(){
   		firebase.auth().signOut().then(function(){
   			location.href = "login";
   		},function(error){
   			alert("로그아웃에 실패하셨습니다. 관리자에게 문의하세요.");
   		})
   });
 </script>
</body>
</html>