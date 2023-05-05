//회원가입 전화번호탭 하이픈 정규식

function formatPhoneNumber(input) {
	// 전화번호 포맷팅을 위한 정규식 패턴
	const pattern1 = /^(\d{0,3})(\d{0,4})(\d{0,4})$/g;
	const pattern2 = /^(\d{0,2})(\d{0,3})(\d{0,4})$/g;

	// 입력된 전화번호에서 숫자만 추출
	const phoneNumber = input.value.replace(/[^\d]/g, "");

	// 숫자만 추출한 전화번호에 따라 포맷팅 처리
	if (phoneNumber.length > 10) {
		input.value = phoneNumber.replace(pattern1, "$1-$2-$3").replace(/\-{1,2}$/g, "");
	} else {
		input.value = phoneNumber.replace(pattern2, "$1-$2-$3").replace(/\-{1,2}$/g, "");
	}
}

//비밀번호칸 최소 8자제한

//const는 한번 할당된 값이 변하지 않는 상수를 선언할 때 사용
//그에 비해 let은 값이 변할 수 있는 변수를 선언할 때 사용

const passwordInput = document.getElementById('c_pw');
const passwordConfirmInput = document.getElementById('c_pw2');
const passwordWarning = document.getElementById('password-warning');

function checkPasswordValidity() {
	if (!passwordInput.value) {
		passwordWarning.textContent = '비밀번호를 입력해주세요.';
	} else if (passwordInput.value.length < 8) {
		passwordWarning.textContent = '최소 8자 이상 입력하세요.';
	} else {
		passwordWarning.textContent = '';
	}
}

// 입력값이 바뀔 때마다 유효성 검사를 수행
passwordInput.addEventListener('keyup', checkPasswordValidity);
passwordConfirmInput.addEventListener('keyup', checkPasswordValidity);



function validatePassword() {
	var pw = document.getElementById("user_pw").value;
	var pw2 = document.getElementById("c_pw2").value;

	if (pw !== pw2) {
		alert("비밀번호와 비밀번호 확인 값이 일치하지 않습니다.");
		return false;
	}
	return true;
}
