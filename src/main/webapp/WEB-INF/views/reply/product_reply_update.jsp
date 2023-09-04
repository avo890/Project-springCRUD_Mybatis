<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>댓글 수정</title>
<link href="./css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="./css/product_selectDetail.css">
<script src="./js/jquery-3.5.1.min.js" type="text/javascript"></script>
<script src="./js/bootstrap.min.js" type="text/javascript"></script>
<script src="./js/jquery.validate.min.js" type="text/javascript"></script>

<script type="text/javascript">
	function productReplyDelete() {

		if ("${reply.replyPassword}" != $("#replyPassword").val()) {
			alert("비밀번호가 일치하지 않습니다.");
		} else {
			if (confirm("${reply.replyno}번 댓글을 삭제 하시겠습니까?"))
				location.href = "./ProductReplyDelete?replyno=${reply.replyno}&productno=${reply.productno}"
		}

	}
</script>

</head>
<body>

	<script type="text/javascript">
		console.log("${reply.replyPassword}")
	</script>

	<script type="text/javascript">
		function passwordCheck() {

			if ("${reply.replyPassword}" != $("#replyPassword").val()) {
				alert("비밀번호가 일치하지 않습니다.");
			} else {
				$("#productReply").submit();
			}
		}
	</script>

	<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">

				<form method="post" action="./ProductReplyUpdate" id="productReply">
					<input type="hidden" id="productno" name="productno"
						value="${reply.productno}">
					<p>
						댓글번호 <input type="text" class="mini3" id="replyno" name="replyno"
							value="${reply.replyno}" readonly>
					</p>
					<p>
						<label>댓글 작성자</label> <input type="text" class="mini3"
							id=id name="id" value="${sessionScope.id}" readonly>
						/<label>댓글 비밀번호</label> <input class="mini3" type="text"
							maxlength="6" id=replyPassword name="replyPassword"
							placeholder="영숫자 최대6글자">
					</p>

					<p>
						<textarea id=mini2 rows="5" cols="80" name="content"
							maxlength="300" placeholder="댓글은 최대 300자까지 입력가능합니다.">${reply.content}</textarea>
					</p>
					<p>
						<input type="button" class="mini3" value="댓글 수정"
							onclick="passwordCheck()"> <input type="button"
							class="mini3" value="댓글 삭제" onclick="productReplyDelete()">

					</p>


				</form>

			</div>
		</div>
	</div>

</body>



</html>