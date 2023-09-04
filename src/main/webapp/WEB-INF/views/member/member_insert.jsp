<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입</title>


<link href="./css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="./css/member3.css">
<script src="./js/jquery-3.5.1.min.js" type="text/javascript"></script>
<script src="./js/bootstrap.min.js" type="text/javascript"></script>
<script src="./js/jquery.validate.min.js" type="text/javascript"></script>
<script src="./js/validity.js" type="text/javascript"></script>


<script type="text/javascript">
	$(function() {
		$('#birthday').datepicker({
			format : "yyyymmdd",
			autoclose : true,
			daysOfWeekDisabled : [ 0, 6 ],
			templates : {
				leftArrow : '<i class="fa fa-caret-left"></i>',
				rightArrow : '<i class="fa fa-caret-right"></i>'
			},
			showWeekDays : true,
			todayHighlight : true,
			toggleActive : true,
			weekStart : 0,
			language : "ko"
		});
	});
</script>

<script type="text/javascript">
	$(function() {

		$(".dbidCheck").click(function() {
			var id = $('#id').val();
			if (id.trim() === "") {
				return;
			}

			$.ajax({
				url : './IdCheck',
				type : 'get',

				data : {
					"id" : id
				},
				success : function(result) {

					console.log("아이디 값 - " + result.result);
					//alert(result);
					if ($.trim(result.result) == 1) {
						alert("이미 등록된 아이디입니다.");
						$("#id").focus();

					}
					if ($.trim(result.result) == 0) {
						alert("등록할 수 있는 아이디입니다.");
						$('#idCheck').val("1");
						$("#name").focus();

					}
				}
			});
		});
		$("input[id='id']").on("change", function() {

			$("#idCheck").val(0);


		});

	});
</script>

</head>

<body>

	<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
				<form action="./MemberInsert" method="post" id="signupForm"
					enctype="application/x-www-form-urlencoded">
					<fieldset>
						<legend> &nbsp;&nbsp;회원 등록</legend>


						<div class="row">
							<div class="col-md-9">
								<label for="id"> </label> <input type="text"
									class="form-control" id="id" name="id"
									placeholder="아이디는 영문/숫자 3~15자 이내 등록 가능">
							</div>
							<div class="col-md-3">
								<br>
								<button type="button" class="dbidCheck" id="mini">중복체크</button>
								<input type="hidden" name="idCheck" id="idCheck">

							</div>
						</div>


						<div>
							<label for="password"></label> <input type="text"
								class="form-control" id="password" name="password"
								placeholder="비밀번호는 영문/숫자 8~16자 이내 등록 가능">

						</div>
						<div>
							<label for="pwdre"></label> <input type="text"
								class="form-control" id="pwdre" name="pwdre"
								placeholder="비밀번호 재확인">

						</div>

						<div>
							<label for="name"></label> <input type="text"
								class="form-control" id="name" name="name"
								placeholder="이름은 한글15자,영문30자까지 등록가능">

						</div>


						<div class="row">
							<div class="col-md-9">
								<label for="phoneNum"> </label><input type="text"
									class="form-control" id="phoneNum" name="phoneNum"
									maxlength="11" placeholder="핸드폰번호 '-' 빼고 010을 포함한 11자리 등록">

							</div>
							<div class="col-md-3">
								<label for="certifiedNum"></label>
								<button class="ghost" id="mini">인증번호발송</button>

							</div>
						</div>

						<div class="row">
							<div class="col-md-9">
								<label for="certifiedNum"> </label><input type="text"
									class="form-control" id="certifiedNum" name="certifiedNum"
									maxlength="6" placeholder="인증번호6자리">

							</div>
							<div class="col-md-3">
								<label for="certifiedNum"></label>
								<button class="ghost" id="mini">확인</button>

							</div>
						</div>

						<div>
							<label for="eMail"></label> <input type="text"
								class="form-control" id="email" name="email"
								placeholder="이메일주소 abc@email.com 형식으로 등록가능">

						</div>
						<div>
							<label for="birthday"></label> <input type="text"
								class="form-control" id="birthday" name="birthday"
								placeholder="생년월일 구분자 없이YYYYMMDD 형식으로 등록">

						</div>


						<div>
							<label for="gender"></label> <input type="text"
								style="background-color: white;" class="form-control" value="성별"
								disabled>


						</div>
						<div style="vertical-align: middle;">
							<input name="genderbox" style="text-align: center;"
								class="col-md-2" value="▷남성" disabled> <input
								type="radio" name="gender" value="남"> <input
								name="genderbox" style="text-align: center; margin-left: 13%;"
								value="▷여성" class="col-md-2" disabled> <input
								type="radio" name="gender" value="여"> <input
								name="genderbox" style="text-align: center; margin-left: 13%;"
								value="▷미선택" class="col-md-2" disabled> <input
								type="radio" name="gender" value="무">

						</div>


						<div class="custom-control custom-checkbox">
							<input type="checkbox" class="custom-control-input"
								id="agreement" name="agreement" required><br> <label
								class="custom-control-label" for="agreement">개인정보 수집 및
								이용에 동의합니다.</label>
						</div>
						<div class="mb-4"></div>
						<button id="large" type="submit">가입 완료</button>
					</fieldset>
				</form>
				<div class="row">
					<div class="col-md-6">
						<br>
						<button id="large" onclick="location.href='./Login'">로그인</button>
					</div>
					<div class="col-md-6">
						<br>
						<button id="large" onclick="location.href='./'">메인홈</button>
					</div>
				</div>
			</div>
		</div>

	</div>


</body>

</html>