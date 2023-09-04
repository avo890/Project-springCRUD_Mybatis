<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${empty sessionScope.id}">
	<script type="text/javascript">
		location.href = "./Login"
	</script>
</c:if>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>상품 수정</title>

<link href="./css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="./css/member3.css">
<script src="./js/jquery-3.5.1.min.js" type="text/javascript"></script>
<script src="./js/bootstrap.min.js" type="text/javascript"></script>
<script src="./js/jquery.validate.min.js" type="text/javascript"></script>
<script src="./js/validityProduct.js" type="text/javascript"></script>

<script type="text/javascript" src="./resources/ckeditor/ckeditor.js"></script>



</head>

<body>
	<script type="text/javascript">
		console.log("${productDTO.productPassword}")
	</script>

	<script type="text/javascript">
		function passwordCheck() {

			if ("${productDTO.productPassword}" != $("#productPassword").val()) {
				alert("비밀번호가 일치하지 않습니다.");
			} else {
				$("#product").submit();
			}
		}
	</script>



	<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
				<fieldset>
					<legend> &nbsp;&nbsp;상품 수정 </legend>
				</fieldset>

				<form action="./ProductUpdate" method="post" id="product"
					enctype="multipart/form-data">

					<div class="row">
						<div class="col-md-12">
							<label for="productno"> 상품코드 </label> <input type="text"
								class="form-control" id="productno" name="productno"
								value="${productDTO.productno}" readonly>
						</div>


					</div>


					<p>
						<label for="productPassword"> 상품 관리 비밀번호 확인 </label> <input
							type="text" class="form-control" id="productPassword"
							name="productPassword" maxlength="6"
							placeholder="상품 관리 비밀번호 확인.(영숫자 최대 6자리)">
					</p>

					<p>
						<label for="productName"> 상품이름 </label> <input type="text"
							class="form-control" id="productName" name="productName"
							maxlength="20" placeholder="20자리까지 입력가능"
							value="${productDTO.productName}">
					</p>

					<p>
						<label for="salesPrice"> 판매가격 </label> <input type="text"
							class="form-control" id="salesPrice" name="salesPrice"
							maxlength="9" placeholder="9자리까지 입력가능."
							value="${productDTO.salesPrice}">
					</p>

					<p>
						<label for="inventoryQTY"> 재고수량 </label> <input type="text"
							class="form-control" id="inventoryQTY" name="inventoryQTY"
							maxlength="6" placeholder="십만(100,000)단위까지 입력가능."
							value="${productDTO.inventoryQTY}">

					</p>

					<input type="hidden" name="id" id="id" value="${sessionScope.id}">

					<p>
						<label for="productInfo"> 상품 설명 및 이미지 등록</label> [*이미지 크기 조절 확인
						필수!*]
						<textarea class="form-control" id="productInfo" name="productInfo"></textarea>
						<script type="text/javascript">
							CKEDITOR.replace('productInfo', {
								width : '100%',
								height : '400px',
								filebrowserUploadUrl : "./ProductUpload"
							});

							document
									.querySelector('form')
									.addEventListener(
											'submit',
											function() {
												var productInfo = CKEDITOR.instances.editor1
														.getData();
												document
														.getElementById('productInfo').value = productInfo;

											});
						</script>

					</p>

					<div class="row">
						<div class="col-md-6">
							<!-- 	<button type="button" id="large" onclick="passwordCheck()" type="submit">수정완료</button> 타입submit이 문제 -->
							<input type="button" class="btn btn-primary" id="product_submit"
								value="수정완료" onclick="passwordCheck()">


						</div>
						<div class="col-md-6">
							<button id="large" type="reset">수정 취소</button>
						</div>
					</div>
				</form>
		
				<div>
					<br>
					<button id="large" onclick="location.href='./ProductSelectDetail?productno=${productDTO.productno}'">[${productDTO.productName}]의
						상세 정보로 돌아가기</button>
				</div>

			</div>
		</div>
	</div>

</body>
</html>