<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 삭제</title>
</head>
<body>

	
		<script type="text/javascript">
			alert("상품 (${param.replyno})의 댓글 삭제가 완료되었습니다.")
			location.href="'redirect:/ProductSelectDetail?productno=${param.productno}'"
		</script>


</body>
</html>