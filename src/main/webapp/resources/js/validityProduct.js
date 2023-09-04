$(function() {
	$.validator.setDefaults({
		onkeyup : false,
		onclick : false,
		onfocusout : false,
		showErrors : function(errorMap, errorList) {
			if (this.numberOfInvalids()) { // 에러가 있으면
				alert(errorList[0].message); // 경고창으로 띄움
			}
		}
	});
	$.validator.addMethod("regex", function(value, element, regexpr) {
		return regexpr.test(value);
	});
	// JSON 형식으로 유효성 검사의 규칙을 지정한다.
	// 특수문자 / 문자 / 숫자 포함 형태의 8~15자리 이내의 암호 정규식
	// /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
	// 핸드폰 정규식 /^\d{2,3}-\d{3,4}-\d{4}$/
	$("#signupForm")
			.validate(
					{
						ignore : [],
						// 검사할 필드와 검사 항목을 나열한다.
						rules : {

							productno : {
								required : true,
								minlength : 6,
								maxlength : 6,
								regex : /^[a-zA-Z0-9]*$/
							},
							idCheck : {
								required : true
							},
							productPassword : {
								required : true,
								minlength : 4,
								// 최대길이를 지정한다.
								maxlength : 6,
								regex : /^[a-zA-Z0-9]*$/
							},

							productName : {
								required : true,
								regex : /^[0-9a-zA-Zㄱ-ㅎㅏ-ㅣ가-힣!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?]*$/
							},

							salesPrice : {
								required : true,
								maxlength : 9
							},

							inventoryQTY : {
								required : true,
								maxlength : 6
							}

						},
						// 검사를 충족하지 못하면 표시될 메시지를 나열한다.
						messages : {

							productno : {
								required : "상품코드를 입력하세요.",
								minlength : "상품코드는  {0} 글자입니다.",
								maxlength : "상품코드는  {0} 글자입니다.",
								regex : "숫자만 입력할 수 있습니다."
							},

							idCheck : {
								required : "상품코드 중복을 확인하세요.",
							},
							productPassword : {
								required : "비밀번호를 입력하세요.",
								minlength : "비밀번호는 최소 {0} 글자입니다.",
								maxlength : "비밀번호는 최대 {0} 글자입니다.",
								regex : "영어 대소문자 및 숫자만 입력할 수 있습니다."
							},

							productName : {
								required : "상품이름을 입력하세요",
							},

							salesPrice : {
								required : "가격을 입력하세요.",
								maxlength : "최대 {0} 숫자입니다."
							},
							inventoryQTY : {
								required : "재고 수량을 입력하세요.",
								maxlength : "십만(100,000)단위까지 입력가능합니다."
							},

						}

					});

});
// 낭
$(function() {
	$("#signupForm").submit(function() {
		if ($("#idCheck").val() == 0) {
			alert("상품코드 중복 확인 후 등록가능합니다.");
			return false;
		}
	});
});

// 텍스트 입력창
$(function() {
	$("#checkForm").submit(function() {
		if (!$("#password").val()) {
			alert("비밀번호를 입력하세요.");
			$("#password").focus();
			return false;
		}
		if (!$("#subject").val()) {
			alert("제목을 입력하세요.");
			$("#subject").focus();
			return false;
		}
		var content = CKEDITOR.instances['content'].getData();
		if (content == '' || content.length == 0) {

			alert("내용을 입력하세요.");
			$("#content").focus();
			return false;
		}

		if (!$("#attachedfile").val()) {
			alert("파일을 등록하세요.");
			$("#attachedfile").focus();
			return false;
		}

	});
	if (typeof CKEDITOR != 'undefined') {
		$('form')
				.on(
						'reset',
						function(e) {
							if ($(CKEDITOR.instances).length) {
								for ( var key in CKEDITOR.instances) {
									var instance = CKEDITOR.instances[key];
									if ($(instance.element.$).closest('form')
											.attr('content') == $(e.target)
											.attr('content')) {
										instance
												.setData(instance.element.$.defaultValue);
									}
								}
							}
						});
	}
});
