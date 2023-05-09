// 회원정보 변경

document.addEventListener('DOMContentLoaded', function() {
  const submitBtn = document.getElementById('submitBtn');
  const phoneInput = document.getElementById('phone');
  const addressInput = document.getElementById('address');
  const newPasswordInput = document.getElementById('newPassword');

  submitBtn.addEventListener('click', function() {
    phoneInput.readOnly = false;
    addressInput.readOnly = false;
    newPasswordInput.style.display = 'block';
  });
});

// 회원정보 변경 - 비밀번호
const passwordInput = document.getElementById('user_pw');
const passwordConfirmInput = document.getElementById('c_pw');
const passwordWarning = document.getElementById('password-warning');

function checkPasswordValidity() {
  const passwordValue = passwordInput.value;
  const passwordRegex = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&*()_+])[\w!@#$%^&*()_+]{8,}$/;

  if (!passwordValue) {
    passwordWarning.textContent = '비밀번호를 입력해주세요.';
    return false;
  } else if (!passwordRegex.test(passwordValue)) {
    passwordWarning.textContent = '영어 대소문자, 특수문자를 모두 사용하고 8자 이상으로 입력하세요.';
    alert("영어 대소문자, 특수문자를 모두 사용하고 8자 이상으로 입력하세요.")
    return false;
  } else {
    passwordWarning.textContent = '';
  }
  
  return true;
}

// 비밀번호 함수 false면 변경 중단
const submitButton = document.getElementById('submit-button');

submitButton.addEventListener('click', function(event) {
  if (!validatePassword()) {
    event.preventDefault();
  }
});


//회원정보수정 전화번호탭 하이픈 정규식

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

const newPhoneInput = document.getElementById('user_phone');
if (newPhoneInput) {
    // 하이픈을 제거한 후에 값을 설정
    newPhoneInput.value = userinfo.userPhone.replace(/-/g, '');
    
    newPhoneInput.addEventListener('input', function() {
        formatPhoneNumber(this);
    });
}

