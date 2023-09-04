<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:if test="${empty sessionScope.id}">
<script type="text/javascript">
location.href="./Login"
</script>
</c:if>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원 목록</title>
<link href="./css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="./css/member_select.css">
<script src="./js/jquery-3.5.1.min.js" type="text/javascript"></script>
<script src="./js/bootstrap.min.js" type="text/javascript"></script>
<script src="./js/jquery.validate.min.js" type="text/javascript"></script>
<script type="text/javascript">
	$(function() {
		$("#limit").change(function() {
			location.href = "./MemberSelect?limit=" + $(this).val();
		});
		if ("${!empty limit}") {
			$("#limit").val("${limit}").prop('selected', true);
		}
		;
	});
</script>
</head>
<body>


	<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
				<fieldset>
					<legend> &nbsp;&nbsp; 회원목록 </legend>
				</fieldset>




				<div class="row">
					<div class="col-md-12">
						<div class="card">

							<c:choose>
								<c:when test="${empty sessionScope.id}">
       로그인해주세요!
              </c:when>
								<c:otherwise>
									<c:if test="${!empty sessionScope.id}">
			        ${sessionScope.id} 님, 환영합니다.
			</c:if>
								</c:otherwise>
							</c:choose>




							<table class="table table-hover">
								<thead class="thead-light">
									<tr class="text-center">
										<th>번호</th>
										<th>아이디</th>
										<th>이름</th>
										<th>이메일</th>
										<th>회원 상세 보기</th>

									</tr>
								</thead>
								<tbody>


									<c:forEach var="list" items="${list}">
										<tr class="text-center">
											<td>${list.num}</td>
											<td>${list.id}</td>
											<td>${list.name}</td>
											<td>${list.email}</td>
											<td><a href="./MemberSelectDetail?id=${list.id}"
												class="btn btn-outline-danger"> 회원 상세 보기 </a></td>
									</c:forEach>

									<c:if test="${empty list}">
										<tr>
											<td colspan="8" align="center">등록된 회원이 없습니다.</td>
										</tr>
									</c:if>



								</tbody>
							</table>



						</div>

					</div>
				</div>
				<div class="row">
					<div class="col-md-6">
						<br>
						<button id="large" onclick="ProductSelectAll">
							상품 목록</button>
					</div>
					<div class="col-md-6">
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