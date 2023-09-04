<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Stationery shop</title>


<link href="./css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="./css/mainpage.css">
<script src="./js/jquery-3.5.1.min.js" type="text/javascript"></script>
<script src="./js/bootstrap.min.js" type="text/javascript"></script>
<script src="./js/mainpage.js?ver=1" type="text/javascript"></script>


</head>
<body>

	<main class="main">

		<section class="home">

			<h1>
				Welcome to the <span>Stationery shop</span>
			</h1>
			<c:choose>
				<c:when test="${empty sessionScope.id}">
       로그인해주세요!
       <button id="sign-up" class="btn"
						onclick="location.href='./MemberInsert'">회원가입</button>

				</c:when>
				<c:otherwise>
					<c:if test="${!empty sessionScope.id}">
			        ${sessionScope.id} 님, 환영합니다.
			        	<button id="sign-in" class="btn"
						onclick="location.href='./MemberSelectDetail?id=${sessionScope.id}'">회원페이지</button>
			        
			</c:if>
				</c:otherwise>
			</c:choose>

			<c:if test="${sessionScope.id == 'admin'}">
			     
			        	<button id="sign-in" class="btn"
						onclick="location.href='./MemberSelectAll'">회원관리</button>
			        
			</c:if>






			<c:choose>
				<c:when test="${empty sessionScope.id}">
					<button id="sign-in" class="btn" onclick="location.href='./Login'">로그인</button>
				</c:when>
				<c:otherwise>
					<button id="sign-in" class="btn" onclick="location.href='./Logout'">로그아웃</button>
				</c:otherwise>
			</c:choose>



			<c:choose>
				<c:when test="${!empty sessionScope.id}">
					<button id="sign-in" class="btn"
						onclick="location.href='./ProductSelectAll'">상품목록</button>
				</c:when>
				<c:otherwise>
					<button id="sign-up" class="btn"
						onclick="location.href='./Login'">상품목록</button>
				</c:otherwise>
			</c:choose>


		</section>
	</main>




</body>
</html>