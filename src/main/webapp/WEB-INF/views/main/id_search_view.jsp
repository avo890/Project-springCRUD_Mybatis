<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>아이디 찾기</title>
<link href="./css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="./css/login_search.css">
<script src="./js/jquery-3.5.1.min.js" type="text/javascript"></script>
<script src="./js/bootstrap.min.js" type="text/javascript"></script>

</head>
<body>

	<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
				<fieldset>

					<legend> &nbsp;&nbsp;아이디 찾기 결과</legend>


					<div class="row pb-1 justify-content-center">
						<div class="col-10 col-sm-10">
							<hr class="base_hr">
						</div>

						<div class="row pb-1 justify-content-center">[검색한 아이디의 정보]</div>
					</div>




					<c:choose>
						<c:when test="${!empty searchId.id}">
							<div class="row pb-1 justify-content-center">

								찾으시는 아이디는 <b class="text-danger">${searchId.id}</b> 입니다.<br>

							</div>
						</c:when>
						<c:otherwise>
							<div class="row pb-1 justify-content-center">
								<p class="text-danger">찾으시는 아이디가 존재하지 않습니다.</p>

							</div>
						</c:otherwise>
					</c:choose>

					<div class="row pb-1 justify-content-center">
						<div class="col-10 col-sm-10">
							<hr class="base_hr">

						</div>
					</div>
				</fieldset>
				<button type="button" id="large" onclick="history.back()">다시
					찾기</button>
				<div class="row">
					<div class="col-md-4">
						<br>
						<button id="large" onclick="location.href='./Login'">로그인</button>

					</div>

					<div class="col-md-4">
						<br>
						<button id="large" onclick="location.href='./SearchPassword'">비밀번호
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