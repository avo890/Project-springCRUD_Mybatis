<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>비밀번호 찾기</title>
<link href="./css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="./css/login_search.css">
<script src="./js/jquery-3.5.1.min.js" type="text/javascript"></script>
<script src="./js/bootstrap.min.js" type="text/javascript"></script>
<script src="./js/jquery.validate.min.js" type="text/javascript"></script>
<script src="./js/validity.js" type="text/javascript"></script>
</head>
<body>



	<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
				<fieldset>

					<legend> &nbsp;&nbsp;비밀번호 찾기</legend>



			
						<form action="./SearchPassword" method="post" id="signupForm"
							enctype="application/x-www-form-urlencoded">

							<div class="form-group">
								<label for="id"></label>
								<input type="text" name="id" id="id" class="form-control"
									placeholder="등록하신 아이디를 정확히 입력하세요."> <label for="phoneNum"></label> <input
									type="text" name="phoneNum" id="phoneNum" class="form-control"
									placeholder="등록하신 핸드폰번호를 '-'없이 11자리 입력하세요.">
							</div>
							<button type="submit" id="large"
								>비밀번호 찾기</button>
						</form>
			

				</fieldset>

				<div class="row">
					<div class="col-md-4">
						<br>
						<button id="large" onclick="location.href='./Login'">
							로그인</button>

					</div>

					<div class="col-md-4">
						<br>
						<button id="large"
							onclick="location.href='./SearchId'">비밀번호
							찾기</button>
					</div>
					<div class="col-md-4">
						<br>
						<button id="large" onclick="location.href='./'">
							메인홈</button>

					</div>
				</div>

			</div>
		</div>
	</div>




</body>
</html>