<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 로그인</title>
<c:choose>
	<c:when test="${login.id == null }">
		<script type="text/javascript">
			alert("아이디와 비밀번호를 다시 확인하세요.")
			history.back();
		</script>
	</c:when>

	<c:otherwise>
		<script type="text/javascript">
		alert("${sessionScope.id}님, 환영합니다!")
			location.href="./"
		</script>
	</c:otherwise>
</c:choose>
</head>
<body>
</body>
</html>