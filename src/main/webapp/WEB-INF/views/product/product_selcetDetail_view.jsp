<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>상품상세조회</title>
<link href="./css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="./css/product_selectDetail.css">
<script src="./js/jquery-3.5.1.min.js" type="text/javascript"></script>
<script src="./js/bootstrap.min.js" type="text/javascript"></script>
<script src="./js/jquery.validate.min.js" type="text/javascript"></script>
<script type="text/javascript">
	function productDelete() {
		if (confirm("${productDTO.productName} 상품을 삭제 하시겠습니까?")) {
			location.href = "./ProductDelete?productno=${productDTO.productno}"
		}
	}
</script>
</head>
<body>


	<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
				<fieldset>
					<legend> &nbsp;&nbsp; ${productDTO.productName} 상품 정보</legend>
				</fieldset>






				<div class="row">
					<div class="col-md-12">
						<div class="card">
							<br>
							<p class="fs11 tPad10">
								&nbsp;&nbsp;&nbsp;&nbsp;<a href='./'><strong>Mainpage</strong></a>&nbsp;&gt;&nbsp;<a
									href='./ProductSelectAll'><strong>상품전체목록</strong></a>
							</p>

							<div class="row" style="margin: 0 auto">

								<div class="middle-left">
									<div class="row pb-1 justify-content-center">

										<div style="width: 350px;">
											<!-- 			<div style="background-image: url('./images/nana.gif')"></div>  -->
											<dl>
												<dt>
													<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[상품
													이미지 및 설명]
												</dt>
												<dd>
													<br>${productDTO.productInfo}
												</dd>
											</dl>
										</div>
									</div>
								</div>

								<div class="middle-right">

									<div class="row pb-1 justify-content-center">

										<div style="width: 350px;">


											<div class="col-12 col-sm-12">

												<hr class="base_hr">
											</div>
											<dl>
												<dt>&nbsp;&nbsp;&nbsp;상품번호&nbsp;</dt>
												<dd>${productDTO.productno}</dd>
											</dl>

											<div class="col-12 col-sm-12">
												<hr class="base_hr">
											</div>
											<dl>
												<dt>&nbsp;&nbsp;&nbsp;이름&nbsp;</dt>
												<dd>${productDTO.productName}</dd>
											</dl>

											<div class="col-12 col-sm-12">
												<hr class="base_hr">
											</div>
											<dl>
												<dt>&nbsp;&nbsp;&nbsp;가격&nbsp;</dt>
												<dd>${productDTO.salesPrice}</dd>
											</dl>

											<div class="col-12 col-sm-12">
												<hr class="base_hr">
											</div>
											<dl>
												<dt>&nbsp;&nbsp;&nbsp;재고&nbsp;</dt>
												<dd>${productDTO.inventoryQTY}</dd>
											</dl>
											<div class="col-12 col-sm-12">
												<hr class="base_hr">
											</div>
											<dl>
												<dt>&nbsp;&nbsp;&nbsp;게시일&nbsp;</dt>
												<dd>${productDTO.productPostDate}</dd>
											</dl>
											<div class="col-12 col-sm-12">
												<hr class="base_hr">
											</div>
											<dl>
												<dt>&nbsp;&nbsp;&nbsp;게시자&nbsp;</dt>
												<dd>${productDTO.id}</dd>
											</dl>
											<div class="col-12 col-sm-12">
												<hr class="base_hr">
											</div>

										</div>


									</div>

								</div>
							</div>



						</div>


					</div>


				</div>
				<c:if test="${sessionScope.id == productDTO.id}">
					<div class="row">
						<div class="col-md-6">
							<br>
							<button id="large"
								onclick="location.href='./ProductUpdate?productno=${productDTO.productno}'">상품
								수정</button>
						</div>
						<div class="col-md-6">
							<br>
							<button id="large" onclick="productDelete()">상품 삭제</button>

						</div>
					</div>
				</c:if>

				<hr />

				<ul>
					<c:forEach items="${reply}" var="reply">
						<li>댓글번호&nbsp; ${reply.replyno}
							<div id="reply">

								<p>&nbsp;&nbsp;${reply.id} / ${reply.replyPostDate}</p>
								<p>&nbsp;&nbsp;${reply.content}</p>

								<c:if test="${sessionScope.id == reply.id}">
									<div class="row">

										<div class="col-12">
											<button type="button" id="mini"
												onclick="location.href='./ProductReplyUpdate?replyno=${reply.replyno}&productno=${reply.productno}'"
												class="btn float-right">수정 및 삭제</button>

										</div>
									</div>
								</c:if>

							</div>
						</li>
					</c:forEach>
				</ul>

				<hr />
				<div>

					<form method="post" action="./ProductReply">

						<input type="hidden" id="productno" name="productno"
							value="${productDTO.productno}">

						<p>
							<label>댓글 작성자</label> <input type="text" class="mini3"
								id=id name="id" value="${sessionScope.id}"
								readonly> /<label>댓글 비밀번호</label> <input class="mini3"
								type="text" maxlength="6" id=replyPassword name="replyPassword"
								placeholder="영숫자 최대6글자">
						</p>

						<p>
							<textarea id=mini2 rows="5" cols="80" name="content"
								maxlength="300" placeholder="댓글은 최대 300자까지 입력가능합니다."></textarea>
						</p>
						<p>
							<button id="mini" type="submit">댓글 작성</button>
						</p>



					</form>

				</div>



			</div>
		</div>
	</div>

</body>



</html>