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

