<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<head>
  <title>Shoppers &mdash; Colorlib e-Commerce Template</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Mukta:300,400,700">
  <link rel="stylesheet" href="fonts/icomoon/style.css">

  <link rel="stylesheet" href="css/bootstrap.min.css">
  <link rel="stylesheet" href="css/magnific-popup.css">
  <link rel="stylesheet" href="css/jquery-ui.css">
  <link rel="stylesheet" href="css/owl.carousel.min.css">
  <link rel="stylesheet" href="css/owl.theme.default.min.css">


  <link rel="stylesheet" href="css/aos.css">

  <link rel="stylesheet" href="css/style.css">

</head>

<body>

  <div class="site-wrap">
    <div class="bg-light py-3">
      <div class="container">
        <div class="row">
          <div class="col-md-12 mb-0"><a href="index.html">Home</a> <span class="mx-2 mb-0">/</span> <strong
              class="text-black">Sign up</strong></div>
        </div>
      </div>
    </div>

    <div class="site-section">
      <div class="container">
        <div class="row justify-content-md-center">
          <div class="col-md-7">
            <h2 class="h3 mb-3 text-black">회원가입</h2>

            <form action="#" method="post">

              <div class="p-3 p-lg-5 border">
                <div class="form-group row">
                  <div class="col-md-6">
                    <label for="c_email" class="text-black">이메일 <span class="text-danger">*</span></label>
                    <input type="email" class="form-control" id="c_email" name="c_email" placeholder="">
                  </div>
                </div>

                <div class="form-group row">
                  <div class="col-md-6">
                    <label for="c_email2" class="text-black">이메일 인증번호 <span class="text-danger">*</span></label>
                    <input type="text" class="form-control" id="c_email2" name="c_email2" placeholder="">
                  </div>
                  <div class="col-md-6">
                    <br>
                    <label for="space" class="text-black"></label>
                    <button type="submit" class="btn btn-primary mb-2" onclick="sendVerification()" id="verificationBtn">인증번호 받기</button>
                  </div>
                </div>

                <div class="form-group row">
                  <div class="col-md-6">
                    <label for="c_pw" class="text-black">비밀번호 <span class="text-danger">*</span></label>
                    <input type="password" class="form-control" id="c_pw" name="c_pw" placeholder="최소 8자 이상이어야 합니다.">
                  </div>
                  <div class="col-md-6">
                    <label for="c_pw2" class="text-black">비밀번호 확인 <span class="text-danger">*</span></label>
                    <input type="password" class="form-control" id="c_pw2" name="c_pw2">
                  </div>
                  <!-- 비밀번호 경고 메시지 -->
                  <div id="password-warning" class="col-md-12 text-danger"></div>
                </div>

              <div class="form-group row">
                <div class="col-md-6">
                  <label for="c_name" class="text-black">이름 </label>
                  <input type="text" class="form-control" id="c_name" name="c_name">
                </div>
              </div>
              <div class="form-group row">
                <div class="col-md-12">
                  <label for="c_addr" class="text-black">주소 </label>
                  <input type="text" class="form-control" id="c_addr" name="c_addr">
                </div>
              </div>
              <div class="form-group row">
                <div class="col-md-6">
                  <label for="c_phone" class="text-black">전화번호 </label>
                  <input type="text" class="form-control" id="c_phone" name="c_phone" onkeyup="formatPhoneNumber(this)" maxlength="13">
                </div>
              </div>
              <div class="form-group row">
                <div class="col-lg-12">
                  <input type="submit" class="btn btn-primary btn-lg btn-block" value="Send Message">
                </div>
              </div>
          </div>
          </form>
        </div>
      </div>
    </div>
  </div>
  </div>
  <script src="js/jquery-3.3.1.min.js"></script>
  <script src="js/jquery-ui.js"></script>
  <script src="js/popper.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/owl.carousel.min.js"></script>
  <script src="js/jquery.magnific-popup.min.js"></script>
  <script src="js/aos.js"></script>
  <script src="js/main.js"></script>
  
  <!-- 이메일 인증 발송관련 스크립트 -->
  <script>
  function sendVerification() {
	  // 인증번호 발송 구현하기

	  // 알림 띄우기
	  alert("인증번호가 발송되었습니다.");
	  
	  // 버튼 레이블 변경
	  document.getElementById("verificationBtn").textContent = "인증번호 확인";
	}
  </script>
  <!-- 회원가입 전화번호탭 하이픈 정규식 -->
  <script>
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
</script>
<!-- 비밀번호칸 8자제한 -->
<script>
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
</script>

</body>