<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 수정</title>
</head>
<body>
<script type="text/javascript">
alert("${productDTO.productName} 상품 정보를 수정하였습니다.")
location.href="./ProductSelectDetail?productno=${productDTO.productno}";
</script>
</body>
</html>