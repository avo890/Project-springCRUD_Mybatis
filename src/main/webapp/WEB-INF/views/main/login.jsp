<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원로그인</title>

<link href="./css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="./css/login3.css">
<script src="./js/jquery-3.5.1.min.js" type="text/javascript"></script>
<script src="./js/bootstrap.min.js" type="text/javascript"></script>
<script src="./js/jquery.validate.min.js" type="text/javascript"></script>
<script src="./js/validity.js" type="text/javascript"></script>




</head>
<body id="login">



	<h2>Welcome! Member Login</h2>
	<br>
	<div class="container" id="container">



		<div class="form-container sign-up-container">

			<h1>Create Account</h1>


			<div class="social-container">
				<a href="#" class="social"><i class="fab fa-facebook-f"></i></a> <a
					href="#" class="social"><i class="fab fa-google-plus-g"></i></a> <a
					href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
			</div>


			<span>or use your email for registration</span> <input type="text"
				placeholder="Name" /> <input type="email" placeholder="Email" /> <input
				type="password" placeholder="Password" />
			<button>Sign Up</button>

		</div>



		<div class="form-container sign-in-container">
			<form action="./Login" method="post" id="signupForm"
				enctype="application/x-www-form-urlencoded">
				<h1>Sign in</h1>
				<div class="social-container">
					<a
						href="https://accounts.kakao.com/login/?continue=https%3A%2F%2Flogins.daum.net%2Faccounts%2Fksso.do%3Frescue%3Dtrue%26url%3Dhttps%253A%252F%252Fwww.daum.net#login"
						class="social"><img src="./img/kakao-talk-line.png"> </a> <a
						href="https://accounts.google.com/v3/signin/identifier?dsh=S1644740842%3A1683099472515991&continue=https%3A%2F%2Fcontacts.google.com%2F%3Fhl%3Dko&followup=https%3A%2F%2Fcontacts.google.com%2F%3Fhl%3Dko&hl=ko&ifkv=Af_xneHOZgnfMlnJmJRwrXr48VfJvUGpjAB3nrGI7Fzat5wekNsXocGFt3RxcfxsKZVuMUyUwxBqHg&passive=1209600&flowName=GlifWebSignIn&flowEntry=ServiceLogin"
						class="social"><img src="./img/google-line.png"></a> <a
						href="https://nid.naver.com/nidlogin.login?mode=form&url=https%3A%2F%2Fwww.naver.com"
						class="social"><img src="./img/netflix-line.png"></a>
				</div>
				<input id="login" type="text" name="id" placeholder="아이디" /> <input
					id="login" type="password" name="password" placeholder="비밀번호" />
				<div class="row">
					<div>
						<a href="./SearchId">아이디 찾기</a>
						  &nbsp;&nbsp;
					</div>
					<div>
						<a href="./SearchPassword">  비밀번호 찾기</a>
						
					</div>
				</div>
				<br>
				<button>Sign In</button>
			</form>
		</div>




		<div class="overlay-container">

			<div class="overlay">
				<div class="overlay-panel overlay-left">
					<h1>Welcome Back!</h1>
					<p>To keep connected with us please login with your personal
						info</p>
					<button class="ghost" id="signIn">Sign In</button>
				</div>


				<div class="overlay-panel overlay-right">
					<form action="./MemberInsertView" method="post"
						enctype="application/x-www-form-urlencoded">
						<h1>Hello, Friend!</h1>
						<br><img src="./img/newlogoColor.jpg" style="border-radius: 20px"><br>

						<p>아직 회원이 아니신가요?</p>
						
						<button class="ghost" id="signUp">Sign Up</button>
					</form>
				</div>
			</div>

		</div>





	</div>
	
<a href='./'><br>메인페이지로 돌아가기</a>

</body>
</html>