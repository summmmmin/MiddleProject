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

const userPhoneInput = document.getElementById('user_phone');
userPhoneInput.addEventListener('keyup', function() {
	formatPhoneNumber(this);
});


// 비밀번호 유효성 검사와 일치 여부 검사
const passwordInput = document.getElementById('user_pw');
const passwordConfirmInput = document.getElementById('c_pw2');
const passwordWarning = document.getElementById('password-warning');

function checkPasswordValidity() {
	const passwordValue = passwordInput.value;
	const passwordRegex = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&*()_+])[\w!@#$%^&*()_+]{8,}$/;

	if (!passwordValue) {
		passwordWarning.textContent = '비밀번호를 입력해주세요.';
	} else if (!passwordRegex.test(passwordValue)) {
		passwordWarning.textContent = '영어 대소문자, 특수문자를 모두 사용하고 8자 이상으로 입력하세요.';
	} else {
		passwordWarning.textContent = '';
	}
}

function checkPasswordMatch() {
	const passwordValue = passwordInput.value;
	const passwordConfirmValue = passwordConfirmInput.value;

	if (passwordValue !== passwordConfirmValue) {
		passwordWarning.style.color = 'red';
		passwordWarning.textContent = '비밀번호와 비밀번호 확인 값이 일치하지 않습니다.';
	} else {
		passwordWarning.style.color = '';
		passwordWarning.textContent = '';
	}
}

passwordInput.addEventListener('input', checkPasswordValidity);
passwordConfirmInput.addEventListener('input', checkPasswordMatch);

function formatPhoneNumber(input) {
	const pattern1 = /^(\d{0,3})(\d{0,4})(\d{0,4})$/g;
	const pattern2 = /^(\d{0,2})(\d{0,3})(\d{0,4})$/g;
	const phoneNumber = input.value.replace(/[^\d]/g, "");

	if (phoneNumber.length > 10) {
		input.value = phoneNumber.replace(pattern1, "$1-$2-$3").replace(/\-{1,2}$/g, "");
	} else {
		input.value = phoneNumber.replace(pattern2, "$1-$2-$3").replace(/\-{1,2}$/g, "");
	}
}
// 비밀번호 유효성 검사와 일치 여부 검사
passwordInput.addEventListener('input', checkPasswordValidity);
passwordConfirmInput.addEventListener('input', checkPasswordMatch);

function validateForm() {
	const pw = passwordInput.value;
	const pw2 = passwordConfirmInput.value;

	if (pw !== pw2) {
		alert('비밀번호와 비밀번호 확인 값이 일치하지 않습니다.');
		return false;
	}

	const passwordRegex = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&*()_+])[\w!@#$%^&*()_+]{8,}$/;
	if (!passwordRegex.test(pw)) {
		alert('비밀번호는 영어 대소문자, 특수문자를 모두 사용하고 8자 이상으로 입력해야 합니다.');
		return false;
	}

	return true;
}

const submitButton = document.querySelector('input[type="submit"]');
submitButton.addEventListener('click', submitForm);
submitButton.addEventListener('submit', submitForm);


function submitForm(event) {
	if (!validateForm()) {
		event.preventDefault();
	}
}



//폼 빈칸x
function redForm() {
	const user_id = document.getElementById("user_id");
	const user_pw = document.getElementById("user_pw");
	const c_pw2 = document.getElementById("c_pw2");
	const user_name = document.getElementById("user_name");
	const user_add = document.getElementById("user_add");
	const user_phone = document.getElementById("user_phone");

	if (user_id.value === "" || user_pw.value === "" || c_pw2.value === "" || user_name.value === "" || user_add.value === "" || user_phone.value === "") {
		alert("모든 사항을 기입해주세요.");
		if (user_id.value === "") {
			user_id.classList.add("form-input-error");
		}
		if (user_pw.value === "") {
			user_pw.classList.add("form-input-error");
		}
		if (c_pw2.value === "") {
			c_pw2.classList.add("form-input-error");
		}
		if (user_name.value === "") {
			user_name.classList.add("form-input-error");
		}
		if (user_add.value === "") {
			user_add.classList.add("form-input-error");
		}
		if (user_phone.value === "") {
			user_phone.classList.add("form-input-error");
		}
		return false;
	}
}