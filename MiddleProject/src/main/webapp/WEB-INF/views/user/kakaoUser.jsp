<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>
body2 {
	font-family: Arial, sans-serif;
	background-color: #f1f1f1;
	color: #444444;
}

.container2 {
	max-width: 800px;
	margin: 0 auto;
	padding: 20px;
	background-color: #f5f5f5;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	color: black;
	font-family: Arial, sans-serif;
	border-radius: 10px;
}

.container2 h1 {
  font-weight: bold;
  font-size: 24px;
  color: #333333;
  margin-bottom: 20px;
}

.container2 p {
  font-size: 16px;
  color: #555555;
  margin-bottom: 10px;
}

h1 {
	font-size: 36px;
	margin-bottom: 30px;
}

.container2 p:last-child {
  margin-bottom: 0;
}

.container2 .main-page-link {
  display: block;
  text-align: center;
  margin-top: 30px;
  color: #333333;
  text-decoration: none;
  font-weight: bold;
}

.container2 .main-page-link:hover {
  color: #ff0000;
}

.container2 p span {
  color: red;
  font-weight: bold;
}

p {
	font-size: 18px;
	line-height: 1.6;
}

img {
	max-width: 50%;
	height: auto;
	margin-bottom: 20px;
}
</style>
</head>

<div class="container2">
	<h1>카카오 로그인 페이지</h1>
	<p>카카오 계정으로 로그인 되었습니다</p>
	<p>카카오 계정의 초기 비밀번호는 <span>test</span> 입니다. 마이페이지에서 비밀번호를 변경해주세요.</p>
	<p>약 7초 후 메인페이지로 자동으로 이동합니다</p>
	<a class="main-page-link" href="main.do">메인페이지로 이동</a>
</div>

<script type="text/javascript">
	setTimeout(function() {
		window.location.href = 'main.do';
	}, 7000); // 5초 (5000ms)
</script>
