<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>상품 목록</title>
<link href="./css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="./css/member_select.css">
<script src="./js/jquery-3.5.1.min.js" type="text/javascript"></script>
<script src="./js/bootstrap.min.js" type="text/javascript"></script>
<script src="./js/jquery.validate.min.js" type="text/javascript"></script>
<script type="text/javascript">
	$(function() {
		$("#limit").change(function() {
			location.href = "./ProductSelect?limit=" + $(this).val();
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
					<legend> &nbsp;&nbsp; 상품 목록 </legend>
				</fieldset>




				<div class="row">
					<div class="col-md-12">
						<div class="card">



							<table class="table table-hover">
								<thead class="thead-light">
									<tr class="text-center">
										<th>번호</th>
										<th>상품번호</th>
										<th>상품이름</th>
										<th>가격</th>
										<th>상품 상세 보기</th>

									</tr>
								</thead>
								<tbody>
			

											<c:forEach var="productlist" items="${productlist}">
												<tr class="text-center">
													<td>${productlist.num}</td>
													<td>${productlist.productno}</td>
													<td>${productlist.productName}</td>
													<td>${productlist.salesPrice}</td>
													<td><a
														href="./ProductSelectDetail?productno=${productlist.productno}"
														class="btn btn-outline-danger"> 상품 상세 보기 </a></td>
											</c:forEach>
									
										<c:if test="${empty productlist}">
											<tr>
												<td colspan="8" align="center">등록된 상품이 없습니다.</td>
											</tr>
										</c:if>


		
								</tbody>
							</table>

						</div>

					</div>
				</div>


				<div class="row">
		
		
				
							<div class="col-md-4">
								<br>
								<button id="large"
									onclick="location.href='./MemberSelectDetail?id=${sessionScope.id}'">
								${sessionScope.id}님의 회원 페이지</button>
							</div>


					<div class="col-md-4">
						<br>
						<button id="large" onclick="location.href='./ProductInsert'">
							상품 등록</button>
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