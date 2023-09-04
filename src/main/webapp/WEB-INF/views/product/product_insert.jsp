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
<title>상품 등록</title>

<link href="./css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="./css/member3.css">
<script src="./js/jquery-3.5.1.min.js" type="text/javascript"></script>
<script src="./js/bootstrap.min.js" type="text/javascript"></script>
<script src="./js/jquery.validate.min.js" type="text/javascript"></script>
<script src="./js/validityProduct.js" type="text/javascript"></script>


<script type="text/javascript" src="./resources/ckeditor/ckeditor.js"></script>


<script type="text/javascript">
	$(function() {

		$(".dbidCheck").click(function() {
			var productno = $('#productno').val();
			if (productno.trim() === "") {
				return;
			}

			$.ajax({
				url : './ProductnoCheck',
				type : 'get',

				data : {
					"productno" : productno
				},
				success : function(result) {

					console.log("상품번호 값 - " + result.result);
					//alert(result);
					if ($.trim(result.result) == 1) {
						alert("이미 존재하는 상품번호입니다.");
						$("#productno").focus();

					}
					if ($.trim(result.result) == 0) {
						alert("등록할 수 있는 상품번호입니다.");
						$('#idCheck').val("1");
						$("#productPassword").focus();

					}
				}
			});
		});
		$("input[productno='productno']").on("change", function() {

			$("#idCheck").val(0);
		});

	});
</script>

</head>

<body>

	<form action="./ProductInsert" method="post" id=signupForm
		enctype="multipart/form-data">
		<div class="container">
			<div class="input-form-backgroud row">
				<div class="input-form col-md-12 mx-auto">
					<fieldset>
						<legend> &nbsp;&nbsp;${sessionScope.id}님의 상품 등록 관리</legend>




						<div class="row">
							<div class="col-md-9">
								<label for="productno"> 상품코드 </label> <input type="text"
									class="form-control" id="productno" name="productno"
									maxlength="6" required placeholder="상품코드 입력. (영숫자 6자리)">
							</div>
							<div class="col-md-3">
								<label> &nbsp;</label>
								<button type="button" class="dbidCheck" id="mini">중복체크</button>
								<input type="hidden" name="idCheck" id="idCheck">

							</div>
						</div>

						<p>
							<label for="productPassword"> 상품 관리 비밀번호 </label> <input
								type="text" class="form-control" id="productPassword"
								name="productPassword" maxlength="6"
								placeholder="상품 관리 비밀번호 등록.(영숫자 4-6자리)">
						</p>

						<p>
							<label for="productName"> 상품이름 </label> <input type="text"
								class="form-control" id="productName" name="productName"
								maxlength="20" placeholder="20자리까지 입력가능">
						</p>

						<p>
							<label for="salesPrice"> 판매가격 </label> <input type="text"
								class="form-control" id="salesPrice" name="salesPrice"
								maxlength="9" placeholder="9자리까지 입력가능.">
						</p>

						<p>
							<label for="inventoryQTY"> 재고수량 </label> <input type="text"
								class="form-control" id="inventoryQTY" name="inventoryQTY"
								maxlength="6" placeholder="십만(100,000)단위까지 입력가능.">
						</p>

						<input type="hidden" name="id" id="id" value="${sessionScope.id}">

						<p>
							<label for="productInfo"> 상품 설명 및 이미지 등록</label>
							[*이미지 크기 조절 확인 필수!*]
							<textarea class="form-control" id="productInfo"
								name="productInfo"></textarea>
							<script type="text/javascript">
								CKEDITOR.replace('productInfo', {
									width : '100%',
									height : '400px',
									filebrowserUploadUrl : "./ProductUpload"
								});
							
								document.querySelector('form').addEventListener('submit', function() {
								var productInfo = CKEDITOR.instances.editor1.getData();
								document.getElementById('productInfo').value = productInfo;

								});
							</script>

						</p>



						<div class="row">
							<div class="col-md-6">
								<button id="large" type="submit">전송</button>
							</div>
							<div class="col-md-6">
								<button id="large" type="reset">취소</button>
							</div>
						</div>


					</fieldset>

				</div>
			</div>
		</div>

	</form>

</body>
</html>