<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 확인</title>


<script type="text/javascript">
	$(function() {

		$(".dbidCheck").click(function() {
			var id = $('#id').val();
			if (id.trim() === "") {
				return;
			}

			$.ajax({
				url : './IdCheck',
				type : 'get',

				data : {
					"id" : id
				},
				success : function(result) {

					console.log("아이디 값 - " + result.result);
					//alert(result);
					if ($.trim(result.result) == 0) {
						alert("이미 등록된 아이디입니다.");
						$("#id").focus();
						history.back();
					}
					if ($.trim(result.result) == 1) {
						alert("등록할 수 있는 아이디입니ek.");
						$('#idCheck').val("0");
						$("#name").focus();
						history.back();
					}
				}
			});
		});
		$("input[id='id']").on("change", function() {

			$("#idCheck").val(1);
			history.back();


		});

	});
</script>



</head>
<body>
</body>
</html>