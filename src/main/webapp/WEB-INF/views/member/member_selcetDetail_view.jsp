<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원상세조회</title>
<link href="./css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="./css/member_select.css">
<script src="./js/jquery-3.5.1.min.js" type="text/javascript"></script>
<script src="./js/bootstrap.min.js" type="text/javascript"></script>
<script src="./js/jquery.validate.min.js" type="text/javascript"></script>
<script type="text/javascript">
	function memberDelete() {
		if (confirm("${memberDTO.name}님 회원을 탈퇴 하시겠습니까?")) {
			location.href = "./MemberDelete?id=${memberDTO.id}"
		}
	}
</script>
</head>
<body>


	<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
				<fieldset>
					<legend> &nbsp;&nbsp; ${memberDTO.id} 님의 상세 정보</legend>
				</fieldset>




				<div class="row">
					<div class="col-md-12">
						<div class="card">






							<table class="table table-hover">
								<thead class="thead-light">
									<tr class="text-center">
										<th>번호</th>
										<th>아이디</th>
										<th>비밀번호</th>
										<th>이름</th>
										<th>핸드폰번호</th>
										<th>이메일</th>
										<th>생년월일</th>
										<th>성별</th>

									</tr>
								</thead>

								<tbody>

									<tr class="text-center">
										<td>${memberDTO.num}</td>
										<td>${memberDTO.id}</td>
										<td>${memberDTO.password}</td>
										<td>${memberDTO.name}</td>
										<td>${memberDTO.phoneNum}</td>
										<td>${memberDTO.email}</td>
										<td>${memberDTO.birthday}</td>
										<td>${memberDTO.gender}</td>



									</tr>

								</tbody>
							</table>



						</div>

					</div>
				</div>



				<div class="row">
					<div class="col-md-4">
						<br>
						<c:choose>
							<c:when test="${sessionScope.id == 'admin'}">
								<button id="large" onclick="location.href='./MemberSelectAll'">전체
									목록</button>
							</c:when>
							<c:otherwise>
								<c:if test="${sessionScope.id != 'admin'}">
									<button id="large" onclick="location.href='./'">메인 홈</button>
								</c:if>
							</c:otherwise>
						</c:choose>
					</div>
					<div class="col-md-4">
						<br>
						<button id="large"
							onclick="location.href='./MemberUpdate?id=${memberDTO.id}'">회원
							수정</button>
					</div>
					<div class="col-md-4">
						<br>
						<button id="large" onclick="memberDelete()">회원 삭제</button>

					</div>
				</div>
			</div>

		</div>
	</div>


</body>



</html>