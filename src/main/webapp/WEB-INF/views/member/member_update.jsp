<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원 수정</title>


<link href="./css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="./css/member_update.css">
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




<style>
</style>
</head>

<body>

	<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
				<fieldset>
					<legend> &nbsp;&nbsp;${memberDTO.id}님의 정보 수정</legend>
					<form action="./MemberUpdate" method="post" id="signupForm"
						enctype="application/x-www-form-urlencoded">
						<div class="row">
							<div class="col-md-12 ">
								<label for="id"></label> <input type="text" name="id" id="id"
									class="form-control bg-white" value="${memberDTO.id}" readonly>
							</div>
						</div>


						<div>
							<label for="password"></label> <input type="text"
								class="form-control" id="password" name="password"
								value="${memberDTO.password}"
								placeholder="비밀번호 변경 : 비밀번호는 영문/숫자 8~16자 이내 등록 가능">

						</div>
						<div>
							<label for="pwdre"></label> <input type="text"
								class="form-control" id="pwdre" name="pwdre"
								placeholder="비밀번호 재확인">

						</div>

						<div>
							<label for="name"></label> <input type="text"
								class="form-control" id="name" name="name"
								value="${memberDTO.name}" placeholder="이름은 한글15자,영문30자까지 등록가능">

						</div>


						<div>

							<label for="phoneNum"> </label><input type="text"
								class="form-control" id="phoneNum" name="phoneNum"
								maxlength="11" value="${memberDTO.phoneNum}"
								placeholder="핸드폰번호 '-' 빼고 010을 포함한 11자리 등록">
						</div>




						<div>
							<label for="eMail"></label> <input type="text"
								class="form-control" id="email" name="email"
								value="${memberDTO.email}"
								placeholder="이메일주소 수정 : abc@email.com 형식으로 등록가능">

						</div>
						<div>
							<label for="birthday"></label> <input type="text"
								class="form-control" id="birthday" name="birthday"
								value="${memberDTO.birthday}"
								placeholder="생년월일 수정 : 구분자 없이YYYYMMDD 형식으로 등록">

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


						<div class="row">
							<div class="col-md-6">
								<br>
								<button id="large" type="submit">수정 완료</button>
							</div>

							<div class="col-md-6">
								<br>
								<button id="large" type="reset">수정 취소</button>
							</div>


						</div>

					</form>
					<c:if test="${sessionScope.id == 'admin'}">
						<div>
							<br>
							<button id="large" onclick="location.href='./MemberSelectAll'">전체
								목록으로 돌아가기</button>
						</div>
					</c:if>
					<div>
						<br>
						<button id="large"
							onclick="location.href='./MemberSelectDetail?id=${memberDTO.id}'">${memberDTO.id}님의
							상세 정보로 돌아가기</button>
					</div>

				</fieldset>

			</div>
		</div>

	</div>


</body>

</html>